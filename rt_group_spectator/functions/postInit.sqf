/** Only if real player */
if (!hasInterface) exitwith {};

if !(RT_SETTINGS_INITIALIZATION_spectator call CBA_settings_fnc_get) exitwith {};

_this spawn {
	[] call RT_UTILS_fnc_waitUntilPlayerInit;

	// [player, "Killed", RT_SPECTATOR_VAR_KILLED_HANDLER] call Rt_Utils_fnc_removeEventhandler;
	// [player, "Killed", RT_SPECTATOR_VAR_KILLED_HANDLER, { 
	// 	// params ["_unit", "_killer", "_instigator", "_useEffects"];

	// 	[] call RT_Spectator_fnc_removeSpectator;
	// }] call Rt_Utils_fnc_addEventhandler;

	[player, "Respawn", RT_SPECTATOR_VAR_RESPAWN_HANDLER] call Rt_Utils_fnc_removeEventhandler;
	[player, "Respawn", RT_SPECTATOR_VAR_RESPAWN_HANDLER, { 
		// params ["_unit", "_corpse"];

		[] call RT_Spectator_fnc_removeSpectator;
	}] call Rt_Utils_fnc_addEventhandler;

	[missionNameSpace, "ace_spectatorSet", RT_SPECTATOR_VAR_SPECTATOR_SET_HANDLER] call Rt_Utils_fnc_removeCBAEventhandler;
	[missionNameSpace, "ace_spectatorSet", RT_SPECTATOR_VAR_SPECTATOR_SET_HANDLER, {
		params ["_set", "_player"];

		if (_player != player) exitWith {};

		if (_set) then {
			[true] call RT_Spectator_fnc_removeSpectator;
		} else {
			[] call RT_Spectator_fnc_addSpectator;
		};

		// because in ace_spectator_fnc_setSpectator it set to value of argument 0
		// ace_hearing_disableVolumeUpdate = !_set;

	}] call Rt_Utils_fnc_addCBAEventhandler;
}
