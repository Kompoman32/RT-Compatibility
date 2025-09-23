// run on Local in Sheduled
if ([_this, true, false] call RT_Utils_fnc_callByScriptName) exitWith {};

sleep 0.1;

params ["_player", ["_anim", "Acts_Dance_01"]];

if ([_player] call RT_ANIMATIONS_fnc_isEmoting) then {
	[_player] call RT_ANIMATIONS_fnc_stopEmoting;
	sleep 0.2;
};

if ([_player] call RT_ANIMATIONS_fnc_isDancing) then {
	[_player] call RT_ANIMATIONS_fnc_stopDancing;
	sleep 0.2;
};

private _inAnim = "";

switch (_anim) do {
    case "wbk_helldivers_salute_in";
    case "wbk_helldivers_salute_loop": {
        _inAnim = "WBK_HellDivers_salute_in";
    };
};

if (_inAnim != "" && animationState _player == _inAnim) exitWith {};

if (_inAnim != "") then {
	[_player, [_inAnim, 0, 0.1]] remoteExec ["switchMove", 0, true];

    sleep (_inAnim call RT_ANIMATIONS_fnc_getMoveDuration);
};

[_player, [_anim, 0, 0.1]] remoteExec ["switchMove", 0, true];