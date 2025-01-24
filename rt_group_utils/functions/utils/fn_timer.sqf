/*
 * Count down for some time and show hint time left. (should calls on every client. see example.)
 *
 * inspired by cobra4v320
 * https://forums.bohemia.net/forums/topic/164308-countdown-timer-on-screen/?do=findComment&comment=2571112
 *
 * arguments:
 *     0: _time - Time to count backwards (!Not Structured Text)
 *     1: _text - Text to show in hint (%1 will be remaining time in HH:MM format)
 * 
 * ex:
 *     [120, "You need to defend this position! \n Time Left: \n %1"] remoteExec ["RT_Utils_fnc_timer", 0]
 */

params [["_time", 10], ["_text", "Time Left \n %1"]];

if (!hasInterface) exitWith {};

[] call RT_Utils_fnc_stopTimer;

[player, RT_UTILS_VAR_TIMER_HANDLER, [_time, _text], {
    params ["_time", "_text"];

    while {_time > 0} do {
        _time = _time - 1;  
        hintSilent format[_text, [_time, "MM:SS"] call BIS_fnc_secondsToString];
        sleep 1;
    };
}] call Rt_Utils_fnc_addScripthandler;	




