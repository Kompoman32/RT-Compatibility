/** Only local */
if (!hasInterface) exitwith {};

if !(RT_SETTINGS_INITIALIZATION_respawn call CBA_settings_fnc_get) exitwith {};

_this spawn {
	[] call RT_UTILS_fnc_waitUntilPlayerInit;

	[player, RT_RESPAWN_VAR_CHECK_HANDLER] call Rt_Utils_fnc_removeScripthandler;

	[player, RT_RESPAWN_VAR_CHECK_HANDLER, [], {
		waitUntil {
			if (!(RT_SETTINGS_RESPAWN_enable call CBA_settings_fnc_get)) exitWith {
				sleep 10;
				false
			};

			private _needToUpdate = [player getVariable [RT_RESPAWN_VAR_TARGET, nil]] call {
				params ["_target"];
				if (isNil "_target") exitWith {true};

				if (_target isEqualTo (group player)) exitWith{false};

				true
			};

			if (_needToUpdate) then {
				[] call RT_Respawn_fnc_removeRespawn;
				[] call RT_Respawn_fnc_addRespawn;
			};

			sleep 10;
			false
		}
	}] call Rt_Utils_fnc_addScripthandler;	
}