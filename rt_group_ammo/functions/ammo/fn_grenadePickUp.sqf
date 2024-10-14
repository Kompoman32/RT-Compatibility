_this call ace_advanced_throwing_fnc_pickUp;

params ["_helper", "_player"];

private _activeThrowable = _helper getVariable ["ace_advanced_throwing_throwable", objNull];

if (_activeThrowable isKindOf "RT_G_Potato") then {
    _this#1 setVariable ["ace_advanced_throwing_primed", false];

    call ace_advanced_throwing_fnc_updateControlsHint;
    _this#1 addItem "RT_Potato"
};