if (_this findIf {isNil {_x}} > -1) exitWith {};
params ["_objectWithSavedhandler", "_eventName", "_display", "_handlerVariable", "_code"];

private _handler = (findDisplay _display) displayAddEventHandler [_eventName, _code];
_objectWithSavedhandler setVariable [_handlerVariable, _handler];