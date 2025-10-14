disableSerialization;
private _page = uiNameSpace getVariable [RT_PAGER_VAR_Pager_Page, 'message'];

if (_page != "sender") exitWith {};

private _ctrlEdit = uiNameSpace getVariable [RT_PAGER_VAR_Pager_Edit_Control, controlNull];
if (isNull _ctrlEdit) exitWith {};

private _recipients = uiNameSpace getVariable [RT_PAGER_VAR_Pager_Recipients, []];
if (count _recipients == 0) exitWith {};

private _selectedRecepientIndex = uiNameSpace getVariable [RT_PAGER_VAR_Pager_Selected_Recipient, 0];
_selectedRecepientIndex = 0 max _selectedRecepientIndex min ((count _recipients) - 1);

private _nextRecepientIndex = _selectedRecepientIndex + 1;

if (_nextRecepientIndex >= count _recipients) then {
	_nextRecepientIndex = 0;
};

private _nextRecepient = _recipients select _nextRecepientIndex;
uiNameSpace setVariable [RT_PAGER_VAR_Pager_Selected_Recipient, _nextRecepientIndex];

_ctrlEdit ctrlSetText (toUpper (name _nextRecepient));
_ctrlEdit ctrlCommit 0;