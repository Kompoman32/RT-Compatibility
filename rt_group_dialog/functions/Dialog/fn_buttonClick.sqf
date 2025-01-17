params ["_control"];

private _hash = _control getVariable ["_hash", createHashMap];
private _speaker = _control getVariable ["_speaker", nil];
private _option = _control getVariable ["_option", createHashMap];
private _stage = _control getVariable ["_stage", createHashMap];


if (count _hash == 0 || count _option == 0 || isNil "_speaker") exitWith {closeDialog 2; true};

private _next = _option getOrDefault ["next", -1];

if (typeName _next == "CODE") then {
	_next = [_speaker, _hash, _stage, _option] call _next;
};

private _nextStage = _hash getOrDefault [_next, nil];
private _callback = _option getOrDefault ["callback", nil];

if (!isNil "_callback") then {
	[_speaker, _hash, _stage, _option] call _callback;
};

if (_next == -1 || isNil "_nextStage") exitWith {closeDialog 2; true};

private _nextSilent = _option getOrDefault ["nextSilent", false];

[_speaker, _hash, _nextStage, _nextSilent] spawn RT_Dialog_fnc_ShowStage;

true
