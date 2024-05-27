/** Only if real player */
if (!hasInterface) exitwith {};

params ["_event", "_JIP"];

if (_JIP) then {
    private _eventHandler = player getVariable [RT_SPECTATOR_VAR_KILLED_HANDLER, nil];

	if (!(isNil "_eventHandler")) then {
		player removeEventHandler ["Killed", _eventHandler]
	};

	player setVariable [RT_SPECTATOR_VAR_KILLED_HANDLER, nil];
};

[] spawn {
	[] call RT_UTILS_fnc_waitUntilPlayerInit;

	private _handler = player addEventHandler ["Killed", { 
		params ["_unit", "_killer", "_instigator", "_useEffects"];

		[] call RT_Spectator_fnc_removeSpectator;
	}];

	player setVariable [RT_SPECTATOR_VAR_KILLED_HANDLER, _handler];
};

if (!isServer) exitWith {};

[] spawn {
	[] call RT_UTILS_fnc_waitUntilTime;

	sleep 120;

    private _handler = ["ace_unconscious", {
        params ["_unit", "_state"];

        if (!(isPlayer _unit) || !(alive _unit)) exitWith {};

        if (_state) then {
            [] remoteExec ["RT_Spectator_fnc_addSpectator", owner _unit, false];
        } else {
            [] remoteExec ["RT_Spectator_fnc_removeSpectator", owner _unit, false];
        };
    }] call CBA_fnc_addEventHandler;

    missionNamespace setVariable [RT_SPECTATOR_VAR_UNCOSCIOUS_HANDLER, _handler];
};
