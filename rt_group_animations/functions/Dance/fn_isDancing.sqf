/*
    Description: Проверяет делает ли юнит какую-то анимацию Танцев
    Author: Kompoman32
    Made for: RT group
    
    Arguments:
    0: _unit - Юнит для проверки анимации Танцев
    1: _anim - Применяется ли конкретная анимация (default: nil) (см. CfgVehicles >> CAManBase >> ACE_SelfActions >> RT_Animations >> Dances (все вложенные))
    
    Examples:
    * [_unit] call RT_Animations_fnc_isDancing; // true
    * [_unit, "rt_exercisePushup"] call RT_Animations_fnc_isDancing; // false
*/

params ["_unit", "_dance"];

if (!(isNil "_dance")) exitWith {
    animationState _unit == _dance
};

RT_ANIMATIONS_AVAILABLE_DANCES findif { animationState _unit == _x } != -1
