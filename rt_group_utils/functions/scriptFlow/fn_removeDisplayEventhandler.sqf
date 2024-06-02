if (_this findIf {isNil {_x}} > -1) exitWith {};
params ["_objectWithSavedhandler", "_eventName", "_display", "_handlerVariable"];

private _eventHandler = _objectWithSavedhandler getVariable [_handlerVariable, nil];

if (!(isNil "_eventHandler")) then {
	(findDisplay _display) displayRemoveEventHandler [_eventName, _eventHandler];
};

_objectWithSavedhandler setVariable [_handlerVariable, nil];