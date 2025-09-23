params ["_player", "_action"];

if (!(isNil "_action")) exitWith {

	switch (_action) do {
		case "WBK_HellDivers_salute_loop": {
			if ([_player, 'WBK_HellDivers_salute_in'] call RT_ANIMATIONS_fnc_isEmoting || [_player, 'WBK_HellDivers_salute_out'] call RT_ANIMATIONS_fnc_isEmoting) exitWith {true};
		};
	};

	animationState _player == _action
};

RT_ANIMATIONS_AVAILABLE_ACTIONS findif { animationState _player == _x } != -1