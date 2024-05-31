// (local player) Handler стрельбы или киданием гранаты
RT_SUPPORT_VAR_FIRED_HANDLER = "VARS_RT_SUPPORT_VAR_FIRED_HANDLER";

// (local) Доп настройки для Express Artillery
RT_SUPPORT_VAR_EXPRESS_ARTILLERY_PARAMS = [
	10, // sleepTime before start THE BOMBARDMENT
	"Sh_82mm_AMOS", // ammunition to be used
	50, // radius of target area in meters
	12, // number of rounds to be fired
	0.25, // delay between rounds
	{false}, // condition to end THE BOMBARDMENT before all rounds are fired
	0, // safezone radius - minimal distance from the target position where shells may be directed at
	100, // altitude where the shell will be created
	150, // descending velocity, in m/s. if you use flare as ammo, set it to lower value (1-5) to let it fall down slowly
	[""] // sounds to be played on the incoming shell
];

["CBA_SettingChanged", {
    params ["_setting", "_value"];

	if (!(["SETTINGS_RT_SETTINGS_SUPPORT", _setting] call BIS_fnc_inString)) exitWith {};

	private ["_dropTime",
			"_artilleryAmmo",
			"_radius",
			"_rounds",
			"_roundDelay",
			"_conditionEnd",
			"_safezoneRadius",
			"_altitude",
			"_roundSpeed",
			"_sounds"];

	_conditionEnd = {false};
	_sounds = [""];

	_dropTime = parseNumber (RT_SETTINGS_SUPPORT_artillery_sleep_before call CBA_settings_fnc_get);
	_artilleryAmmo = RT_SETTINGS_SUPPORT_artillery_ammo call CBA_settings_fnc_get;
	_radius = parseNumber (RT_SETTINGS_SUPPORT_artillery_target_radius call CBA_settings_fnc_get);
	_rounds = parseNumber (RT_SETTINGS_SUPPORT_artillery_shots_count call CBA_settings_fnc_get);
	_roundDelay = parseNumber (RT_SETTINGS_SUPPORT_artillery_shots_delay call CBA_settings_fnc_get);
	_safezoneRadius = parseNumber (RT_SETTINGS_SUPPORT_artillery_safe_zone_radius call CBA_settings_fnc_get);
	_altitude = parseNumber (RT_SETTINGS_SUPPORT_artillery_safe_shell_spawn_altitude call CBA_settings_fnc_get);
	_roundSpeed = parseNumber (RT_SETTINGS_SUPPORT_artillery_safe_shell_spawn_speed call CBA_settings_fnc_get);

	RT_SUPPORT_VAR_EXPRESS_ARTILLERY_PARAMS = [
		_dropTime,
		_artilleryAmmo,
		_radius,
		_rounds,
		_roundDelay,
		_conditionEnd,
		_safezoneRadius,
		_altitude,
		_roundSpeed,
		_sounds
	];
}] call CBA_fnc_addEventHandler;