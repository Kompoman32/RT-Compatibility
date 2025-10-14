uiNameSpace setVariable [RT_PAGER_VAR_Pager_Page, 'message'];
uiNameSpace setVariable [RT_PAGER_VAR_Pager_Selected_Recipient, 0];

private _recipients = [] call CBA_fnc_players;

_recipients = _recipients - [player];

if !(RT_SETTINGS_PAGER_add_curators_recipients call CBA_SETTINGS_fnc_get) then {
	_recipients = _recipients - ([] call RT_Utils_fnc_getAllCuratorUnits);
};

_recipients = _recipients select {"RT_Pager" in (_x call ace_common_fnc_uniqueItems)};

uiNameSpace setVariable [RT_PAGER_VAR_Pager_Recipients, _recipients];
