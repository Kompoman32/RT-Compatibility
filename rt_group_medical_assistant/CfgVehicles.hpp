class CfgVehicles {
    class Man;
    class CAManBase: Man {
		class ACE_SelfActions {
            class ACE_Equipment {
                class RT_MedicalAssistant {
                    displayName = "Medical Assistant";
                    condition = "RT_SETTINGS_MEDICAL_ASSISTANT_ENABLE call CBA_settings_fnc_get";
                    showDisabled = 0;

                    icon = "a3\data_f_aow\logos\arma3_aow_logo_ca.paa";

					exceptions[] = {"notOnMap"};

                    class RT_MedicalAssistant_Open {
                        displayName = "$STR_RT_MEDICAL_ASSISTANT_Open";
                        condition = "true";
                        statement = "(findDisplay 46) createDisplay 'AMA_menu'";
                        showDisabled = 0;
                        icon = "a3\data_f_aow\logos\arma3_aow_logo_ca.paa";
                    };

                    class RT_MedicalAssistant_Disable {
                        displayName = "$STR_RT_MEDICAL_ASSISTANT_Disable";
                        condition = "player getVariable ['AMA_Medical_Device', true]";
                        statement = "[false] call RT_Medical_Assistant_fnc_toggle";
                        showDisabled = 0;
                        icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\intel_ca.paa";
                    };

                    class RT_MedicalAssistant_Enable {
                        displayName = "$STR_RT_MEDICAL_ASSISTANT_Enable";
                        condition = "!(player getVariable ['AMA_Medical_Device', true])";
                        statement = "[true] call RT_Medical_Assistant_fnc_toggle";
                        showDisabled = 0;
                        icon = "\A3\ui_f\data\igui\cfg\simpleTasks\types\intel_ca.paa";
                    };
                };
            };
        };
    };
}