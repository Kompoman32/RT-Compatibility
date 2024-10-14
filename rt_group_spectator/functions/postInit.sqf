/** Only if real player */
if (!hasInterface) exitwith {};

_this spawn {
	[] call RT_UTILS_fnc_waitUntilPlayerInit;

	[player, "Killed", RT_SPECTATOR_VAR_KILLED_HANDLER] call Rt_Utils_fnc_removeEventhandler;

	[player, "Killed", RT_SPECTATOR_VAR_KILLED_HANDLER, { 
		params ["_unit", "_killer", "_instigator", "_useEffects"];

		[] call RT_Spectator_fnc_removeSpectator;
	}] call Rt_Utils_fnc_addEventhandler;

	[missionNameSpace, "ace_spectatorSet", RT_SPECTATOR_VAR_SPECTATOR_SET_HANDLER] call Rt_Utils_fnc_removeCBAEventhandler;
	[missionNameSpace, "ace_spectatorSet", RT_SPECTATOR_VAR_SPECTATOR_SET_HANDLER, {
		params ["_set", "_player"];

		if (_player != player) exitWith {};

		// because in ace_spectator_fnc_setSpectator it set to value of argument 0
		ace_hearing_disableVolumeUpdate = true;
	}] call Rt_Utils_fnc_addCBAEventhandler;
}
