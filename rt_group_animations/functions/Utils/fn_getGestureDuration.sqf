/*
    Description: Получает длительность жеста
    Author: Kompoman32
    Made for: RT group
    
    Examples:
    * "tsp_animate_loser_loop" call RT_Animations_fnc_getGestureDuration; // 3.12581
*/

abs (1/(getNumber (configFile >> "CfgGesturesMale" >> "States" >> _this >> "speed")+0.01))-0.1