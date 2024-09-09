/*
 * Stops the current timer setted by RT_Utils_fnc_timer.
 *
 * ex:
 *     [] remoteExec ["RT_Utils_fnc_stopTimer", 0]
 */

if (!hasInterface) exitWith {};

[player, RT_UTILS_VAR_TIMER_HANDLER] call Rt_Utils_fnc_removeScripthandler;

hintSilent "";
