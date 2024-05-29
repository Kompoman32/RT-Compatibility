if (_this findIf {isNil {_x}} > -1) exitWith {};
params ["_objectWithSavedhandler", "_handlerVariable", ["_arguments", []], "_code"];

private _handler = _arguments spawn _code;
_objectWithSavedhandler setVariable [_handlerVariable, _handler];