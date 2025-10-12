if !(RT_SETTINGS_INITIALIZATION_units call CBA_settings_fnc_get) exitWith {false};

params ["", "_target"];

if (isNull objectParent _target) exitWith {false};

if !(lifeState _target in ["HEALTHY", "INJURED"]) exitWith {false};

_target getVariable [RT_UNITS_VAR_CAN_CARRY, false]
