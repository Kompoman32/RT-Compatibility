/** Only if real player */
if (!hasInterface) exitwith {};

_this spawn {
	[] call RT_UTILS_fnc_waitUntilPlayerInit;

	[player, "Killed", RT_SPECTATOR_VAR_KILLED_HANDLER] call Rt_Utils_fnc_removeEventhandler;

	[player, "Killed", RT_SPECTATOR_VAR_KILLED_HANDLER, { 
		params ["_unit", "_killer", "_instigator", "_useEffects"];

		[] call RT_Spectator_fnc_removeSpectator;
	}] call Rt_Utils_fnc_addEventhandler;
}
