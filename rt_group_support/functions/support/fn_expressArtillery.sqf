if (!(RT_SETTINGS_SUPPORT_enable_artillery call CBA_settings_fnc_get)) exitWith {};

params ["_projectile"];

RT_SUPPORT_VAR_EXPRESS_ARTILLERY_PARAMS params [
	["_sleepTime", 10],
	["_ammo", "Sh_82mm_AMOS"],
	["_radius", 50],
	["_rounds", 12],
	["_roundDelay", 0.25],
	["_conditionEnd", {false}],
	["_safezoneRadius", 0],
	["_altitude", 100],
	["_roundSpeed", 150],
	["_sounds", [""]]
];

sleep _sleepTime;

private _position = mapGridPosition getPos _projectile;

[getPosATL _projectile, _ammo, _radius, _rounds, _roundDelay, _conditionEnd, _safezoneRadius, _altitude, _roundSpeed, _sounds] spawn BIS_fnc_fireSupportVirtual;

sleep 3;
deleteVehicle _projectile;