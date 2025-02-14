params ["_unit"];

if (isNil "_unit") exitWith {[]};

private _role = roleDescription _unit;
private _squadName = str group _unit;
if (_role == "") then {
	_role = "Rifleman";
};

if ("@" in _role) then {
	private _splitted = _role splitString "@";
	_role = _splitted#0; 
	_squadName = _splitted#1;
};

[name _unit, _role, _squadName]
