params ["_player"];

RT_DANCE_AVAILABLE_ACTIONS_ACTIONS findif { animationState _player == _x } != -1