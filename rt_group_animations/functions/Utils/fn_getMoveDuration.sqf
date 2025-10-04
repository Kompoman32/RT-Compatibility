/*
    Description: Получает длительность анимации
    Author: Kompoman32
    Made for: RT group
    
    Examples:
    * "A3_Dance2" call RT_Animations_fnc_getMoveDuration; // 17.1414
*/

abs (1/(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> _this >> "speed")+0.01))-0.1