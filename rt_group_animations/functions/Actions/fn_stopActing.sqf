// run on Local in Sheduled
if ([_this, true, false] call RT_Utils_fnc_callByScriptName) exitWith {};

params ["_player"];

private _outAnim = "";

switch (animationState _player) do {
    case "wbk_helldivers_salute_in";
    case "wbk_helldivers_salute_loop";
    case "wbk_helldivers_salute_out": {
        _outAnim = "WBK_HellDivers_salute_out";
    };
};

if (_outAnim != "" && animationState _player == _outAnim) exitWith {};

if (_outAnim != "") then {
	[_player, [_outAnim, 0, 0.1]] remoteExec ["switchMove", 0, true];

    sleep (_outAnim call RT_ANIMATIONS_fnc_getMoveDuration);
};

[_player, ["", 0, 0.1]] remoteExec ["switchMove", 0, true];
