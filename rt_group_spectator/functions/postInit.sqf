/** Only if real player */
if (!hasInterface) exitwith {};

params ["_event", "_JIP"];

// run on Local in Sheduled
if ([_this, true, false] call RT_Utils_fnc_callByScriptName) exitWith {};

if (_JIP) then {
	[player, "Killed", RT_SPECTATOR_VAR_KILLED_HANDLER] call Rt_Utils_fnc_removeEventhandler;
};

[] call RT_UTILS_fnc_waitUntilPlayerInit;

[player, "Killed", RT_SPECTATOR_VAR_KILLED_HANDLER, { 
	params ["_unit", "_killer", "_instigator", "_useEffects"];

	[] call RT_Spectator_fnc_removeSpectator;
}] call Rt_Utils_fnc_addEventhandler;
