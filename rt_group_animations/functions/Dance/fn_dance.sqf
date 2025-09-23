// run on Local in Sheduled
if ([_this, true, false] call RT_Utils_fnc_callByScriptName) exitWith {};

sleep 0.1;

params ["_player", ["_anim", "Acts_Dance_01"]];

if ([_player] call RT_ANIMATIONS_fnc_isEmoting) then {
	[_player] call RT_ANIMATIONS_fnc_stopEmoting;
	sleep 0.2;
};

if ([_player] call RT_ANIMATIONS_fnc_isActing) then {
	[_player] call RT_ANIMATIONS_fnc_stopActing;
	sleep 0.2;
};

[_player, [_anim, 0, 0.1]] remoteExec ["switchMove", 0, true];