if !(RT_SETTINGS_INITIALIZATION_dance call CBA_settings_fnc_get) exitwith {};

private _dances = "true" configClasses (configFile >> "CfgVehicles" >> "CAManBase" >> "ACE_SelfActions"  >> "RT_Animations" >> "Dances");
private _emotes = "true" configClasses (configFile >> "CfgVehicles" >> "CAManBase" >> "ACE_SelfActions"  >> "RT_Animations" >> "Emotes");
private _actes = "true" configClasses (configFile >> "CfgVehicles" >> "CAManBase" >> "ACE_SelfActions"  >> "RT_Animations" >> "Actions");
// private _dances = "true" configClasses (configFile >> "CfgVehicles" >> "CAManBase" >> "ACE_SelfActions"  >> "RT_Animations" >> "RT_Dances");

private _collectNames = {
	params ["_config"];

	private _children = "true" configClasses _config;

	if (count _children > 0) exitWith {
		_children apply {_x call _collectNames}
	};

	configName _config
};

RT_ANIMATIONS_AVAILABLE_DANCES = flatten (_dances apply {_x call _collectNames});
RT_ANIMATIONS_AVAILABLE_EMOTES = flatten (_emotes apply {_x call _collectNames});
RT_ANIMATIONS_AVAILABLE_ACTIONS = flatten (_actes apply {_x call _collectNames});


_this spawn {
	[] call RT_UTILS_fnc_waitUntilPlayerInit;

	// Отключение танцев при закрытии ACE Menu
	[player, "ace_interactMenuClosed", RT_ANIMATIONS_VAR_CHECK_HANDLER, {
		// Проверям что есть танцы, эмоции или действия
		if !([player] call RT_Animations_fnc_isAnimating)  exitWith {};

		[player] call RT_ANIMATIONS_fnc_stopAnimation;
	}] call Rt_Utils_fnc_addCBAEventhandler;
};