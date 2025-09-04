/** Script Works Only with Ace */
if ([] call RT_UTILS_fnc_dontHasAce) exitwith {};

if (!hasInterface) exitWith {};

if !(RT_SETTINGS_INITIALIZATION_units call CBA_settings_fnc_get) exitwith {};

_this spawn {

    private _icon = "z\ace\addons\dragging\UI\icons\person_carry.paa";


    private _setAllowCarryAction = ["RT_Allow_Carry", localize "STR_RT_UNITS_Allow_Carry", _icon, {
            params ["_player"];
            
            _player setVariable [RT_UNITS_VAR_CAN_CARRY, true, true];
        }, {
            params ["_player"]; 
            !(_player getVariable [RT_UNITS_VAR_CAN_CARRY, false])
        }] call ACE_interact_menu_fnc_createAction;

    private _setDisallowCarryAction = ["RT_Disallow_Carry", localize "STR_RT_UNITS_Disallow_Carry", _icon, {
            params ["_player"];
            
            _player setVariable [RT_UNITS_VAR_CAN_CARRY, false, true];
        }, {
            params ["_player"]; 
            _player getVariable [RT_UNITS_VAR_CAN_CARRY, false];
        }] call ACE_interact_menu_fnc_createAction;

    private _carryAction = ["RT_Carry", localize "STR_ACE_Dragging_Carry", _icon, {
            params ["_target", "_player", "_params"];

            [_player, _target] call ace_dragging_fnc_startCarry
        }, {
            params ["_target", "_player", "_params"];

            if ([_player, _target] call ace_dragging_fnc_canCarry) exitWith {false};

            _target getVariable [RT_UNITS_VAR_CAN_CARRY, false] && stance _target == "PRONE"
        }] call ACE_interact_menu_fnc_createAction;

    ["CAManBase", 1, ["ACE_SelfActions"], _setAllowCarryAction, true] call ACE_interact_menu_fnc_addActionToClass;
    ["CAManBase", 1, ["ACE_SelfActions"], _setDisallowCarryAction, true] call ACE_interact_menu_fnc_addActionToClass;
    ["CAManBase", 0, ["ACE_MainActions"], _carryAction, true] call ACE_interact_menu_fnc_addActionToClass;
}


