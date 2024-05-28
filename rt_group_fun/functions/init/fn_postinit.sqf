/** Only if real player */
if (!hasInterface) exitwith {};

params ["_event", "_JIP"];

private _handler = ["ace_glassesCracked", {
	params ["_unit"];

	if (!(isPlayer _unit)) exitWith {};
	if (goggles _unit !=  "G_Goggles_VR") exitWith {};
	
	playSoundUI ["RTBoom"];
}] call CBA_fnc_addEventHandler;

player setVariable [RT_FUN_VAR_GLASSES_CRACKED, _handler];

[] spawn {
	[] call RT_UTILS_fnc_waitUntilPlayerInit;

	private _handler = ["ace_firedPlayer", {
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

	}] call CBA_fnc_addEventHandler;

	player setVariable [RT_FUN_VAR_FIRED_HANDLER, _handler];
}