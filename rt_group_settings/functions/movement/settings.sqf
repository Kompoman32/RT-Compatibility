private _subCategoryStr = "MOVEMENT";

RT_SETTINGS_MOVEMENT_enable_dropBackpack = "SETTINGS_RT_SETTINGS_MOVEMENT_enable_dropBackpack";

[
    RT_SETTINGS_MOVEMENT_enable_dropBackpack, "CHECKBOX",
    ["Включить сбрасывание/поднятие рюкзака", "Включить возможность игроку сбросить/поднять рюкзак"],
    [RT_SETTINGS_category, _subCategoryStr],
    true,
    1
] call CBA_fnc_addSetting;

RT_SETTINGS_MOVEMENT_enable_ladderSlide = "SETTINGS_RT_SETTINGS_MOVEMENT_enable_ladderSlide";

[
    RT_SETTINGS_MOVEMENT_enable_ladderSlide, "CHECKBOX",
    ["Включить быстрый спуск по лесенке", "Включить быстрый спуск по лесенке"],
    [RT_SETTINGS_category, _subCategoryStr],
    true,
    1
] call CBA_fnc_addSetting;




