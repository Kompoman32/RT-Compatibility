/*
    Description: Проверяет делает ли юнит какую-то анимацию Действия, Танцев или Эмоций
    Author: Kompoman32
    Made for: RT group
    
    Arguments:
    0: _unit - Юнит для проверки анимации Действия
    1: _anim - Применяется ли конкретная анимация (default: nil)
    
    Examples:
    * [_unit] call RT_Animations_fnc_isAnimating; // true
    * [_unit, "rt_exercisePushup"] call RT_Animations_fnc_isAnimating; // false
*/

params ["_player", "_anim"];

[_player, _anim] call RT_ANIMATIONS_fnc_isDancing || [_player, _anim] call RT_ANIMATIONS_fnc_isActing || [_player, _anim] call RT_ANIMATIONS_fnc_isEmoting