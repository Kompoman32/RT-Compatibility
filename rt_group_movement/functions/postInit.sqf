if !(RT_SETTINGS_INITIALIZATION_movement call CBA_settings_fnc_get) exitwith {};

[missionNamespace, RT_MOVEMENT_VARS_MEDASSIST_SCRIPT] call RT_Utils_fnc_remooveScriptHandler;
[missionNamespace, RT_MOVEMENT_VARS_MEDASSIST_SCRIPT, [], 
{
    [] call RT_Movement_fnc_initAnimations
}
] call RT_Utils_fnc_addScriptHandler;