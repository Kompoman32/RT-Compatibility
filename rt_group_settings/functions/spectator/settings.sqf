private _subCategoryStr = "SPECTATOR";
private _sub2CategoryStr = "SPECTATOR SIDES";
private _sub3CategoryStr = "SPECTATOR QUOTES";

RT_SETTINGS_SPECTATOR_enable = "SETTINGS_RT_SETTINGS_SPECTATOR_enable";
RT_SETTINGS_SPECTATOR_west = "SETTINGS_RT_SETTINGS_SPECTATOR_west";
RT_SETTINGS_SPECTATOR_east = "SETTINGS_RT_SETTINGS_SPECTATOR_east";
RT_SETTINGS_SPECTATOR_resistance = "SETTINGS_RT_SETTINGS_SPECTATOR_resistance";
RT_SETTINGS_SPECTATOR_civilian = "SETTINGS_RT_SETTINGS_SPECTATOR_civilian";

RT_SETTINGS_SPECTATOR_enable_quotes = "SETTINGS_RT_SETTINGS_SPECTATOR_enable_quotes";

[
    RT_SETTINGS_SPECTATOR_enable, "CHECKBOX",
    ["Включить режим наблюдателя", "Включить режим наблюдателя при падении в Unconscious"],
    [RT_SETTINGS_category, _subCategoryStr],
    true,
    1
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_SPECTATOR_west, "CHECKBOX",
    ["West?", "Можно ли наблюдать за стороной West"],
    [RT_SETTINGS_category, _sub2CategoryStr],
    true,
    1
] call CBA_fnc_addSetting;
[
    RT_SETTINGS_SPECTATOR_east, "CHECKBOX",
    ["East?", "Можно ли наблюдать за стороной East"],
    [RT_SETTINGS_category, _sub2CategoryStr],
    false,
    1
] call CBA_fnc_addSetting;
[
    RT_SETTINGS_SPECTATOR_resistance, "CHECKBOX",
    ["Resistance?", "Можно ли наблюдать за стороной Resistance"],
    [RT_SETTINGS_category, _sub2CategoryStr],
    false,
    1
] call CBA_fnc_addSetting;
[
    RT_SETTINGS_SPECTATOR_civilian, "CHECKBOX",
    ["Civilian?", "Можно ли наблюдать за стороной Civilian"],
    [RT_SETTINGS_category, _sub2CategoryStr],
    false,
    1
] call CBA_fnc_addSetting;


[
    RT_SETTINGS_SPECTATOR_enable_quotes, "CHECKBOX",
    ["Цитаты в режиме присмерти", "Включить показ цитат при падении в Unconscious"],
    [RT_SETTINGS_category, _sub3CategoryStr],
    true,
    1
] call CBA_fnc_addSetting;
