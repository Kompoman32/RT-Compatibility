class CfgVehicles {
    class Man;
    class CAManBase: Man {
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