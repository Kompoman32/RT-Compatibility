private _subCategoryStr = "RESPAWN";

RT_SETTINGS_RESPAWN_enable = "SETTINGS_RT_SETTINGS_RESPAWN_enable";

[
    RT_SETTINGS_RESPAWN_enable, "CHECKBOX",
    ["Включить локальные респавны", "Включить локальные респавны, респавны появляются только для игроков в одной группе"],
    [RT_SETTINGS_category, _subCategoryStr],
    true,
    1
] call CBA_fnc_addSetting;

