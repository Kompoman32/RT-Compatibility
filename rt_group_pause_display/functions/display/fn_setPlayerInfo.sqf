params [["_control", controlNull]];

if (isNull _control) exitWith {};

private _role = roleDescription player;
private _squadName = str group player;
if (_role == "") then {
	_role = "Rifleman";
};

if ("@" in _role) then {
	private _splitted = _role splitString "@";
	_role = _splitted#0; 
	_squadName = _splitted#1;
};

_control ctrlSetStructuredText parseText format ["<t align='right'>%1</t><br/><t align='right'>%2, %3</t>", _squadName, name player,_role];
_control ctrlCommit 0;
