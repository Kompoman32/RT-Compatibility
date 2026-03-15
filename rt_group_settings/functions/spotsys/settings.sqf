private _subCategoryStr = "SPOT SYSTEM";
private _subCategoryWalhackStr = "SPOT SYSTEM - Anduril EagleEye";

RT_SETTINGS_SPOTSYSTEM_enable = "SETTINGS_RT_SETTINGS_SPOTSYSTEM_enable";
RT_SETTINGS_SPOTSYSTEM_spot_icon = "SETTINGS_RT_SETTINGS_SPOTSYSTEM_spot_icon";
RT_SETTINGS_SPOTSYSTEM_spot_sound = "SETTINGS_RT_SETTINGS_SPOTSYSTEM_spot_sound";
RT_SETTINGS_SPOTSYSTEM_spot_add_voice_and_anim = "SETTINGS_RT_SETTINGS_SPOTSYSTEM_spot_add_voice_and_anim";
RT_SETTINGS_SPOTSYSTEM_max_spot_time = "SETTINGS_RT_SETTINGS_SPOTSYSTEM_max_spot_time";
RT_SETTINGS_SPOTSYSTEM_show_through_wall = "SETTINGS_RT_SETTINGS_SPOTSYSTEM_ignore_cansee";
RT_SETTINGS_SPOTSYSTEM_show_text = "SETTINGS_RT_SETTINGS_SPOTSYSTEM_show_text";
RT_SETTINGS_SPOTSYSTEM_show_EAST = "SETTINGS_RT_SETTINGS_SPOTSYSTEM_show_EAST";
RT_SETTINGS_SPOTSYSTEM_show_WEST = "SETTINGS_RT_SETTINGS_SPOTSYSTEM_show_WEST";
RT_SETTINGS_SPOTSYSTEM_show_RESISTANCE = "SETTINGS_RT_SETTINGS_SPOTSYSTEM_show_RESISTANCE";
RT_SETTINGS_SPOTSYSTEM_show_CIVILIAN = "SETTINGS_RT_SETTINGS_SPOTSYSTEM_show_CIVILIAN";

RT_SETTINGS_SPOTSYSTEM_WALLHACK_enable = "SETTINGS_RT_SETTINGS_SPOTSYSTEM_WALLHACK_enable";
RT_SETTINGS_SPOTSYSTEM_WALLHACK_max_spot_time = "SETTINGS_RT_SETTINGS_SPOTSYSTEM_WALLHACK_max_spot_time";
RT_SETTINGS_SPOTSYSTEM_WALLHACK_required_item = "SETTINGS_RT_SETTINGS_SPOTSYSTEM_WALLHACK_required_item";
RT_SETTINGS_SPOTSYSTEM_WALLHACK_required_item_equipped = "SETTINGS_RT_SETTINGS_SPOTSYSTEM_WALLHACK_required_item_equipped";
RT_SETTINGS_SPOTSYSTEM_WALLHACK_spot_grenades = "SETTINGS_RT_SETTINGS_SPOTSYSTEM_WALLHACK_spot_grenades";

