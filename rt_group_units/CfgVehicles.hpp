class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_MainActions {
                class RT_CarryAlivePlayer {
                    displayName = "$STR_ACE_Dragging_Carry";
                    condition = "[_player, _target] call RT_UNITS_fnc_canCarryAlivePlayer";
                    statement = "[_player, _target] call ace_dragging_fnc_startCarry";
                    icon = "z\ace\addons\dragging\UI\icons\person_carry.paa";
                };

                class ACE_LoadPatient;
                class RT_LoadPatient: ACE_LoadPatient {
                    displayName = "$STR_RT_UNITS_GUI_LoadAlivePlayer";
                    condition = "[_player, _target] call RT_UNITS_fnc_canLoadAlivePlayer";
                    statement = "[_player,_target] call ace_common_fnc_loadPerson";
                    icon = "z\ace\addons\dragging\UI\icons\person_carry.paa";
                    insertChildren = "";
                };
                class ACE_UnloadPatient;
                class RT_UnloadPatient: ACE_UnloadPatient {
                    displayName = "$STR_RT_UNITS_GUI_UnloadAlivePlayer";
                    condition = "[_player,_target] call RT_UNITS_fnc_canUnloadAlivePlayer";
                    statement = "[_target] call ace_common_fnc_unloadPerson";
                    icon = "z\ace\addons\dragging\UI\icons\person_carry.paa";
                };
            };
        };
        class ACE_SelfActions {
            class RT_AllowCarryYourself {
                displayName = "$STR_RT_UNITS_Allow_Carry";
                condition = "(RT_SETTINGS_INITIALIZATION_units call CBA_settings_fnc_get) && !(_this#0 getVariable [RT_UNITS_VAR_CAN_CARRY, false])";
                statement = "_this#0 setVariable [RT_UNITS_VAR_CAN_CARRY, true, true]";
                exceptions[] = {"isNotInside"};
                icon = "z\ace\addons\dragging\UI\icons\person_carry.paa";
            };
            class RT_DisallowCarryYourself {
                displayName = "$STR_RT_UNITS_Disallow_Carry";
                condition = "(RT_SETTINGS_INITIALIZATION_units call CBA_settings_fnc_get) && (_this#0 getVariable [RT_UNITS_VAR_CAN_CARRY, false])";
                statement = "_this#0 setVariable [RT_UNITS_VAR_CAN_CARRY, false, true]";
                exceptions[] = {"isNotInside"};
                icon = "z\ace\addons\dragging\UI\icons\person_carry.paa";
            };
        };
    };
}