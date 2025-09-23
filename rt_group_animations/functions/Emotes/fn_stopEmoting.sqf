// run on Local in Sheduled
if ([_this, true, false] call RT_Utils_fnc_callByScriptName) exitWith {};

params ["_player"];

if (!weaponLowered _player) then {_player action ["WeaponOnBack", _player]; sleep 0.2; if (!weaponLowered _player) then {sleep 0.1}};  //-- Try to lower weapon, else; screw it

private _outAnim = "";

switch (gestureState _player) do {
    case "tsp_animate_jackoff_out";
    case "tsp_animate_jackoff_loop": {
        _outAnim = "tsp_animate_jackoff_out";
    };
};

if (_outAnim != "") exitWith {

    [_player, _outAnim] remoteExec ["playActionNow", 0, true];

    sleep (_outAnim call RT_ANIMATIONS_fnc_getGestureDuration);
};

if (gestureState _player == _outAnim) exitWith {};

[_player, "tsp_common_stop"] remoteExec ["playAction", 0, true];