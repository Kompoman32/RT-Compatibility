/*
    Description: Обработчик открытия арсенала
    Author: Kompoman32
    Made for: RT group
    
    Examples:
    * call RT_Fun_fnc_onOpenArsenal;
*/

if !(RT_SETTINGS_FUN_enable call CBA_settings_fnc_get && RT_SETTINGS_FUN_enable_arsenal_music call CBA_settings_fnc_get) exitwith {
    [false] call RT_FUN_fnc_arsenalMusicShowButton;
};

if (!RT_FUN_VAR_ARSENAL_DISABLE_MUSIC) then {

    private _index = [] call RT_FUN_fnc_startArsenalMusic;

    if (_index < 0) exitWith {};

    [missionNamespace, RT_FUN_VAR_ARSENAL_MUSIC_POOL_SPAWN, [], {
        waitUntil {
            private _sound = missionNamespace getVariable [RT_FUN_VAR_ARSENAL_MUSIC, nil];
            if (isNil "_sound") exitWith{true};

            if ((soundParams _sound) isEqualTo []) then {
                private _index = [true] call RT_FUN_fnc_startArsenalMusic;

                if (isNil "_index") exitWith{true};
            };

            sleep 1;

            false
        };
    }] call RT_Utils_fnc_addScriptHandler;
};

[true] call RT_FUN_fnc_arsenalMusicShowButton;