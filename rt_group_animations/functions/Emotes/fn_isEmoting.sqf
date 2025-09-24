params ["_player", "_emote"];

if (!(isNil "_emote")) exitWith {

	switch (_emote) do {
		case "tsp_animate_bird_loop": {
			if ([_player, 'tsp_animate_bird_in'] call RT_ANIMATIONS_fnc_isEmoting) exitWith {true};
		};

		case "tsp_animate_jackoff_loop": {
			if ([_player, 'tsp_animate_jackoff_out'] call RT_ANIMATIONS_fnc_isEmoting) exitWith {true};
		};

		case "tsp_animate_rockpaperscissors_rock_loop";
		case "tsp_animate_rockpaperscissors_paper_loop";
		case "tsp_animate_rockpaperscissors_scissors_loop": {
			if ([_player, 'tsp_animate_rockpaperscissors_in'] call RT_ANIMATIONS_fnc_isEmoting) exitWith {true};
		};
	};

	gestureState _player == _emote
};

RT_ANIMATIONS_AVAILABLE_EMOTES findif { gestureState _player == _x } != -1