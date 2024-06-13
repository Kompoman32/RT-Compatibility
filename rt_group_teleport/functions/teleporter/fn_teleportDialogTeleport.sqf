params [["_index", -1]];

if (_index < 0) exitWith {};

private _teleporter = uiNamespace getVariable RT_TELEPORT_VAR_TELEPORTER_MODULE;
private _allPositions = synchronizedObjects _teleporter;
private _allPositionsCount = count _allPositions;

(((ctrlText 21438) splitString "/") apply {parseNumber _x}) params ["_currentPage", "_maxPages"];
_currentPage = _currentPage - 1;
_currentPage = (_currentPage + _maxPages) % _maxPages + 1;

private _position = _allPositions select (_index + (_currentPage - 1) * 5);

closeDialog 2;



private _positionPos = getPosWorld _position;
private _positionArea = _position getvariable ["objectArea",[0,0,0,false,0]];
private _offsets = [_positionArea#0, _positionArea#1, _positionArea#2] call Rt_Utils_Math_fnc_getRandomPointInEllipse;
_offsets pushBack 0;

_positionPos = [0,1,2] apply {
	_positionPos#_x + _offsets#_x
};

titleText ["", "BLACK OUT", 1]; 
1 fadeSound 0; 
sleep 2; 

player setPosWorld _positionPos;

sleep 2; 
2 fadeSound 1; 
titleText ["", "BLACK IN", 5]; 
sleep 3;


