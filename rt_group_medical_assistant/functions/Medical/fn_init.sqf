#include "\a3\editor_f\Data\Scripts\dikCodes.h"

if !(hasInterface) exitWith {};

private _toggleActionMenu = ['MedicalAssistantMenu','Medical Assistant','\A3\Ui_f\data\IGUI\RscCustomInfo\Sensors\Threats\missile_ca.paa',
{
    [] spawn
    {
        if !(isNull (findDisplay 46)) then
        {
            [] spawn {
                (findDisplay 46) createDisplay "AMA_menu";
            };
        };
    };

},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "ACE_Equipment"], _toggleActionMenu] call ace_interact_menu_fnc_addActionToObject;

private _toggleAction = ['MedicalAssistantToggle','Toggle Medical Assistant','\A3\ui_f\data\igui\cfg\simpleTasks\types\intel_ca.paa',
{
    if (player getVariable ["AMA_Medical_Device",true]) then
    {
        player setVariable ["AMA_Medical_Device",false,true];
        hint parseText "<t color='#ff0000' font='PuristaBold'>MEDICAL ASSISTANT DISABLED</t>";
    }
    else
    {
        player setVariable ["AMA_Medical_Device",true,true];
        hint parseText "<t color='#00ff00' font='PuristaBold'>MEDICAL ASSISTANT ENABLED</t>";
    }
},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "ACE_Equipment", "MedicalAssistantMenu"], _toggleAction] call ace_interact_menu_fnc_addActionToObject;

["Ace3 Medical Assistant","show_menu_key", "Open Medical Tablet",
"",
{
    if !(isNull (findDisplay RT_MEDICAL_ASSSISTANT_VAR_DISPLAY_IDC)) exitWith {};

    (findDisplay 46) createDisplay "AMA_menu";
}, [DIK_NUMPAD5, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
["Ace3 Medical Assistant","toggle_data_transfer_key", "Toggle Medical Data Transfer",
{
    if (player getVariable ["AMA_Medical_Device",true]) then
    {
        player setVariable ["AMA_Medical_Device",false,true];
        hint parseText "<t color='#ff0000' font='PuristaBold'>MEDICAL ASSISTANT DISABLED</t>";
    }
    else
    {
        player setVariable ["AMA_Medical_Device",true,true];
        hint parseText "<t color='#00ff00' font='PuristaBold'>MEDICAL ASSISTANT ENABLED</t>";
    }
}, "", [DIK_NUMPAD8, [true, false, false]]] call CBA_fnc_addKeybind;

[
  "medicalassistant_volume", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
  "CHECKBOX", // setting type
  "Medical Alarm", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
  "ACE Medical Assistant", // Pretty name of the category where the setting can be found. Can be stringtable entry.
  [true], // data for this setting: [min, max, default, number of shown trailing decimals]
  nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
  {
    params ["_value"];
    player setVariable ["AMA_Medical_Device_alarm",_value];
  } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "itemAdd",
    [
        "ace3medicalassistent",
        {
            if (time < 5) exitWith {};

            {
                if (player getVariable ["AMA_Medical_Device",true] && player getVariable ["AMA_Medical_Device_alarm",true]) then
                {
                    private _unit = _x;
                    private _old_state = _unit getVariable ["ace3medicalassistent_last_state", false];

                    private _new_state = _unit getVariable ["ACE_isUnconscious", false];
                    if (!(_new_state isEqualTo _old_state) && _new_state) then
                    {
                        playSound "warning_medical";
                    };

                    _unit setVariable ["ace3medicalassistent_last_state", _new_state];
                };
            } foreach (units group player);
        },
        1
    ]
] call BIS_fnc_loop;
