/*
    Description: Доп функция для возможности вернуть Картошку обратно в инвентарь, после того как взяли активированную с пола
    Author: Kompoman32
    Made for: RT group
    
    Arguments:
    0: _helper - Helper from ACE
    
    Examples:
    * [_helper] call RT_Ammo_fnc_grenadePickUp;
*/

_this call ace_advanced_throwing_fnc_pickUp;

params ["_helper"];

private _activeThrowable = _helper getVariable ["ace_advanced_throwing_throwable", objNull];

if (_activeThrowable isKindOf "RT_G_Potato") then {
    _this#1 setVariable ["ace_advanced_throwing_primed", false];

    call ace_advanced_throwing_fnc_updateControlsHint;
    _this#1 addItem "RT_Potato"
};