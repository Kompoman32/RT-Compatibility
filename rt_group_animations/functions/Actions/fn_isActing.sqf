/*
    Description: Проверяет делает ли юнит какую-то анимацию Действия
    Author: Kompoman32
    Made for: RT group
    
    Arguments:
    0: _unit - Юнит
    1: _anim - Проверить конкретную анимацию (default: nil) (см. CfgVehicles >> CAManBase >> ACE_SelfActions >> RT_Animations >> Actions (все вложенные))
    
    Examples:
    * [_unit] call RT_Animations_fnc_isActing; // true
    * [_unit, "rt_exercisePushup"] call RT_Animations_fnc_isActing; // false
*/

params ["_player", "_action"];

if (!(isNil "_action")) exitWith {

    switch (_action) do {
        case "WBK_HellDivers_salute_loop": {
            if ([_player, 'WBK_HellDivers_salute_in'] call RT_ANIMATIONS_fnc_isEmoting || [_player, 'WBK_HellDivers_salute_out'] call RT_ANIMATIONS_fnc_isEmoting) exitWith {true};
        };
    };

    animationState _player == _action
};

RT_ANIMATIONS_AVAILABLE_ACTIONS findif { animationState _player == _x } != -1