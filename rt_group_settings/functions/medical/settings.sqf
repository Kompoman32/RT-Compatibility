private _subCategoryStr = "MEDICAL";
private _subCategoryStaminaStr = "MEDICAL - STAMINA";

RT_SETTINGS_MEDICAL = "SETTINGS_RT_SETTINGS_MEDICAL";

RT_SETTINGS_MEDICAL_FieldDressing = "SETTINGS_RT_SETTINGS_MEDICAL_FieldDressing";
RT_SETTINGS_MEDICAL_PackingBandage = "SETTINGS_RT_SETTINGS_MEDICAL_PackingBandage";
RT_SETTINGS_MEDICAL_ElasticBandage = "SETTINGS_RT_SETTINGS_MEDICAL_ElasticBandage";
RT_SETTINGS_MEDICAL_QuikClot = "SETTINGS_RT_SETTINGS_MEDICAL_QuikClot";

[
    RT_SETTINGS_MEDICAL_FieldDressing, "SLIDER",
    ["Множитель Бинтовой повязки", "Множитель скорости перевязкой используя Бинтовую повязку (чем больше тем дольше)"],
    [RT_SETTINGS_category, _subCategoryStr],
    [0.1, 3, 1, 2],
    1
] call CBA_fnc_addSetting;
[
    RT_SETTINGS_MEDICAL_PackingBandage, "SLIDER",
    ["Множитель Компресионного пакета", "Множитель скорости перевязкой используя Компресионный пакет (чем больше тем дольше)"],
    [RT_SETTINGS_category, _subCategoryStr],
    [0.1, 3, 1, 2],
    1
] call CBA_fnc_addSetting;
[
    RT_SETTINGS_MEDICAL_ElasticBandage, "SLIDER",
    ["Множитель Давящей повязки", "Множитель скорости перевязкой используя Давящуя повязку (чем больше тем дольше)"],
    [RT_SETTINGS_category, _subCategoryStr],
    [0.1, 3, 1, 2],
    1
] call CBA_fnc_addSetting;
[
    RT_SETTINGS_MEDICAL_QuikClot, "SLIDER",
    ["Множитель Первичного перевязочного пакета", "Множитель скорости перевязкой используя Первичный перевязочный пакет (чем больше тем дольше)"],
    [RT_SETTINGS_category, _subCategoryStr],
    [0.1, 3, 1, 2],
    1
] call CBA_fnc_addSetting;


RT_SETTINGS_MEDICAL_SecondWind = "SETTINGS_RT_SETTINGS_MEDICAL_SecondWind";
RT_SETTINGS_MEDICAL_SecondWindCooldown = "SETTINGS_RT_SETTINGS_MEDICAL_SecondWindCooldown";
RT_SETTINGS_MEDICAL_SecondWindAddedSeconds = "SETTINGS_RT_SETTINGS_MEDICAL_SecondWindAddedSeconds";

[
    RT_SETTINGS_MEDICAL_SecondWind, "CHECKBOX",
    ["Включить Второе дыхание", "Включить второе дыхание при получении урона при полностью израсходованной стамине"],
    [RT_SETTINGS_category, _subCategoryStaminaStr],
    true,
    1
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_MEDICAL_SecondWindCooldown, "TIME",
    ["Кулдаун Второго дыхания", "Через сколько может снова возникнуть Второе дыхание"],
    [RT_SETTINGS_category, _subCategoryStaminaStr],
    [0, 3600, 300],
    1
] call CBA_fnc_addSetting;

[
    RT_SETTINGS_MEDICAL_SecondWindAddedSeconds, "TIME",
    ["Добавляемое время бега", "Сколько секунд бега (стамины) добавится при активации Второго дыхания"],
    [RT_SETTINGS_category, _subCategoryStaminaStr],
    [0, 60, 10],
    1
] call CBA_fnc_addSetting;
