/** Script Works Only with Ace */
if ([] call RT_UTILS_fnc_dontHasAce) exitwith {};

/** Only if real player */
if (!hasinterface) exitwith {};

params ["_event", "_JIP"];

if (_JIP) then {
    private _eventHandler = player getVariable [RT_SPECTATOR_VAR_KEY_HANDLER, nil];

	if (!(isnil "_eventHandler")) then {
		(findDisplay 46) displayRemoveEventHandler ["KeyUp", _eventHandler];
	};

	player setVariable [RT_SPECTATOR_VAR_KEY_HANDLER, nil];
};

[] spawn {
	[] call RT_UTILS_fnc_waitUntilPlayerInit;
    
	waitUntil {!(isNull findDisplay 46)};

    private _eventHandler = (findDisplay 46) displayAddEventHandler ["KeyUp", {
        params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
        
        /**
        * https// community.bistudio.com/wiki/DIK_KeyCodes
        * press number Enter (main) or Enter (numpad) to enter
        * press Esc to exit
        */
        
        if (!(player getVariable ["ACE_isUnconscious", false])) exitWith {};

        if ((_key isEqualto 0x1C) or (_key isEqualto 0x9C)) exitwith {
            [true, false, false] call ace_spectator_fnc_setSpectator
        };
        
        false
    }];

    player setVariable [RT_SPECTATOR_VAR_KEY_HANDLER, _eventHandler];

}
