private _subCategoryStr = "SUPPORT";

RT_SETTINGS_SUPPORT_enable_artillery = "SETTINGS_RT_SETTINGS_SUPPORT_enable_artillery";
RT_SETTINGS_SUPPORT_artillery_sleep_before = "SETTINGS_RT_SETTINGS_SUPPORT_artillery_sleepBefore";
RT_SETTINGS_SUPPORT_artillery_ammo = "SETTINGS_RT_SETTINGS_SUPPORT_artillery_ammo";
RT_SETTINGS_SUPPORT_artillery_target_radius = "SETTINGS_RT_SETTINGS_SUPPORT_artillery_target_radius";
RT_SETTINGS_SUPPORT_artillery_shots_count = "SETTINGS_RT_SETTINGS_SUPPORT_artillery_shots_count";
RT_SETTINGS_SUPPORT_artillery_shots_delay = "SETTINGS_RT_SETTINGS_SUPPORT_artillery_shots_delay";
RT_SETTINGS_SUPPORT_artillery_safe_zone_radius = "SETTINGS_RT_SETTINGS_SUPPORT_artillery_safe_zone_radius";
RT_SETTINGS_SUPPORT_artillery_safe_shell_spawn_altitude = "SETTINGS_RT_SETTINGS_SUPPORT_artillery_safe_shell_spawn_altitude";
RT_SETTINGS_SUPPORT_artillery_safe_shell_spawn_speed = "SETTINGS_RT_SETTINGS_SUPPORT_artillery_safe_shell_spawn_speed";

[
    RT_SETTINGS_SUPPORT_enable_artillery, "CHECKBOX",
    ["Включить быструю артиллерию", "Включить быструю артиллерию, при броске красной дымовой гранаты, если вы team leader"],
    [RT_SETTINGS_category, _subCategoryStr],
    true,
    1
] call CBA_fnc_addSetting;
[
    RT_SETTINGS_SUPPORT_artillery_sleep_before, "EDITBOX",
    "Время перед стартом бомбардировки (в секундах)",
    [RT_SETTINGS_category, _subCategoryStr],
    "10",
    1
] call CBA_fnc_addSetting;
[
    RT_SETTINGS_SUPPORT_artillery_ammo, "LIST",
    "Используемый снаряд",
    [RT_SETTINGS_category, _subCategoryStr],
    [["Sh_82mm_AMOS",
    "Sh_82mm_AMOS_guided",
    "Sh_82mm_AMOS_LG",
    "F_40mm_White",
    "Smoke_82mm_AMOS_White",
    "Smoke_120mm_AMOS_White",
    "Sh_155mm_AMOS",
    "Sh_155mm_AMOS_guided",
    "Sh_155mm_AMOS_LG",
    "Cluster_155mm_AMOS",
    "Mine_155mm_AMOS_range",
    "AT_Mine_155mm_AMOS_range"],

    [
    "82mm HE Mortar Shells",
    "82mm Guided",
    "82mm Laser Guided",
    "82mm Flare (White)",
    "82mm Smoke Shell (White)",
    "120mm Smoke (White)",
    "155mm HE Shells",
    "155mm Guided",
    "155mm Laser Guided",
    "155mm Cluster Shells",
    "155mm Mine Cluster",
    "155mm AT Mine Cluster"
    ], 0],
    1
] call CBA_fnc_addSetting;
[
    RT_SETTINGS_SUPPORT_artillery_target_radius, "EDITBOX",
    "Радиус поражения (в метрах)",
    [RT_SETTINGS_category, _subCategoryStr],
    "50",
    1
] call CBA_fnc_addSetting;
[
    RT_SETTINGS_SUPPORT_artillery_shots_count, "EDITBOX",
    "Количество запусков",
    [RT_SETTINGS_category, _subCategoryStr],
    "12",
    1
] call CBA_fnc_addSetting;
[
    RT_SETTINGS_SUPPORT_artillery_shots_delay, "EDITBOX",
    "Задержка между запусками (в секундах)",
    [RT_SETTINGS_category, _subCategoryStr],
    "0.25",
    1
] call CBA_fnc_addSetting;
[
    RT_SETTINGS_SUPPORT_artillery_safe_zone_radius, "EDITBOX",
    "Радиус safe-зоны (в метрах)",
    [RT_SETTINGS_category, _subCategoryStr],
    "0",
    1
] call CBA_fnc_addSetting;
[
    RT_SETTINGS_SUPPORT_artillery_safe_zone_radius, "EDITBOX",
    "Радиус safe-зоны",
    [RT_SETTINGS_category, _subCategoryStr],
    "0",
    1
] call CBA_fnc_addSetting;
[
    RT_SETTINGS_SUPPORT_artillery_safe_shell_spawn_altitude, "EDITBOX",
    "Высота спавна снаряда (в метрах)",
    [RT_SETTINGS_category, _subCategoryStr],
    "100",
    1
] call CBA_fnc_addSetting;
[
    RT_SETTINGS_SUPPORT_artillery_safe_shell_spawn_speed, "EDITBOX",
    "Скорость снаряда при спавне (в метрах в секунду)",
    [RT_SETTINGS_category, _subCategoryStr],
    "150",
    1
] call CBA_fnc_addSetting;

