if (_this findIf {isNil {_x}} > -1) exitWith {};
params ["_objectWithSavedhandler", "_eventName", "_handlerVariable", "_code"];

if ((isNil "_objectWithSavedhandler") || (isNil "_eventName") || (isNil "_handlerVariable") || (isNil "_code")) exitWith {};

private _handler = [_eventName, _code] call CBA_fnc_addEventHandler;
_objectWithSavedhandler setVariable [_handlerVariable, _handler];