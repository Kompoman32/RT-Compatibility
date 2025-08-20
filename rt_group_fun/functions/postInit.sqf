/** Only if real player */
if (!hasInterface) exitwith {};
/** Script Works Only with Ace */
if ([] call RT_UTILS_fnc_dontHasAce) exitwith {};


_this spawn {
	[] call RT_UTILS_fnc_waitUntilPlayerInit;

	["CAManBase", "explosion", {
		params ["_unit"];

		if (!(isPlayer _unit)) exitWith {};
		if (goggles _unit !=  "G_Goggles_VR") exitWith {};

		if (!(RT_SETTINGS_FUN_enable call CBA_settings_fnc_get) || !(RT_SETTINGS_FUN_enable_glasses call CBA_settings_fnc_get)) exitWith {
			[] spawn {
				private _glassesCondition = ACE_PLAYER getVariable ["ace_goggles_condition", [false, [false, 0,0,0], false]];
				_glassesCondition set [0, false];
				ACE_PLAYER setVariable ["ace_goggles_condition", _glassesCondition];

				[ACE_PLAYER, goggles ACE_PLAYER] call ace_goggles_fnc_applyGlassesEffect;
			};
		};
	}] call CBA_fnc_addClassEventHandler;


	[player, "ace_glassesCracked", RT_FUN_VAR_GLASSES_CRACKED] call Rt_Utils_fnc_removeCBAEventhandler;
	[player, "ace_glassesCracked", RT_FUN_VAR_GLASSES_CRACKED, {
		params ["_unit"];

		if (!(isPlayer _unit)) exitWith {};
		if (goggles _unit !=  "G_Goggles_VR") exitWith {};

		if (!(RT_SETTINGS_FUN_enable call CBA_settings_fnc_get) || !(RT_SETTINGS_FUN_enable_glasses call CBA_settings_fnc_get)) exitWith {
			[] spawn {
				private _glassesCondition = ACE_PLAYER getVariable ["ace_goggles_condition", [false, [false, 0,0,0], false]];
				_glassesCondition set [2, false];
				ACE_PLAYER setVariable ["ace_goggles_condition", _glassesCondition];

				[ACE_PLAYER, goggles ACE_PLAYER] call ace_goggles_fnc_applyGlassesEffect;
			};
		};
		
		playSoundUI ["RTBoom"];
	}] call Rt_Utils_fnc_addCBAEventhandler;


	[player, "ace_firedPlayer", RT_FUN_VAR_FIRED_HANDLER] call Rt_Utils_fnc_removeCBAEventhandler;
	[player, "ace_firedPlayer", RT_FUN_VAR_FIRED_HANDLER, {
		params ["_unit"];

		if (_unit != player) exitWith {};

		if (!(RT_SETTINGS_FUN_enable call CBA_settings_fnc_get) || !(RT_SETTINGS_FUN_enable_helldivers_artillery call CBA_settings_fnc_get)) exitWith {};
		if (!(RT_SETTINGS_SUPPORT_enable_artillery call CBA_settings_fnc_get)) exitWith {};

		_this spawn {
			private _ammo = _this select 4;
			private _projectile = _this select 6;
			
			if (leader player != player) exitWith {};
			if (_ammo != "SmokeShellRed" and (_ammo != "G_40mm_SmokeRed")) exitWith {};

			RT_SUPPORT_VAR_EXPRESS_ARTILLERY_PARAMS params ["_dropTime"];

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

	// Arsenal music
	[missionNamespace, "ace_arsenal_displayOpened", RT_FUN_VAR_ACE_ARSENAL_OPENED_HANDLER] call Rt_Utils_fnc_removeCBAEventhandler;
	[missionNamespace, "ace_arsenal_displayOpened", RT_FUN_VAR_ACE_ARSENAL_OPENED_HANDLER, RT_FUN_fnc_onOpenArsenal] call Rt_Utils_fnc_addCBAEventhandler;

	[missionNamespace, "ace_arsenal_displayClosed", RT_FUN_VAR_ACE_ARSENAL_CLOSED_HANDLER] call Rt_Utils_fnc_removeCBAEventhandler;
	[missionNamespace, "ace_arsenal_displayClosed", RT_FUN_VAR_ACE_ARSENAL_CLOSED_HANDLER, RT_FUN_fnc_onCloseArsenal] call Rt_Utils_fnc_addCBAEventhandler;

	[missionNamespace, "arsenalOpened", RT_FUN_VAR_ARSENAL_OPENED_HANDLER] call Rt_Utils_fnc_removeScriptedEventhandler;
	[missionNamespace, "arsenalOpened", RT_FUN_VAR_ARSENAL_OPENED_HANDLER, RT_FUN_fnc_onOpenArsenal] call Rt_Utils_fnc_addScriptedEventhandler;

	[missionNamespace, "arsenalClosed", RT_FUN_VAR_ARSENAL_CLOSED_HANDLER] call Rt_Utils_fnc_removeScriptedEventhandler;
	[missionNamespace, "arsenalClosed", RT_FUN_VAR_ARSENAL_CLOSED_HANDLER, RT_FUN_fnc_onCloseArsenal] call Rt_Utils_fnc_addScriptedEventhandler;
}