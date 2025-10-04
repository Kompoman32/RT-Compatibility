/*
    Description: Проверяет делает ли юнит какую-то анимацию Эмоций
    Author: Kompoman32
    Made for: RT group
    
    Arguments:
    0: _unit - Юнит для проверки анимации Эмоций
    1: _anim - Применяется ли конкретная анимация (default: nil) (см. CfgVehicles >> CAManBase >> ACE_SelfActions >> RT_Animations >> Emotes (все вложенные))
    
    Examples:
    * [_unit] call RT_Animations_fnc_isEmoting; // true
    * [_unit, "tsp_animate_loser_loop"] call RT_Animations_fnc_isEmoting; // false
*/

params ["_unit", "_emote"];

if (!(isNil "_emote")) exitWith {

    switch (_emote) do {
        case "tsp_animate_bird_loop": {
            if ([_unit, 'tsp_animate_bird_in'] call RT_ANIMATIONS_fnc_isEmoting) exitWith {true};
        };

        case "tsp_animate_jackoff_loop": {
            if ([_unit, 'tsp_animate_jackoff_out'] call RT_ANIMATIONS_fnc_isEmoting) exitWith {true};
        };

        case "tsp_animate_rockpaperscissors_rock_loop";
        case "tsp_animate_rockpaperscissors_paper_loop";
        case "tsp_animate_rockpaperscissors_scissors_loop": {
            if ([_unit, 'tsp_animate_rockpaperscissors_in'] call RT_ANIMATIONS_fnc_isEmoting) exitWith {true};
        };
    };

    gestureState _unit == _emote
};

RT_ANIMATIONS_AVAILABLE_EMOTES findif { gestureState _unit == _x } != -1