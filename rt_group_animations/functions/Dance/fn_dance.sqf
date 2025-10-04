/*
    Description: Запустить анимацию Танцев на юните
    Author: Kompoman32
    Made for: RT group
    
    Arguments:
    0: _unit - Юнит для применения анимации Танцев
    1: _anim - Анимация (см. CfgVehicles >> CAManBase >> ACE_SelfActions >> RT_Animations >> Dances (все вложенные))
    
    Examples:
    * [_unit, "A3_Dance2"] call RT_Animations_fnc_dance;
*/

// run on Local in Sheduled
if ([_this, true, false] call RT_Utils_fnc_callByScriptName) exitWith {};

sleep 0.1;

params ["_unit", ["_anim", "Acts_Dance_01"]];

if ([_unit] call RT_ANIMATIONS_fnc_isEmoting) then {
    [_unit] call RT_ANIMATIONS_fnc_stopEmoting;
    sleep 0.2;
};

if ([_unit] call RT_ANIMATIONS_fnc_isActing) then {
    [_unit] call RT_ANIMATIONS_fnc_stopActing;
    sleep 0.2;
};

[_unit, [_anim, 0, 0.1]] remoteExec ["switchMove", 0, true];