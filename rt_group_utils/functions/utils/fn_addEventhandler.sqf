if (_this findIf {isNil {_x}} > -1) exitWith {};
params ["_objectWithSavedhandler", "_eventName", "_handlerVariable", "_code"];

private _handler = _objectWithSavedhandler addEventHandler [_eventName, _code];
_objectWithSavedhandler setVariable [_handlerVariable, _handler];