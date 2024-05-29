// run on Server in Sheduled
if ([_this, true, true] call RT_Utils_fnc_callByScriptName) exitWith {};

[] call RT_UTILS_fnc_waitUntilTime;

[missionNameSpace, "ace_unconscious", RT_SPECTATOR_VAR_UNCOSCIOUS_HANDLER] call Rt_Utils_fnc_removeCBAEventhandler;

[missionNameSpace, "ace_unconscious", RT_SPECTATOR_VAR_UNCOSCIOUS_HANDLER, {
    params ["_unit", "_state"];

    if (!(isPlayer _unit) || !(alive _unit)) exitWith {};

    if (_state) then {
        [] remoteExec ["RT_Spectator_fnc_addSpectator", owner _unit, false];
    } else {
        [] remoteExec ["RT_Spectator_fnc_removeSpectator", owner _unit, false];
    };
}] call Rt_Utils_fnc_addCBAEventhandler;