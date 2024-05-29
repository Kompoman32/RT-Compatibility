/** Only if real player */
if (!hasInterface) exitwith {};
/** Script Works Only with Ace */
if ([] call RT_UTILS_fnc_dontHasAce) exitwith {};

// run on Local in Sheduled
if ([_this, true, false] call RT_Utils_fnc_callByScriptName) exitWith {};

params ["_event", "_JIP"];

[] call RT_UTILS_fnc_waitUntilPlayerInit;

if (_JIP) then {
	[player, "ace_glassesCracked", RT_SPECTATOR_VAR_KILLED_HANDLER] call Rt_Utils_fnc_removeCBAEventhandler;
	[player, "ace_firedPlayer", RT_FUN_VAR_FIRED_HANDLER] call Rt_Utils_fnc_removeCBAEventhandler;
};

[player, "ace_glassesCracked", RT_SPECTATOR_VAR_KILLED_HANDLER, {
	params ["_unit"];

	if (!(isPlayer _unit)) exitWith {};
	if (goggles _unit !=  "G_Goggles_VR") exitWith {};
	
	playSoundUI ["RTBoom"];
}] call Rt_Utils_fnc_addCBAEventhandler;


[player, "ace_firedPlayer", RT_FUN_VAR_FIRED_HANDLER, {
		_this spawn {
			private _ammo = _this select 4;
			private _projectile = _this select 6;
			
			if (leader player != player) exitWith {};
			if (_ammo != "SmokeShellRed" and (_ammo != "G_40mm_SmokeRed")) exitWith {};

			RT_SUPPORT_VAR_EXPRESS_ARTILLERY_PARAMS params [
				"_dropTime",
				"_artilleryAmmo",
				"_radius",
				"_rounds",
				"_roundDelay",
				"_conditionEnd",
				"_safezoneRadius",
				"_altitude",
				"_roundSpeed",
				"_sounds"
				];

			private _offsetBeforeDrop = 12.5;

			private _offset = _dropTime - _offsetBeforeDrop;

			if (_offset < 0) then {
				_offset = _offset * -1;
			} else {
				_offset = 0;
			};

			sleep _offset;

			private _soundSource = createSoundSource ["HellDiversSound", getPosATL _projectile, [], 0];

			[_soundSource] spawn {
				sleep 21.53;

				deleteVehicle (_this select 0);
			};
			
			waitUntil {
				if (isNull _projectile) exitWith {true};
				_soundSource setPosATL (getPosATL _projectile);
				sleep 0.1;
				false;
			};
		}

	}] call Rt_Utils_fnc_addCBAEventhandler;
