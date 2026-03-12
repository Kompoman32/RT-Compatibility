params ["_unit"];

private _validSide = switch (side _unit) do {
	case east: {RT_SETTINGS_SPOTSYSTEM_show_EAST call CBA_settings_fnc_get};
	case west: {RT_SETTINGS_SPOTSYSTEM_show_WEST call CBA_settings_fnc_get};
	case resistance: {RT_SETTINGS_SPOTSYSTEM_show_RESISTANCE call CBA_settings_fnc_get};
	case civilian: {RT_SETTINGS_SPOTSYSTEM_show_CIVILIAN call CBA_settings_fnc_get};
	case sideUnknown: {true};
	default {false};
};

_validSide