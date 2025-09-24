params ["_player", "_dance"];

if (!(isNil "_dance")) exitWith {
	animationState _player == _dance
};

RT_ANIMATIONS_AVAILABLE_DANCES findif { animationState _player == _x } != -1
