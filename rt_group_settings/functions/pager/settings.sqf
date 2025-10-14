private _subCategoryStr = "PAGER";

RT_SETTINGS_PAGER_add_curators_recipients = "SETTINGS_RT_SETTINGS_PAGER_add_curators_recipients";

[
    RT_SETTINGS_PAGER_add_curators_recipients, "CHECKBOX",
    ["Добавлять Зевсов в получатели", "Добавлять Юниты Зевсов как получатели сообщений на пейджер"],
    [RT_SETTINGS_category, _subCategoryStr],
    false,
    1
] call CBA_fnc_addSetting;

