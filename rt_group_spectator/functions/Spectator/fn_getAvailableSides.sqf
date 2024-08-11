
private _sides = [];

if (RT_SETTINGS_SPECTATOR_west call CBA_settings_fnc_get) then {
	_sides pushBack west;
};

if (RT_SETTINGS_SPECTATOR_east call CBA_settings_fnc_get) then {
	_sides pushBack east;
};

if (RT_SETTINGS_SPECTATOR_resistance call CBA_settings_fnc_get) then {
	_sides pushBack resistance;
};

if (RT_SETTINGS_SPECTATOR_civilian call CBA_settings_fnc_get) then {
	_sides pushBack civilian;
};

// Если всё не выбрано, тогда добавляем сторону игрока
if (count _sides == 0) then {
	_sides pushBack (side group player);
};

_sides
