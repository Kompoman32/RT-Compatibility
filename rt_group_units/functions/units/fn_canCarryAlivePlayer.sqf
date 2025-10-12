if !(RT_SETTINGS_INITIALIZATION_units call CBA_settings_fnc_get) exitWith {false};

params ["_player", "_target"];

if ([_player, _target] call ace_dragging_fnc_canCarry) exitWith {false};

_target getVariable [RT_UNITS_VAR_CAN_CARRY, false] && stance _target == "PRONE"