private _subCategoryStr = "FUN";

RT_SETTINGS_FUN_enable = "SETTINGS_RT_SETTINGS_FUN_enable";
RT_SETTINGS_FUN_enable_glasses = "SETTINGS_RT_SETTINGS_FUN_enable_glasses";
RT_SETTINGS_FUN_enable_helldivers_artillery = "SETTINGS_RT_SETTINGS_FUN_enable_helldivers_artillery";

[
    RT_SETTINGS_FUN_enable, "CHECKBOX",
    ["Включить FUN", "Включить весёлые штуки, некоторые могут быть не очень весёлыми"],
    [RT_SETTINGS_category, _subCategoryStr],
    false,
    1
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_FUN_enable_glasses, "CHECKBOX",
    ["Включить Эффект VR-очков", "Включить Эффект VR-очков, когда появляется Valmar и грустный звук"],
    [RT_SETTINGS_category, _subCategoryStr],
    false,
    1
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_FUN_enable_helldivers_artillery, "CHECKBOX",
    ["Включить Эффект Helldivers артиллерии", "Включить Звук из Helldivers 2 при броске красной дымовой гранаты, если вы team leader. (Если выключить, то выключится только при ваших бросках)"],
    [RT_SETTINGS_category, _subCategoryStr],
    false,
    1
] call CBA_fnc_addSetting;

