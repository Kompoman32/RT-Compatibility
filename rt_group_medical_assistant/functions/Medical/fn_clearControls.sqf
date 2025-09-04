private _display = (findDisplay RT_MEDICAL_ASSSISTANT_VAR_DISPLAY_IDC);

if (isNull _display) exitWith {};

private _mainCtrlGroup = (_display displayCtrl 956);

if (isNull _mainCtrlGroup) exitWith {};

{
	ctrlDelete _x;
} forEach (allControls _mainCtrlGroup);
