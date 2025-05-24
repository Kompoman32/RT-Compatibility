params [["_control", controlNull], ["_newValue", 0]];

if (isNull _control) exitWith {};

private _group =  ctrlParentControlsGroup _control;
private _textCtrl = _group controlsGroupCtrl 2;

if (isNull _textCtrl) exitWith {};
 
_textCtrl ctrlSetText (str _newValue);
_textCtrl ctrlCommit 0;
