private _subCategoryStr = "INTERFACE";

RT_SETTINGS_INTERFACE_enable_immersive = "SETTINGS_RT_SETTINGS_INTERFACE_enable_immersive";

[
    RT_SETTINGS_INTERFACE_enable_immersive, "CHECKBOX",
    ["Включить иммерсивный интерфейс", "Включить интерфейс отображения инфы об оружии на самом оружии и инфы о гранатах, если посмотретьв вниз"],
    [RT_SETTINGS_category, _subCategoryStr],
    false,
    0,
	{
		[] spawn RT_Interface_fnc_wbkimmersive;
	}
] call CBA_fnc_addSetting;
