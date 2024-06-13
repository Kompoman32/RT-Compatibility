private _subCategoryStr = "Dance";

RT_SETTINGS_DANCE_enable = "SETTINGS_RT_SETTINGS_DANCE_enable";

[
    RT_SETTINGS_DANCE_enable, "CHECKBOX",
    ["Включить танцы", "Включить танцы"],
    [RT_SETTINGS_category, _subCategoryStr],
    true,
    1
] call CBA_fnc_addSetting;
