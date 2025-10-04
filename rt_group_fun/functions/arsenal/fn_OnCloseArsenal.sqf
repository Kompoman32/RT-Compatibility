/*
    Description: Обработчик закрытия арсенала
    Author: Kompoman32
    Made for: RT group
    
    Examples:
    * call RT_Fun_fnc_onCloseArsenal;
*/

stopSound (missionNamespace getVariable [RT_FUN_VAR_ARSENAL_MUSIC, nil]);

missionNamespace setVariable [RT_FUN_VAR_ARSENAL_MUSIC_INDEX, nil];
missionNamespace setVariable [RT_FUN_VAR_ARSENAL_MUSIC, nil];

[missionNamespace, RT_FUN_VAR_ARSENAL_MUSIC_POOL_SPAWN] call RT_Utils_fnc_removeScriptHandler;