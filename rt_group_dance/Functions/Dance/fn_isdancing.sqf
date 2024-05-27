params ["_player"];

RT_DANCE_AVAILABLE_DANCES_ACTIONS findif { animationState _player == _x } != -1