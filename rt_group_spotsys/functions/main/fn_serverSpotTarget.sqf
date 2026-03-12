if (!isServer) exitWith {};

params [["_targets", [], [objNull, []]], ["_remove", false]];

if (typeName _targets !=  "ARRAY" ) then {
	_targets = [_targets];
};

private _filteredTargets = [];
private _updated = false;

if !(_remove) then {
	{
		if !(_x in RT_SPOTSYS_AllSpottedTargets) then {
			_x setVariable ["SpotTime", time, true];
			RT_SPOTSYS_AllSpottedTargets pushBack _x;
			_updated = true;
		} else {
			_x setVariable ["SpotTime", time, true];
		};
	} forEach _targets;
} else {
	{
		if (_x in RT_SPOTSYS_AllSpottedTargets) then {
      		_x setVariable ["SpotTime", nil, true];
			RT_SPOTSYS_AllSpottedTargets = RT_SPOTSYS_AllSpottedTargets - [_x];
			_updated = true;
		};
	} forEach _targets;
};


if (_updated) then {
	publicVariable "RT_SPOTSYS_AllSpottedTargets"
}