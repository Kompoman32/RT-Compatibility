/*
    Description: Обработчик закрытия арсенала
    Author: Kompoman32
    Made for: RT group
    
    Examples:
    * call RT_Fun_fnc_onCloseArsenal;
*/

missionNamespace setVariable [RT_FUN_VAR_ARSENAL_MUSIC_INDEX, nil];
[missionNamespace, RT_FUN_VAR_ARSENAL_MUSIC_POOL_SPAWN] call RT_Utils_fnc_removeScriptHandler;

[missionNamespace getVariable [RT_FUN_VAR_ARSENAL_MUSIC, nil]] call RT_FUN_fnc_stopArsenalMusic;