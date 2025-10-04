/*
    Description: Запустить анимацию Действия на юните
    Author: Kompoman32
    Made for: RT group
    
    Arguments:
    0: _unit - Юнит
    1: _anim - Анимация (см. CfgVehicles >> CAManBase >> ACE_SelfActions >> RT_Animations >> Actions (все вложенные))
    
    Examples:
    * [_unit, "rt_exercisePushup"] spawn RT_Animations_fnc_act;
*/

// run on Local in Sheduled
if ([_this, true, false] call RT_Utils_fnc_callByScriptName) exitWith {};

sleep 0.1;

params ["_unit", ["_anim", "Acts_Dance_01"]];

if ([_unit] call RT_ANIMATIONS_fnc_isEmoting) then {
    [_unit] call RT_ANIMATIONS_fnc_stopEmoting;
    sleep 0.2;
};

if ([_unit] call RT_ANIMATIONS_fnc_isDancing) then {
    [_unit] call RT_ANIMATIONS_fnc_stopDancing;
    sleep 0.2;
};

private _inAnim = "";

switch (_anim) do {
    case "wbk_helldivers_salute_in";
    case "wbk_helldivers_salute_loop": {
        _inAnim = "WBK_HellDivers_salute_in";
    };
};

if (_inAnim != "" && animationState _unit == _inAnim) exitWith {};

if (_inAnim != "") then {
    [_unit, [_inAnim, 0, 0.1]] remoteExec ["switchMove", 0, true];

    sleep (_inAnim call RT_ANIMATIONS_fnc_getMoveDuration);
};

[_unit, [_anim, 0, 0.1]] remoteExec ["switchMove", 0, true];