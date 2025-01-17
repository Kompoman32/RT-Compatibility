params [["_speaker", nil], ["_hasMap", createHashMap]];

if (isNil "_speaker" || count _hasMap == 0) exitWith {};

createDialog  "DialogSystem";

private _hash = createHashMapFromArray (_hasMap apply { [_x get "id", _x]});

private _first = _hasMap#0;

[_speaker, _hash, _first] spawn RT_Dialog_fnc_ShowStage;