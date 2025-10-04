/*
    Description: Запустить анимацию Эмоций на юните
    Author: Kompoman32
    Made for: RT group
    
    Arguments:
    0: _unit - Юнит для применения анимации Эмоций
    1: _anim - Анимация (см. CfgVehicles >> CAManBase >> ACE_SelfActions >> RT_Animations >> Emotes (все вложенные))
    
    Examples:
    * [_unit, "rt_exercisePushup"] call RT_Animations_fnc_emote;
*/

// run on Local in Sheduled
if ([_this, true, false] call RT_Utils_fnc_callByScriptName) exitWith {};

sleep 0.1;

params ["_unit", ["_anim", "tsp_animate_bird"]];

if ([_unit] call RT_ANIMATIONS_fnc_isDancing) then {
    [_unit] call RT_ANIMATIONS_fnc_stopDancing;
    sleep 0.2;
};

if ([_unit] call RT_ANIMATIONS_fnc_isActing) then {
    [_unit] call RT_ANIMATIONS_fnc_stopActing;
    sleep 0.2;
};

if (!weaponLowered _unit) then {_unit action ["WeaponOnBack", _unit]; sleep 0.5; if (!weaponLowered _unit) then {sleep 0.1}};  //-- Try to lower weapon, else; screw it

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

if (_inAnim != "" && gestureState _unit == _inAnim) exitWith {};

if (_inAnim != "") then {
    [_unit, _inAnim] remoteExec ["playActionNow", 0, true];

    sleep (_inAnim call RT_ANIMATIONS_fnc_GetGestureDuration);
};


[_unit, _anim] remoteExec ["playActionNow", 0, true];

waitUntil {
    sleep 0.2;

    if (!alive _unit || _unit getVariable ["ACE_isUnconscious", false]) exitWith {
        [_unit] call RT_ANIMATIONS_fnc_stopEmoting;
        true;
    };

    if !([_unit, _anim] call RT_ANIMATIONS_fnc_isEmoting) exitWith {
        true
    };

    if !(weaponLowered _unit) exitWith {
        [_unit] call RT_ANIMATIONS_fnc_stopEmoting;
        true;
    }; 

    false
}

