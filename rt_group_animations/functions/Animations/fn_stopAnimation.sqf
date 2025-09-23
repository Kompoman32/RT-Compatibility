// run on Local in Sheduled
if ([_this, true, false] call RT_Utils_fnc_callByScriptName) exitWith {};

params ["_player"];

if ([_player] call RT_ANIMATIONS_fnc_isDancing) exitWIth {
	[_player] call RT_ANIMATIONS_fnc_stopDancing;
	sleep 0.2;
};

if ([_player] call RT_ANIMATIONS_fnc_isEmoting) exitWIth {
	[_player] call RT_ANIMATIONS_fnc_stopEmoting;
	sleep 0.2;
};

if ([_player] call RT_ANIMATIONS_fnc_isActing) exitWIth {
	[_player] call RT_ANIMATIONS_fnc_stopActing;
	sleep 0.2;
};

[_player, ["", 0, 0.1]] remoteExec ["switchMove", 0, true];
