/*
    Description: Открыть диалог
    Author: Kompoman32
    Made for: RT group
    
    Arguments:
    0: _speaker - Юниит, с которым ведётся Диалог
    1: _hashMap - хэшмапа со всеми ветвями диалога и др.
    
    Examples:
    * [_speaker, _dialogHashMap] call RT_Dialog_fnc_openDialog;
*/

params [["_speaker", nil], ["_hashMap", createHashMap]];

if (isNil "_speaker" || count _hashMap == 0) exitWith {};

createDialog  "DialogSystem";

private _hash = createHashMapFromArray (_hashMap apply { [_x get "id", _x]});

private _first = _hashMap#0;

[_speaker, _hash, _first] spawn RT_Dialog_fnc_ShowStage;