private _display = (findDisplay 180025);

if (isNull _display) exitWith {};

private _mainCtrlGroup = (_display displayCtrl 956);

if (isNull _mainCtrlGroup) exitWith {};

{
	ctrlDelete _x;
} forEach (allControls _mainCtrlGroup);
