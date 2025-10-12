if !(RT_SETTINGS_INITIALIZATION_units call CBA_settings_fnc_get) exitWith {false};

params ["_player", "_target"];

if !((alive _target) && (isNull objectParent _target) && ((_target call ace_common_fnc_nearestVehiclesFreeSeat) isNotEqualTo [])) exitWith {false};

if (_target getVariable ['ACE_isUnconscious',false]) exitWith {false};

_target getVariable [RT_UNITS_VAR_CAN_CARRY, false]