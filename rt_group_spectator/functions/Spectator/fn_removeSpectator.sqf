// ACE3
[false, false, false] call ace_spectator_fnc_setSpectator;

private _hintCtrl = player getVariable [RT_SPECTATOR_VAR_HINT_CTRL, nil];

if (!(isnil "_hintCtrl")) then {
    ctrlDelete _hintCtrl;
};

player setVariable [RT_SPECTATOR_VAR_HINT_CTRL, nil];