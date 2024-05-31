/** Only local */
if (!hasInterface) exitwith {};

_this spawn {
	[] call RT_UTILS_fnc_waitUntilPlayerInit;

	[player, RT_RESPAWN_VAR_CHECK_HANDLER] call Rt_Utils_fnc_removeScripthandler;

	[player, RT_RESPAWN_VAR_CHECK_HANDLER, [], {
		waitUntil {
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