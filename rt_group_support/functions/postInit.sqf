/** Script Works Only with Ace */
if ([] call RT_UTILS_fnc_dontHasAce) exitwith {};

_this spawn {
	[] call RT_UTILS_fnc_waitUntilPlayerInit;

	[player, "ace_firedPlayer", RT_SUPPORT_VAR_FIRED_HANDLER] call Rt_Utils_fnc_removeCBAEventhandler;

	[player, "ace_firedPlayer", RT_SUPPORT_VAR_FIRED_HANDLER, {
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
		
		if (leader player != player) exitWith {};
		if (_ammo != "SmokeShellRed" and (_ammo != "G_40mm_SmokeRed")) exitWith {};

		[_projectile] spawn RT_SUPPORT_fnc_expressArtillery;
	}] call Rt_Utils_fnc_addCBAEventhandler;

}