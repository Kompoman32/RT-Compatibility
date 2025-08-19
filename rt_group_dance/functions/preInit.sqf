// (local) Список танцев
RT_DANCE_AVAILABLE_DANCES = [
	["A2_Dances", "Arma 2 Dances", [
		["a2_duoivan", "Duo Ivan"],
		["a2_duostefan", "Duo Stefan"],
		["a2_stefan", "Stefan"],
		["a2_zozo", "Zozo"],
		["a2_metal", "Hard Metal"]
	]],
	["A3_Dances", "Arma 3 Dances", [
		["A3_Dance1", "Dance 1"],
		["A3_Dance2", "Dance 2"]
	]],
	["WBK_Secretanim_Dance", "WBK Dance"],
	["KKA3_Dances", "KKA3 Dances", [
		["kka3_nightclubdance", "NightClub"],
		["kka3_dubstepdance", "Dubstep"],
		["kka3_dubsteppop", "Dubstep Pop"],
		["kka3_crazydrunkdance", "Drunk"],
		["kka3_robotdance", "Robot"],
		["kka3_russiandance", "Russian Dance"],
		["kka3_hiphopdance", "Hiphop"]
	]]
];
RT_DANCE_AVAILABLE_ACTIONS = [
	["WBK_HellDivers_SaluteIn", "Helldivers Salute"],
	["WBK_Workout", "Workout", [
		["WBK_Workout_1", "Waist Drop Plank"],
		["WBK_Workout_2", "Kneeling Plank Thrusts"],
		["WBK_Workout_3", "Kneeling Hip Thrusts"]
	]],
	["TPose", "T-Pose"]
];

private _collectDanceNames = {
	params ["_actionName", "_name", ["_childDances", []]];

	if (count _childDances > 0) exitWith {
		_childDances apply {_x call _collectDanceNames}
	};

	_actionName
};

RT_DANCE_AVAILABLE_DANCES_ACTIONS = flatten RT_DANCE_AVAILABLE_DANCES apply {_x call _collectDanceNames};
RT_DANCE_AVAILABLE_ACTIONS_ACTIONS = flatten RT_DANCE_AVAILABLE_ACTIONS apply {_x call _collectDanceNames};

// (local player) Handler проверки отключения дэнса по кнопке Ace Menu
RT_DANCE_VAR_CHECK_HANDLER = "VARS_RT_DANCE_VAR_CHECK_HANDLER";



