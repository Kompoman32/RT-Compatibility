params [["_control", controlNull]];

if (isNull _control) exitWith {};

private _units = ((units group player) - [player]);

([player] call RT_Utils_fnc_getUnitRoleInfo) params ["_name", "_role",  "_squadName"];

private _text = [format ["<t size='1.2' align='right'>%1</t>", _squadName], format ["<t align='right'>%1, %2</t>", _name, _role], ""];

{
	([_x] call RT_Utils_fnc_getUnitRoleInfo) params ["_name", "_role"];

	_text pushBack ( format ["<t align='right'>%1, %2</t>", _name, _role]);
} forEach _units;

_control ctrlSetStructuredText parseText (_text joinString "<br/>");
_control ctrlCommit 0;

private _ctrlPos =  ctrlPosition _control;
_control ctrlSetPositionX (_ctrlPos#0 + _ctrlPos#2 - (ctrlTextWidth _control));
_control ctrlSetPositionW (ctrlTextWidth _control);
_control ctrlSetPositionH (ctrlTextHeight _control);
_control ctrlCommit 0;

_control ctrlSetPositionH (ctrlTextHeight _control);
_control ctrlCommit 0;
