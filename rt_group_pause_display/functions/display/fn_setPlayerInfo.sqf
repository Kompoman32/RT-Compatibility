params [["_control", controlNull]];

if (isNull _control) exitWith {};

if ([] call RT_Utils_fnc_isAdminOrZeus) exitWith {};

_control ctrlSetBackgroundColor [0,0,0,0.4];

private _UIColor = [
		(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13]),
		(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54]),
		(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21]),
		1
		// "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"
] call BIS_fnc_colorRGBAtoHTML;


([player] call RT_Utils_fnc_getUnitRoleInfo) params ["", "",  "_squadName"];

private _groupLeader = leader group player;
private _unitsTexts = [];

{
	([_x] call RT_Utils_fnc_getUnitRoleInfo) params ["_name", "_role"];

	private _tArgs = "";

	if (_x == (_groupLeader)) then {
		_tArgs = _tArgs + " underline='1'";
	};

	_unitsTexts pushBack [_x, (format ["<t align='right' %3 >%1, %2</t>", _name, _role, _tArgs ])];
} forEach (units group player);

private _playerText = (_unitsTexts select (_unitsTexts findIf {_x#0 == player}))#1;
private _groupLeaderText = (_unitsTexts select (_unitsTexts findIf {_x#0 == _groupLeader}))#1;

_unitsTexts = _unitsTexts select {_x#0 != player && _x#0 != _groupLeader};

private _text = [format ["<t size='1.2' align='right' color='%2'>%1</t>", _squadName, _UIColor], _playerText, ""];

if (player != _groupLeader) then {
	_text pushBack _groupLeaderText;
};

{
	_text pushBack _x#1;
} forEach _unitsTexts;


_control ctrlSetStructuredText parseText (_text joinString "<br/>");
_control ctrlCommit 0;

private _ctrlPos =  ctrlPosition _control;
_control ctrlSetPositionX (_ctrlPos#0 + _ctrlPos#2 - (ctrlTextWidth _control));
_control ctrlSetPositionW (ctrlTextWidth _control);
_control ctrlSetPositionH (ctrlTextHeight _control);
_control ctrlCommit 0;

_control ctrlSetPositionH (ctrlTextHeight _control);
_control ctrlCommit 0;