[
    RT_SETTINGS_SPOTSYSTEM_enable, "CHECKBOX",
    ["Включить Spot систему", "Включить Simple Spot System by crub (+Anduril EagleEye)"],
    [RT_SETTINGS_category, _subCategoryStr],
    false,
    1,
	{ [_this] spawn RT_SpotSystem_fnc_enable; }
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_SPOTSYSTEM_spot_sound, "EDITBOX",
    ["Звук маркера новой цели", "Звук, воспроизводимый при обнаружении новой цели игроком"],
    [RT_SETTINGS_category, _subCategoryStr],
    "hint3",
    1
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_SPOTSYSTEM_spot_add_voice_and_anim, "CHECKBOX",
    ["Добавлять выкрик и анимацию игрока", "Добавлять выкрик и анимацию игрока при обнаружении цели"],
    [RT_SETTINGS_category, _subCategoryStr],
    true,
    1
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_SPOTSYSTEM_max_spot_time, "SLIDER",
    ["Максимальное время(с) видимости маркера", "Время в секундах, которое будет трэкаться юнит, после чего метка пропадёт"],
    [RT_SETTINGS_category, _subCategoryStr],
    [1, 300, 60, 0],
    1
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_SPOTSYSTEM_spot_icon, "EDITBOX",
    ["Иконка", "Показываемая иконка (+Anduril EagleEye)"],
    [RT_SETTINGS_category, _subCategoryStr],
    "a3\ui_f\data\igui\cfg\targeting\markedtarget_ca.paa",
    1
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_SPOTSYSTEM_show_through_wall, "CHECKBOX",
    ["Показывать иконки сквозь препятствия", "Показывать иконки замеченных целей сквозь препятствия"],
    [RT_SETTINGS_category, _subCategoryStr],
    false,
    1
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_SPOTSYSTEM_show_text, "LIST",
    ["Текст под иконкой", "Какой тип текста показывать под иконкой цели (+Anduril EagleEye)"],
    [RT_SETTINGS_category, _subCategoryStr],
    [
        [0,1,2],
        ["Ничего", "Тип цели (или имя если Civilian)", "Дистанция"],
        1
    ],
    1
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_SPOTSYSTEM_show_EAST, "CHECKBOX",
    ["Маркировать EAST", "Маркировать юнитов стороны EAST (+Anduril EagleEye)"],
    [RT_SETTINGS_category, _subCategoryStr],
    true,
    1
] call CBA_fnc_addSetting;
[
    RT_SETTINGS_SPOTSYSTEM_show_WEST, "CHECKBOX",
    ["Маркировать WEST", "Маркировать юнитов стороны WEST (+Anduril EagleEye)"],
    [RT_SETTINGS_category, _subCategoryStr],
    true,
    1
] call CBA_fnc_addSetting;
[
    RT_SETTINGS_SPOTSYSTEM_show_RESISTANCE, "CHECKBOX",
    ["Маркировать RESISTANCE", "Маркировать юнитов стороны RESISTANCE (+Anduril EagleEye)"],
    [RT_SETTINGS_category, _subCategoryStr],
    true,
    1
] call CBA_fnc_addSetting;
[
    RT_SETTINGS_SPOTSYSTEM_show_CIVILIAN, "CHECKBOX",
    ["Маркировать CIVILIAN", "Маркировать юнитов стороны CIVILIAN (+Anduril EagleEye)"],
    [RT_SETTINGS_category, _subCategoryStr],
    true,
    1
] call CBA_fnc_addSetting;



[
    RT_SETTINGS_SPOTSYSTEM_WALLHACK_enable, "CHECKBOX",
    ["Включить систему live-wallhack", "Включить систему постоянного обнаружения цели и передачи информации другим в отряде"],
    [RT_SETTINGS_category, _subCategoryWalhackStr],
    false,
    1,
    {
        [_this] spawn RT_SpotSystem_fnc_enableWallhack;
    }
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_SPOTSYSTEM_WALLHACK_max_spot_time, "SLIDER",
    ["Максимальное время(с) видимости маркера", "Время в секундах, которое будет трэкаться юнит (Если его никто не видит), после чего метка пропадёт"],
    [RT_SETTINGS_category, _subCategoryWalhackStr],
    [1, 300, 2, 0],
    1
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_SPOTSYSTEM_WALLHACK_required_item, "EDITBOX",
    ["Необходимый предмет в инвентаре", "Необходимый предмет в инвентаре, чтобы live-wallhack отмечал цели"],
    [RT_SETTINGS_category, _subCategoryWalhackStr],
    "",
    1
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_SPOTSYSTEM_WALLHACK_required_item_equipped, "CHECKBOX",
    ["Предмет должен быть экипирован", "Необходимый предмет должен быть экипирован, чтобы live-wallhack отмечал цели"],
    [RT_SETTINGS_category, _subCategoryWalhackStr],
    false,
    1
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_SPOTSYSTEM_WALLHACK_spot_grenades, "CHECKBOX",
    ["Учитывать гранаты", "Гранаты тоже будут отмечаться, исключая гранаты на основе SmokeShell, incendiary и flashbang из ACE включаются"],
    [RT_SETTINGS_category, _subCategoryWalhackStr],
    false,
    1
] call CBA_fnc_addSetting;