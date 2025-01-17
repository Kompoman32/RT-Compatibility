// Если выключено, то не добавляем подсказку
if (!(RT_SETTINGS_SPECTATOR_enable call CBA_settings_fnc_get)) exitWith {};

/** Script Works Only with Ace */
if ([] call RT_UTILS_fnc_dontHasAce) exitwith {};

/** Only if real player */
if (!hasinterface) exitwith {};

// run on Local in Sheduled
if ([_this, true, false] call RT_Utils_fnc_callByScriptName) exitWith {};

[] call RT_UTILS_fnc_waitUntilPlayerInit;

waitUntil {!(isNull findDisplay 46)};

// Remove spectator just in case
// [] call RT_Spectator_fnc_removeSpectator;

"Rsc_RT_Spectator_UI" cutRsc ["Rsc_RT_Spectator_UI", "PLAIN", 0, true];
