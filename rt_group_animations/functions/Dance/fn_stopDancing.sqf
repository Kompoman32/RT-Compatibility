/*
    Description: Останавливает анимацию Танцев на юните
    Author: Kompoman32
    Made for: RT group
    
    Arguments:
    0: _unit - Юнит для остановки анимации
    
    Examples:
    * [_unit] call RT_Animations_fnc_stopDancing;
*/

params ["_player"];

[_player, ["", 0, 0.1]] remoteExec ["switchMove", 0, true];
