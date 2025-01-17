params [["_onlyMessage", false]];

if (!_onlyMessage) then {

    [false, false, false] call ace_spectator_fnc_setSpectator;
};

"Rsc_RT_Spectator_UI" cutFadeOut 0;
"Rsc_RT_Spectator_Quotes_UI" cutFadeOut 0;
