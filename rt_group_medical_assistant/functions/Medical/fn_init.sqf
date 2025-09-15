#include "\a3\editor_f\Data\Scripts\dikCodes.h"

if !(hasInterface) exitWith {};

[
    "itemAdd",
    [
        "ace3medicalassistent",
        {
            if (time < 5) exitWith {};

            {
                if (RT_SETTINGS_MEDICAL_ASSISTANT_ALARM call CBA_Settings_fnc_get && player getVariable ["AMA_Medical_Device",true]) then
                {
                    private _unit = _x;
                    private _old_state = _unit getVariable ["RT_MedicalAssistentLastState", false];

                    private _new_state = _unit getVariable ["ACE_isUnconscious", false];
                    if (!(_new_state isEqualTo _old_state) && _new_state) then
                    {
                        playSound "warning_medical";
                    };

                    _unit setVariable ["RT_MedicalAssistentLastState", _new_state];
                };
            } foreach (units group player);
        },
        1
    ]
] call BIS_fnc_loop;
