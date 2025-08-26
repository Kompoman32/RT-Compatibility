params [["_selectedGroup", objNull], ["_index", 0]];

// Set color and text of GroupText control
disableSerialization;
private _display = (findDisplay 180025);

private _groupTextBGCtrl = (_display displayCtrl 9580);
private _groupTextCtrl = (_display displayCtrl 9581);

private _name = "";

if !(isNull _selectedGroup) then {
	_name = groupID _selectedGroup;
} else {
	_name = format ["No group %1", _index + 1];
};

_groupTextCtrl ctrlSetStructuredText (parseText (format ["<t align='center' size='0.8' >%1</t>",_name]));


private _controlWidth = ctrlTextWidth _groupTextCtrl;
private _controlX = 0.5 - _controlWidth / 2;

_groupTextCtrl ctrlSetPositionX _controlX;
_groupTextBGCtrl ctrlSetPositionX _controlX;
_groupTextCtrl ctrlSetPositionW _controlWidth;
_groupTextBGCtrl ctrlSetPositionW _controlWidth;

private _bgColor = switch (_index) do
	{
		// Jets
		case 0: {[0,0.0941176,0.25098,0.8]};
		// Contact
		case 1: {[0.188235,0.388235,0.556863,1]};
		// Tanks
		case 2: {[0.215686,0.368627,0.368627,0.8]};
		// Apex
		case 3: {[0.13,0.54,0.21,0.8]};
		// TacOps
		case 4: {[0.392157,0.501961,0.25098,0.8]};
		// Marksman
		case 5: {[0.35,0.35,0.1,0.8]};

		default {[0,0,0,1]};
	};

_groupTextCtrl ctrlSetBackgroundColor _bgColor;

_groupTextBGCtrl ctrlCommit 0;
_groupTextCtrl ctrlCommit 0;
