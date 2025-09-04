params [["_selectedGroup", objNull], ["_index", 0]];

// Set color and text of GroupText control
disableSerialization;
private _display = (findDisplay RT_MEDICAL_ASSSISTANT_VAR_DISPLAY_IDC);

private _groupTextBGCtrl = (_display displayCtrl 9580);
private _groupTextCtrl = (_display displayCtrl 9581);

private _name = "";

if (_index == -1) then {
	_name = "All Units";
} else {
	if !(isNull _selectedGroup) then {
		_name = groupID _selectedGroup;
	} else {
		_name = format ["No group %1", _index + 1];
	};
};

_groupTextCtrl ctrlSetStructuredText (parseText (format ["<t align='center' size='0.8' >%1</t>",_name]));

private _controlWidth = ctrlTextWidth _groupTextCtrl;
private _controlX = 0.5 - _controlWidth / 2;

_groupTextCtrl ctrlSetPositionX _controlX;
_groupTextBGCtrl ctrlSetPositionX _controlX;
_groupTextCtrl ctrlSetPositionW _controlWidth;
_groupTextBGCtrl ctrlSetPositionW _controlWidth;

private _bgColor = [_index] call RT_Medical_assistant_fnc_getGroupColor;

_groupTextCtrl ctrlSetBackgroundColor _bgColor;

_groupTextBGCtrl ctrlCommit 0;
_groupTextCtrl ctrlCommit 0;
