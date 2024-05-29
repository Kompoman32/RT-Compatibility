// run on Local in Sheduled
if ([_this, true, false] call RT_Utils_fnc_callByScriptName) exitWith {};

	sleep 0.1;

	params ["_player", ["_danceAnim", "Acts_Dance_01"]];

	[_player, _danceAnim] remoteExec ["switchMove", 0, true];
