/** Script Works Only with Ace */
if ([] call RT_UTILS_fnc_dontHasAce) exitwith {};

/** Only if real player */
if (!hasinterface) exitwith {};

params ["_event", "_JIP"];

if (_JIP) then {
	private _eventHandler = player getVariable [RT_SPECTATOR_VAR_CHECKUNITS_HANDLER, nil];

	if (!(isNil "_eventHandler")) then {
		terminate _eventHandler
	};

	player setVariable [RT_SPECTATOR_VAR_CHECKUNITS_HANDLER, nil];
};

[] spawn {
	[] call RT_UTILS_fnc_waitUntilPlayerInit;

	private _handler = [] spawn {
		waitUntil {
			/** Remove all units */
			[[], allunits] call ace_spectator_fnc_updateunits;
			/** Adds only units in group except of player */
			[(units player) - [player], []] call ace_spectator_fnc_updateunits;

			sleep 30;
			false
		}
	};

	player setVariable [RT_SPECTATOR_VAR_CHECKUNITS_HANDLER, _handler];
};
