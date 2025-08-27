params ["_unit"];

private _lastTime = _unit getVariable [RT_MEDICAL_VAR_SECOND_WIND_LAST_TIME, -99999999999];
private _cooldown = RT_SETTINGS_MEDICAL_SecondWindCooldown call CBA_settings_fnc_get;

if (time - _lastTime < _cooldown) exitWith {};
if ((getFatigue _unit) < 0.99) exitWith {};

_unit setVariable [RT_MEDICAL_VAR_SECOND_WIND_LAST_TIME, time];

private _addedStamina = RT_SETTINGS_MEDICAL_SecondWindAddedSeconds call CBA_settings_fnc_get;

_unit setStamina ((getStamina _unit) + _addedStamina);
