private _subCategoryStr = "Animations";

RT_SETTINGS_ANIMATIONS_enable = "SETTINGS_RT_SETTINGS_ANIMATIONS_enable";
RT_SETTINGS_ANIMATIONS_Dances_enable = "SETTINGS_RT_SETTINGS_ANIMATIONS_Dances_enable";
RT_SETTINGS_ANIMATIONS_Emotes_enable = "SETTINGS_RT_SETTINGS_ANIMATIONS_Emotes_enable";
RT_SETTINGS_ANIMATIONS_Actions_enable = "SETTINGS_RT_SETTINGS_ANIMATIONS_Actions_enable";

[
    RT_SETTINGS_ANIMATIONS_enable, "CHECKBOX",
    ["Включить анимации", "Включить пункт в меню для управление анимациями"],
    [RT_SETTINGS_category, _subCategoryStr],
    true,
    1
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_ANIMATIONS_Dances_enable, "CHECKBOX",
    ["Добавить Танцы", "Добавить Танцы в меню анимаций"],
    [RT_SETTINGS_category, _subCategoryStr],
    true,
    1
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_ANIMATIONS_Emotes_enable, "CHECKBOX",
    ["Добавить Эмоции", "Добавить Эмоции в меню анимаций"],
    [RT_SETTINGS_category, _subCategoryStr],
    true,
    1
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_ANIMATIONS_Actions_enable, "CHECKBOX",
    ["Добавить Действия", "Добавить Действия в меню анимаций"],
    [RT_SETTINGS_category, _subCategoryStr],
    true,
    1
] call CBA_fnc_addSetting;

