/** Script Works Only with Ace */
if ([] call RT_UTILS_fnc_dontHasAce) exitwith {};

[] spawn {
	[] call RT_UTILS_fnc_waitUntilPlayerInit;

	private _handler = ["ace_firedPlayer", {
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
		
		if (leader player != player) exitWith {};
		if (_ammo != "SmokeShellRed" and (_ammo != "G_40mm_SmokeRed")) exitWith {};

		[_projectile] call RT_SUPPORT_fnc_expressArtillery;
	}] call CBA_fnc_addEventHandler;

	player setVariable [RT_SUPPORT_VAR_FIRED_HANDLER, _handler];
}