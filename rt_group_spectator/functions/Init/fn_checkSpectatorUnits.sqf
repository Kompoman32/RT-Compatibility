/** Script Works Only with Ace */
if ([] call RT_UTILS_fnc_dontHasAce) exitwith {};

/** Only if real player */
if (!hasinterface) exitwith {};

_this spawn {
	[] call RT_UTILS_fnc_waitUntilPlayerInit;

	[player, RT_SPECTATOR_VAR_CHECKUNITS_HANDLER] call Rt_Utils_fnc_removeScripthandler;

	[player, RT_SPECTATOR_VAR_CHECKUNITS_HANDLER, [], {
		waitUntil {
        	if (!(RT_SETTINGS_SPECTATOR_enable call CBA_settings_fnc_get)) exitWith {sleep RT_SPECTATOR_VAR_CHECKUNITS_DELAY};

			// ставим здесь, потому что нигде для этого нет настроек
			ace_spectator_availableSides = [] call RT_Spectator_fnc_getAvailableSides;

			/** Remove all units */
			[[], allunits] call ace_spectator_fnc_updateunits;

			/** Adds only units in group except of player */
			private _unitsToAdd = (flatten (([] call RT_Utils_fnc_getAllPlayersWithoutCurators) apply {units _x})) select {_x != player};

			[_unitsToAdd, []] call ace_spectator_fnc_updateunits;

			// Если переключились на юнита, которого там быть не должно, переключаемся на первого валидного
			if (!isNil "ace_spectator_camFocus") then {
				if (_unitsToAdd findIf {_x == ace_spectator_camFocus} == -1) then {
					[_unitsToAdd select 0] call ace_spectator_fnc_setFocus;
				};
			};

			sleep RT_SPECTATOR_VAR_CHECKUNITS_DELAY;
			false
		}
	}] call Rt_Utils_fnc_addScripthandler;
}


// private _playerSide = side group player;
// _unitsToAdd = _unitsToAdd arrayIntersect _unitsToAdd;
// _unitsToAdd = _unitsToAdd - [player];

// private _unitsToAdd = (units player) - [player];

// private _playerSide = side group player;

// if (count (_unitsToAdd) == 0) then {
// 	// Взять всех юнитов во всех командах, где есть Player'ы, той же стороны что и текущий player (без кураторов).
// 	_unitsToAdd = (flatten ((([] call RT_Utils_fnc_getAllPlayersWithoutCurators) select {side _x == _playerSide}) apply {units _x}));

// 	// возьмём только уникальных
// 	_unitsToAdd = _unitsToAdd arrayIntersect _unitsToAdd;
// 	// уберём себя
// 	_unitsToAdd = _unitsToAdd - [player];


// 	// если никого нет, добавим всех юнитов текущей стороны, кроме игрока
// 	if (count _unitsToAdd == 0) then {
// 		_unitsToAdd = (allUnits select {side _x == _playerSide}) -  [player];
// 	};

// 	// если никого нет, добавим всех юнитов, кроме игрока
// 	if (count _unitsToAdd == 0) then {
// 		_unitsToAdd = (allUnits) -  [player];
// 	};
// };



