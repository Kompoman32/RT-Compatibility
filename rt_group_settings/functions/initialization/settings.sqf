RT_SETTINGS_INITIALIZATION_dance = "SETTINGS_RT_SETTINGS_INITIALIZATION_dance";
RT_SETTINGS_INITIALIZATION_fun = "SETTINGS_RT_SETTINGS_INITIALIZATION_fun";
RT_SETTINGS_INITIALIZATION_medical = "SETTINGS_RT_SETTINGS_INITIALIZATION_medical";
RT_SETTINGS_INITIALIZATION_music = "SETTINGS_RT_SETTINGS_INITIALIZATION_music";
RT_SETTINGS_INITIALIZATION_movement = "SETTINGS_RT_SETTINGS_INITIALIZATION_movement";
RT_SETTINGS_INITIALIZATION_pause = "SETTINGS_RT_SETTINGS_INITIALIZATION_pause";
RT_SETTINGS_INITIALIZATION_recordings = "SETTINGS_RT_SETTINGS_INITIALIZATION_recordings";
RT_SETTINGS_INITIALIZATION_respawn = "SETTINGS_RT_SETTINGS_INITIALIZATION_respawn";
RT_SETTINGS_INITIALIZATION_spectator = "SETTINGS_RT_SETTINGS_INITIALIZATION_spectator";
RT_SETTINGS_INITIALIZATION_support = "SETTINGS_RT_SETTINGS_INITIALIZATION_support";
RT_SETTINGS_INITIALIZATION_units = "SETTINGS_RT_SETTINGS_INITIALIZATION_units";

[
    RT_SETTINGS_INITIALIZATION_dance, "CHECKBOX",
    ["Dance", "Добавление ace экшенов для танцев"],
    RT_SETTINGS_category_initialization,
    true,
    1,
	{},
	true
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_INITIALIZATION_fun, "CHECKBOX",
    ["Fun", "Включение обработчиков эвентов для fun скриптов"],
    RT_SETTINGS_category_initialization,
    true,
    1,
	{},
	true
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_INITIALIZATION_medical, "CHECKBOX",
    ["Medical", "Включение обработчиков эвентов для ace_medical_injured для второго дыхания и настройки бинтов"],
    RT_SETTINGS_category_initialization,
    true,
    1,
	{},
	true
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_INITIALIZATION_movement, "CHECKBOX",
    ["Movement", "Включение обработчиков анимаций при доставании medical assistant"],
    RT_SETTINGS_category_initialization,
    true,
    1,
	{},
	true
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_INITIALIZATION_music, "CHECKBOX",
    ["Music", "Включение обработчика PlayerDisconnected для отслеживания окончания музыки"],
    RT_SETTINGS_category_initialization,
    true,
    1,
	{},
	true
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_INITIALIZATION_pause, "CHECKBOX",
    ["Pause", "Добавление ace экшенов для остановки симуляции"],
    RT_SETTINGS_category_initialization,
    true,
    1,
	{},
	true
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_INITIALIZATION_recordings, "CHECKBOX",
    ["Recordings", "Включение обработчиков эвентов для отображения эвентов на полоске steam записи"],
    RT_SETTINGS_category_initialization,
    true,
    1,
	{},
	true
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_INITIALIZATION_respawn, "CHECKBOX",
    ["Respawn", "Включение обработчиков респавнов"],
    RT_SETTINGS_category_initialization,
    true,
    1,
	{},
	true
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_INITIALIZATION_spectator, "CHECKBOX",
    ["Spectator", "Включение обработчиков падений и добавления наблюдателя"],
    RT_SETTINGS_category_initialization,
    true,
    1,
	{},
	true
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_INITIALIZATION_support, "CHECKBOX",
    ["Support", "Включения обработчика выстрела, для быстрой артилерии"],
    RT_SETTINGS_category_initialization,
    true,
    1,
	{},
	true
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_INITIALIZATION_units, "CHECKBOX",
    ["Units", "Добавление ace экшенов добровольного ношения себя"],
    RT_SETTINGS_category_initialization,
    true,
    1,
	{},
	true
] call CBA_fnc_addSetting;

