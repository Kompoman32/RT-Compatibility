private _subCategoryStr = "MEDICAL ASSISTANT";

RT_SETTINGS_MEDICAL_ASSISTANT = "SETTINGS_RT_SETTINGS_MEDICAL_ASSISTANT";
RT_SETTINGS_MEDICAL_ASSISTANT_ENABLE = "SETTINGS_RT_SETTINGS_MEDICAL_ASSISTANT_ENABLE";
RT_SETTINGS_MEDICAL_ASSISTANT_ALARM = "SETTINGS_RT_SETTINGS_MEDICAL_ASSISTANT_ALARM";
RT_SETTINGS_MEDICAL_ASSISTANT_GROUP_TYPE = "SETTINGS_RT_SETTINGS_MEDICAL_ASSISTANT_GROUP_TYPE";


RT_SETTINGS_MEDICAL_ASSISTANT_GROUP_TYPE_ALL = 0;
RT_SETTINGS_MEDICAL_ASSISTANT_GROUP_TYPE_PLAYERS = 1;
RT_SETTINGS_MEDICAL_ASSISTANT_GROUP_TYPE_SELF = 2;

[
    RT_SETTINGS_MEDICAL_ASSISTANT_ENABLE, "CHECKBOX", // setting type
    ["Включить", "Включить использование Medical Assistant"],
    [RT_SETTINGS_category, _subCategoryStr],
    true,
    1
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_MEDICAL_ASSISTANT_ALARM, "CHECKBOX", // setting type
    ["Medical Alarm", "Включить звук при падении в бессознательное состояние товарища по команде"],
    [RT_SETTINGS_category, _subCategoryStr],
    true,
    1
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_MEDICAL_ASSISTANT_GROUP_TYPE, "LIST",
    ["Отображение групп", "Какие группы можно выбрать"],
    [RT_SETTINGS_category, _subCategoryStr],
    [
        [RT_SETTINGS_MEDICAL_ASSISTANT_GROUP_TYPE_ALL, RT_SETTINGS_MEDICAL_ASSISTANT_GROUP_TYPE_PLAYERS, RT_SETTINGS_MEDICAL_ASSISTANT_GROUP_TYPE_SELF], 
        ["Все союзные группы", "Только группы с игроками", "Только текущая группа"], 
        1
    ],
    1
] call CBA_fnc_addSetting;
