params [["_time", 1]];
waitUntil {
	if (time > _time) exitWith {true};

	sleep 0.1;
	false
};