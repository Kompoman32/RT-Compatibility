private _subCategoryStr = "MEDICAL";

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

