/** Script Works Only with Ace */
if ([] call RT_UTILS_fnc_dontHasAce) exitwith {};

if !(RT_SETTINGS_INITIALIZATION_support call CBA_settings_fnc_get) exitwith {};

_this spawn {
	[] call RT_UTILS_fnc_waitUntilPlayerInit;

	[player, "ace_firedPlayer", RT_SUPPORT_VAR_FIRED_HANDLER] call Rt_Utils_fnc_removeCBAEventhandler;

	[player, "ace_firedPlayer", RT_SUPPORT_VAR_FIRED_HANDLER, {
		if (!(RT_SETTINGS_SUPPORT_enable_artillery call CBA_settings_fnc_get)) exitWith {};
		
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
		
		if (leader player != player) exitWith {};

		if (
			(_ammo == RT_SETTINGS_SUPPORT_support_throwable call CBA_settings_fnc_get)
			or
			((RT_SETTINGS_SUPPORT_enable_grenade_launcher call CBA_settings_fnc_get) and (_ammo == RT_SETTINGS_SUPPORT_support_gl_throwable call CBA_settings_fnc_get))
		) then {
			[_projectile] spawn RT_SUPPORT_fnc_expressArtillery;
		};
	}] call Rt_Utils_fnc_addCBAEventhandler;

}