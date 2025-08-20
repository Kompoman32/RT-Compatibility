stopSound (missionNamespace getVariable [RT_FUN_VAR_ARSENAL_MUSIC, nil]);

missionNamespace setVariable [RT_FUN_VAR_ARSENAL_MUSIC_INDEX, nil];
missionNamespace setVariable [RT_FUN_VAR_ARSENAL_MUSIC, nil];

[missionNamespace, RT_FUN_VAR_ARSENAL_MUSIC_POOL_SPAWN] call RT_Utils_fnc_removeScriptHandler;