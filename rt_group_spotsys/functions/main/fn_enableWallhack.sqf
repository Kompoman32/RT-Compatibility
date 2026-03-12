if !(RT_SETTINGS_SPOTSYSTEM_enable call CBA_settings_fnc_get) exitWith {};
if !(call RT_SpotSystem_fnc_isWallhackEnabled) exitWith {};

params [["_enable", true]];

if (_enable) then {
	[missionNamespace, RT_SPOTSYS_VAR_WALLHACK_HANDLER] call RT_Utils_fnc_removeScriptHandler;
	[missionNamespace, RT_SPOTSYS_VAR_WALLHACK_HANDLER, [], {
        waitUntil {
			if !(RT_SETTINGS_SPOTSYSTEM_enable call CBA_settings_fnc_get) exitWith {true};
            if !(call RT_SpotSystem_fnc_isWallhackEnabled) exitWith {sleep 1; false};

			private _players = call CBA_fnc_players;

			{
				if !(_x in _players) then {
					if ([player, _x] call RT_SpotSystem_fnc_canSee) then {
						[_x, true] call RT_SpotSystem_fnc_clientSpotTarget;
					};
				};
			} forEach allUnits;

            sleep 1;

            false
        };
    }] call RT_Utils_fnc_addScriptHandler;
} else {
[missionNamespace, RT_SPOTSYS_VAR_WALLHACK_HANDLER] call RT_Utils_fnc_removeScriptHandler;
};