private _subCategoryStr = "VEHICLES";

RT_SETTINGS_VEHICLES_enable = "SETTINGS_RT_SETTINGS_VEHICLES_enable";

[
    RT_SETTINGS_VEHICLES_enable, "CHECKBOX",
    "Включить спуск по канатам в вертолётах",
    [RT_SETTINGS_category, _subCategoryStr],
    true,
    1
] call CBA_fnc_addSetting;

