/*
    Description: Останавливает анимацию Эмоций на юните
    Author: Kompoman32
    Made for: RT group
    
    Arguments:
    0: _unit - Юнит для остановки анимации
    
    Examples:
    * [_unit] call RT_Animations_fnc_stopEmoting;
*/

// run on Local in Sheduled
if ([_this, true, false] call RT_Utils_fnc_callByScriptName) exitWith {};

params ["_unit"];

private _outAnim = "";

switch (gestureState _unit) do {
    case "tsp_animate_jackoff_out";
    case "tsp_animate_jackoff_loop": {
        _outAnim = "tsp_animate_jackoff_out";
    };
};

if (_outAnim != "") exitWith {

    [_unit, _outAnim] remoteExec ["playActionNow", 0, true];

    sleep (_outAnim call RT_ANIMATIONS_fnc_getGestureDuration);
};

if (gestureState _unit == _outAnim) exitWith {};

[_unit, "tsp_common_stop"] remoteExec ["playAction", 0, true];