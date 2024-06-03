/*
	Authors: Voxtell & Kompoman32

	Description:
		Create artillery on Object position after some dellay. And after that remove this Object.

	Parameters:
		_projectile - object at whose position artillery spawns (type: Object)
		_params - params for artillery
			_sleepTime - time before start the artillery
			... params from BIS_fnc_fireSupportVirtual
			_ammo = ammo
			_radius = radius
			_rounds = rounds
			_roundsDelay = delay
			_conditionEnd = conditionEnd
			_safezoneRadius = safezone
			_altitude = alt
			_roundSpeed = speed
			_sounds = sounds

	Execution:
		spawn
		(just in case it wiil check the environment and executed it on needed environment)

	Examples:
		[_projectile] call RT_Units_fnc_expressArtillery;

		[_projectile, [5, "Sh_82mm_AMOS", 300, 20, 0.5, {false}, 100, 100, 200, [""]] ] call RT_Units_fnc_expressArtillery;
*/

if (!(RT_SETTINGS_SUPPORT_enable_artillery call CBA_settings_fnc_get)) exitWith {};

if ([_this, true] call RT_Utils_fnc_callByScriptName) exitWith {};

params ["_projectile", ["_params", RT_SUPPORT_VAR_EXPRESS_ARTILLERY_PARAMS]];

_params params [
	["_sleepTime", 10],
	["_ammo", "Sh_82mm_AMOS"],
	["_radius", 50],
	["_rounds", 12],
	["_roundsDelay", 0.25],
	["_conditionEnd", {false}],
	["_safezoneRadius", 0],
	["_altitude", 100],
	["_roundSpeed", 150],
	["_sounds", [""]]
];

sleep _sleepTime;

private _position = mapGridPosition getPos _projectile;

[getPosATL _projectile, _ammo, _radius, _rounds, _roundsDelay, _conditionEnd, _safezoneRadius, _altitude, _roundSpeed, _sounds] spawn BIS_fnc_fireSupportVirtual;

sleep 3;
deleteVehicle _projectile;