params [["_addPage", 0]];

private _teleporter = uiNamespace getVariable RT_TELEPORT_VAR_TELEPORTER_MODULE;
private _allPositions = synchronizedObjects _teleporter;
private _allPositionsCount = count _allPositions;

(((ctrlText 21438) splitString "/") apply {parseNumber _x}) params ["_currentPage", "_maxPages"];

_currentPage = _currentPage - 1;

_currentPage = (_currentPage + _addPage + _maxPages) % _maxPages + 1;

// Pages
ctrlSetText [21438, format ["%1/%2", _currentPage, _maxPages]];
private _index = 0;
private _position = nil;
private _text = "";
{
	_index = _x + (_currentPage - 1) * 5;

	_position = nil;

	if (_index <  _allPositionsCount) then {
		_position = _allPositions select _index;
	};

	_text = "";
	if (!(isNil "_position")) then {
		_text = _position getVariable ["title", "Position"];
	};

 	ctrlSetText [21430 + _x, _text];
	ctrlShow [21430 + _x, _index < _allPositionsCount];
} forEach [0,1,2,3,4];
