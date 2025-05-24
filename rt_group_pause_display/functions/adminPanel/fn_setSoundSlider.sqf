params [["_control", controlNull], ["_newValue", 0]];

if (isNull _control) exitWith {};

private _group =  ctrlParentControlsGroup _control;
private _sliderCtrl = _group controlsGroupCtrl 1;

if (isNull _sliderCtrl) exitWith {};
 
_sliderCtrl sliderSetPosition _newValue;

_this call RT_PauseDisplay_fnc_setSoundSliderText;
