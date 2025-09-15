private _subCategoryStr = "Medical Assistant";

[
	[RT_KEYBINDS_category, _subCategoryStr],
	"show_menu_key",
	"Открыть Medical Assistant", 
	"",
	{
		if !(isNull (findDisplay RT_MEDICAL_ASSSISTANT_VAR_DISPLAY_IDC)) exitWith {};

		(findDisplay 46) createDisplay "AMA_menu";
	}, 
	[DIK_NUMPAD5, [true, false, false]],
	false,
	0
] call CBA_fnc_addKeybind;