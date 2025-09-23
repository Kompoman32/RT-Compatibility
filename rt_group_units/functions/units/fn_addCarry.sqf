private _carryAction = ["RT_CarryUnit", localize "STR_ACE_Dragging_Carry", "z\ace\addons\dragging\UI\icons\person_carry.paa", {
    params ["_target", "_player"];
    [_player, _target] call ace_dragging_fnc_startCarry;
}, {
    params ["_target", "_player"];
    if ([_player, _target] call ace_dragging_fnc_canCarry) exitWith {false};
    true
}] call ACE_interact_menu_fnc_createAction;

[_this, 0, ["ACE_MainActions"], _carryAction] call ace_interact_menu_fnc_addActionToObject;

_carryAction
