private _index = _this;

if (RT_MEDICAL_ASSSISTANT_VAR_MENU_CURRENT_INDEX == _index) exitWith {};

private _playerSide = side player;
private _players = [] call RT_Utils_fnc_getAllPlayersWithoutCurators;
private _playerGroup = group player;
private _groups = [_playerGroup];

private _showAll = (RT_SETTINGS_MEDICAL_ASSISTANT_GROUP_TYPE call CBA_settings_fnc_get) == RT_SETTINGS_MEDICAL_ASSISTANT_GROUP_TYPE_ALL ;
private _showPlayers = (RT_SETTINGS_MEDICAL_ASSISTANT_GROUP_TYPE call CBA_settings_fnc_get) == RT_SETTINGS_MEDICAL_ASSISTANT_GROUP_TYPE_PLAYERS;

if (_showAll || _showPlayers) then {
	{
		_groups pushBackUnique _x;
	} forEach ((_players apply { group _x }) select { side _x == _playerSide})
};

if (_showAll) then {
	{
		_groups pushBackUnique _x;
	} forEach (groups _playerSide);
};

if (_index == -1) exitWith {
	RT_MEDICAL_ASSSISTANT_VAR_MENU_CURRENT_INDEX = _index;
	[_groups] call AMA_fnc_initMenuAll;
	[objNull, _index] call RT_Medical_Assistant_fnc_setGroupText;
};

private _selectedGroup = objNull;

if (_index < (count _groups)) then {
	_selectedGroup = (_groups#_index);
};

RT_MEDICAL_ASSSISTANT_VAR_MENU_CURRENT_INDEX = _index;

[_selectedGroup] call AMA_fnc_initMenu;

[_selectedGroup, _index] call RT_Medical_Assistant_fnc_setGroupText;