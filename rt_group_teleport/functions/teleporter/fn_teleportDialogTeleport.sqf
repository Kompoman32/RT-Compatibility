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


private _positionArea = _position getvariable ["objectArea",[0,0,0,false,0]];
private _positionPos = [getPosWorld _position, _positionArea] call BIS_fnc_randomPosTrigger;

titleText ["", "BLACK OUT", 1]; 
1 fadeSound 0; 
sleep 2; 

player setPosWorld _positionPos;

sleep 2; 
2 fadeSound 1; 
titleText ["", "BLACK IN", 5]; 
sleep 3;


