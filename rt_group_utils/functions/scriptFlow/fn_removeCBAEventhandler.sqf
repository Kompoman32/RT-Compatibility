if (_this findIf {isNil {_x}} > -1) exitWith {};
params ["_objectWithSavedhandler", "_eventName", "_handlerVariable"];

private _eventHandler = _objectWithSavedhandler getVariable [_handlerVariable, nil];

if (!(isNil "_eventHandler")) then {
	[_eventName, _eventHandler] call CBA_fnc_removeEventHandler;
};

_objectWithSavedhandler setVariable [_handlerVariable, nil];