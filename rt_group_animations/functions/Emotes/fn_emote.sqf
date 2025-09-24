// run on Local in Sheduled
if ([_this, true, false] call RT_Utils_fnc_callByScriptName) exitWith {};

sleep 0.1;

params ["_player", ["_anim", "tsp_animate_bird"]];

if ([_player] call RT_ANIMATIONS_fnc_isDancing) then {
	[_player] call RT_ANIMATIONS_fnc_stopDancing;
	sleep 0.2;
};

if ([_player] call RT_ANIMATIONS_fnc_isActing) then {
	[_player] call RT_ANIMATIONS_fnc_stopActing;
	sleep 0.2;
};

if (!weaponLowered _player) then {_player action ["WeaponOnBack", _player]; sleep 0.2; if (!weaponLowered _player) then {sleep 0.1}};  //-- Try to lower weapon, else; screw it

private _inAnim = "";

switch (_anim) do {
    case "tsp_animate_bird_in";
    case "tsp_animate_bird_loop": {
        _inAnim = "tsp_animate_bird_in";
    };

	case "tsp_animate_rockpaperscissors_in";
	case "tsp_animate_rockpaperscissors_rock_loop";
	case "tsp_animate_rockpaperscissors_paper_loop";
    case "tsp_animate_rockpaperscissors_scissors_loop": {
        _inAnim = "tsp_animate_rockpaperscissors_in";
    };
};

if (_inAnim != "" && gestureState _player == _inAnim) exitWith {};

if (_inAnim != "") then {
    [_player, _inAnim] remoteExec ["playActionNow", 0, true];

    sleep (_inAnim call RT_ANIMATIONS_fnc_GetGestureDuration);
};


[_player, _anim] remoteExec ["playActionNow", 0, true];

waitUntil {
	sleep 0.2;

	if (!alive _player || _player getVariable ["ACE_isUnconscious", false]) exitWith {
		[_player] call RT_ANIMATIONS_fnc_stopEmoting;
		true;
	};

	if !([_player, _anim] call RT_ANIMATIONS_fnc_isEmoting) exitWith {
		true
	};

	if !(weaponLowered _player) exitWith {
		[_player] call RT_ANIMATIONS_fnc_stopEmoting;
		true;
	}; 

	false
}

