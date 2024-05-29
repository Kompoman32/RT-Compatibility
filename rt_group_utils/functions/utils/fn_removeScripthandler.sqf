if (_this findIf {isNil {_x}} > -1) exitWith {};
params ["_objectWithSavedhandler", "_handlerVariable"];

private _eventHandler = _objectWithSavedhandler getVariable [_handlerVariable, nil];

if (!(isNil "_eventHandler")) then {
	terminate _eventHandler;
};

_objectWithSavedhandler setVariable [_handlerVariable, nil];