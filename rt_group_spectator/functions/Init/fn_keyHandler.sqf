/** Script Works Only with Ace */
if ([] call RT_UTILS_fnc_dontHasAce) exitwith {};

/** Only if real player */
if (!hasinterface) exitwith {};

// run Local in Sheduled
if ([_this, true] call RT_Utils_fnc_callByScriptName) exitWith {};

[] call RT_UTILS_fnc_waitUntilPlayerInit;
waitUntil {!(isNull findDisplay 46)};

params ["_event", "_JIP"];

if (_JIP) then {
	[player, "KeyUp", 46, RT_SPECTATOR_VAR_KEY_HANDLER] call Rt_Utils_fnc_removeDisplayEventhandler;
};

[player, "KeyUp", 46, RT_SPECTATOR_VAR_KEY_HANDLER, {
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
}] call Rt_Utils_fnc_addDisplayEventhandler;
