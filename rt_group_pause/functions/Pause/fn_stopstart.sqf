/*
	Author: Kompoman32
	Made for: RT group
	
	Arguments:
	0: _stopThisShit - Pause players simulations and show Pause text
	1: _ignoreUnits  - Array of units to ignore pausing
	
	
	Examples:
	* [true] call RT_Pause_fnc_stopstart;
	* [false, [z1]] call RT_Pause_fnc_stopstart;

	for using in scenarios dont forget to add
	missionNamespace setVariable [RT_PAUSE_VAR_IGNORE_UNITS, [zeus]];
*/

params [["_stopThisShit", false], ["_ignoreUnits", missionNamespace getVariable [RT_PAUSE_VAR_IGNORE_UNITS, []]]];

// Проверка на isServer и _ignoreUnits
if (isServer || (_ignoreUnits findIf { _x == player } > -1)) exitWith {};

// Показываем текст паузы
[_stopThisShit] call RT_Pause_fnc_showHint;

// Закрываем Инвентарь, Esc-menu, Карту
if (_stopThisShit) then {
	[] spawn {
		disableSerialization;
		findDisplay 49 closeDisplay 1;
		findDisplay 602 closeDisplay 1;
		openMap false;
	}
};

// Стопаем все инпуты
disableUserInput _stopThisShit;

// Это надо чтобы тормознуть предыдущие нажатые кнопки
if (!_stopThisShit) then {
	disableUserInput true;
	disableUserInput false;
};

private _vehicle = vehicle player;

// Если player в автомобиле И player водитель
if (_vehicle != player && driver _vehicle == player) then {
	if (_stopThisShit) then {
		player setVariable ["RT_Vars_stopstart_velocity", velocity _vehicle];

		// Закомменчено чтобы сохранить вектор направления, если не надо сохранять, можно раскомментить
		// _vehicle setPos getPos _vehicle;
		_vehicle setVelocity [0, 0, 0];
	} else {
		_vehicle setVelocity (player getVariable ["RT_Vars_stopstart_velocity", [0, 0, 0]]);
		player setVariable ["RT_Vars_stopstart_velocity", nil];
	};

	// Стопаем/запускаем симуляцию машины
	[_vehicle, !_stopThisShit] remoteExec ["enableSimulationGlobal", 0];
};

// Стопаем/запускаем симуляцию
[player, !_stopThisShit] remoteExec ["enableSimulationGlobal", 0];