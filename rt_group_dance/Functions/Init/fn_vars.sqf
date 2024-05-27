// (local) Можно ли танцевать
RT_DANCE_ALLOWED = true;

// (local) Список танцев
RT_DANCE_AVAILABLE_DANCES = [
	["A3_Dance1", "Dance 1"],
	["A3_Dance2", "Dance 2"],
	["WBK_Secretanim_Dance", "WBK Dance"],
	["A2_Dances", "Arma 2 Dances", [
		["a2_duoivan", "Duo Ivan"],
		["a2_duostefan", "Duo Stefan"],
		["a2_stefan", "Stefan"],
		["a2_zozo", "Zozo"],
		["a2_metal", "Hard Metal"]
	]],
	["KKA3_Dances", "KKA3 Dances", [
		["kka3_nightclubdance", "NightClub"],
		["kka3_dubstepdance", "Dubstep"],
		["kka3_dubsteppop", "Dubstep Pop"],
		["kka3_crazydrunkdance", "Drunk"],
		["kka3_robotdance", "Robot"],
		["kka3_russiandance", "Russian Dance"],
		["kka3_hiphopdance", "Hiphop"]
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

// (local player) Handler проверки отключения дэнса по кнопке Ace Menu
RT_DANCE_VAR_CHECK_HANDLER = "VARS_RT_DANCE_VAR_CHECK_HANDLER";



