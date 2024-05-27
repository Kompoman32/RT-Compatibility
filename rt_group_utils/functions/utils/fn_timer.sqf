/*
	inspired by cobra4v320
	https://forums.bohemia.net/forums/topic/164308-countdown-timer-on-screen/?do=findComment&comment=2571112
*/

params [["_time", 10]];

if (!hasInterface) exitWith {};

while {_time > 0} do {
	_time = _time - 1;  
	hintSilent format["Time Left \n %1", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring];
	sleep 1;
};

