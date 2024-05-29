/** Script Works Only with Ace */
if ([] call RT_UTILS_fnc_dontHasAce) exitwith {};

/** Only if real player */
if (!hasinterface) exitwith {};

_this spawn {
	[] call RT_UTILS_fnc_waitUntilPlayerInit;

	[player, RT_SPECTATOR_VAR_CHECKUNITS_HANDLER] call Rt_Utils_fnc_removeScripthandler;

	[player, RT_SPECTATOR_VAR_CHECKUNITS_HANDLER, [], {
		waitUntil {
			/** Remove all units */
			[[], allunits] call ace_spectator_fnc_updateunits;
			/** Adds only units in group except of player */
			[(units player) - [player], []] call ace_spectator_fnc_updateunits;

			sleep 30;
			false
		}
	}] call Rt_Utils_fnc_addScripthandler;
}
