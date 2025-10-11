// (local uiNamespace) контрол текста для иммерсивного худа
RT_INTERFACE_VAR_IMMERISVE_TEXT_CONTROL = "VARS_RT_INTERFACE_VAR_IMMERISVE_TEXT_CONTROL";
// (local uiNamespace) Handler для иммерсивного худа
RT_INTERFACE_VAR_IMMERISVE_HANDLER = "VARS_RT_INTERFACE_VAR_IMMERISVE_HANDLER";







RSS_IHUD_UI_GROUND = 1;
RSS_IHUD_UI_VEHICLE = 2;

IDD_UNITINFO = 300;
IDD_MISSION = 46;
IDD_STAMINA_BAR = 305;
IDD_STANCEINFO = 303;

IDC_IGUI_WEAPON = 118;
IDC_IGUI_WEAPON_MODE_TEXTURE = 187;
IDC_IGUI_WEAPON_AMMO = 155;
IDC_IGUI_AMMOCOUNT = 184;
IDC_IGUI_MAGCOUNT = 185;
IDC_IGUI_WEAPON_ELEVATION = 168;
IDC_IGUI_WEAPON_ELEVATION_TEXT = 169;
IDC_IGUI_STAMINA_BAR = 193;
IDC_IGUI_STANCE_INDICATOR = 188;
IDC_IGUI_VEHICLE = 120;
IDC_IGUI_VALUE_FUEL = 113;
IDC_IGUI_SPEED = 121;
IDC_IGUI_ALT = 122;
IDC_IGUI_HITZONES = 111;

RSS_IHUD_font = "PuristaMedium";
RSS_IHUD_fontB = "PuristaSemibold";

RSS_IHUD_magFull = localize "STR_RSSHUD_Full";
RSS_IHUD_magNearlyFull = localize "STR_RSSHUD_NearlyFull";
RSS_IHUD_magMoreThanHalf = localize "STR_RSSHUD_MoreThanHalf";
RSS_IHUD_magAboutHalf = localize "STR_RSSHUD_AboutHalf";
RSS_IHUD_magLessThanHalf = localize "STR_RSSHUD_LessThanHalf";
RSS_IHUD_magNearlyEmpty = localize "STR_RSSHUD_NearlyEmpty";
RSS_IHUD_magEmpty = localize "STR_RSSHUD_MagEmpty";
RSS_IHUD_noMag = localize "STR_RSSHUD_NoMag";

RSS_IHUD_singleEmpty = localize "STR_RSSHUD_SingleEmpty";
RSS_IHUD_singleLoaded = localize "STR_RSSHUD_SingleLoaded";

RSS_IHUD_zeroingLabel = localize "STR_RSSHUD_Zeroing";
RSS_IHUD_firemodeLabel = localize "STR_RSSHUD_Firemode";
RSS_IHUD_safe = localize "STR_RSSHUD_Safe";
RSS_IHUD_magSeparator = "|";
RSS_IHUD_noSpare = localize "STR_RSSHUD_NoSpare";
RSS_IHUD_grenadesLabel = localize "STR_RSSHUD_Grenades";
RSS_IHUD_magazinesLabel = localize "STR_RSSHUD_Magazines";
RSS_IHUD_noneLabel = localize "STR_RSSHUD_None";

RSS_IHUD_zeroingDisplayDuration = 1.0;
RSS_IHUD_lastZeroing = -1;
RSS_IHUD_zeroingShowTime = 0;

RSS_IHUD_hasAceSafemode = isClass (configFile >> "CfgPatches" >> "ace_safemode");
RSS_IHUD_hasAceMedicalGui = isClass (configFile >> "CfgPatches" >> "ace_medical_gui");
RSS_IHUD_medicalPeekVisible = false;

RSS_IHUD_selectiveUIElements = [
	["ace_ui_weaponName", IDD_UNITINFO, [IDC_IGUI_WEAPON], RSS_IHUD_UI_GROUND],
	["ace_ui_weaponNameBackground", IDD_UNITINFO, [1001, 1008], RSS_IHUD_UI_GROUND],
	["ace_ui_firingMode", IDD_UNITINFO, [IDC_IGUI_WEAPON_MODE_TEXTURE, 1203], RSS_IHUD_UI_GROUND],
	["ace_ui_ammoType", IDD_UNITINFO, [IDC_IGUI_WEAPON_AMMO], RSS_IHUD_UI_GROUND],
	["ace_ui_ammoCount", IDD_UNITINFO, [IDC_IGUI_AMMOCOUNT], RSS_IHUD_UI_GROUND],
	["ace_ui_magCount", IDD_UNITINFO, [IDC_IGUI_MAGCOUNT], RSS_IHUD_UI_GROUND],
	["ace_ui_throwableName", IDD_UNITINFO, [152], RSS_IHUD_UI_GROUND],
	["ace_ui_throwableCount", IDD_UNITINFO, [151], RSS_IHUD_UI_GROUND],
	["ace_ui_zeroing", IDD_UNITINFO, [IDC_IGUI_WEAPON_ELEVATION], RSS_IHUD_UI_GROUND],
	["ace_ui_weaponLowerInfoBackground", IDD_UNITINFO, [1202], RSS_IHUD_UI_GROUND],
	// ["ace_ui_staminaBar", IDD_STAMINA_BAR, [IDC_IGUI_STAMINA_BAR], RSS_IHUD_UI_GROUND],
	["ace_ui_stance", IDD_STANCEINFO, [IDC_IGUI_STANCE_INDICATOR, 1201], RSS_IHUD_UI_GROUND],
	["ace_ui_enableSpeedIndicator", IDD_STANCEINFO, ["ace_ui_speedIndicator"], RSS_IHUD_UI_GROUND],
	
	["ace_ui_gunnerWeaponName", IDD_UNITINFO, [IDC_IGUI_WEAPON], RSS_IHUD_UI_VEHICLE],
	["ace_ui_gunnerWeaponNameBackground", IDD_UNITINFO, [1001, 1008], RSS_IHUD_UI_VEHICLE],
	["ace_ui_gunnerFiringMode", IDD_UNITINFO, [IDC_IGUI_WEAPON_MODE_TEXTURE, 1203], RSS_IHUD_UI_VEHICLE],
	["ace_ui_gunnerAmmoType", IDD_UNITINFO, [IDC_IGUI_WEAPON_AMMO], RSS_IHUD_UI_VEHICLE],
	["ace_ui_gunnerAmmoCount", IDD_UNITINFO, [IDC_IGUI_AMMOCOUNT], RSS_IHUD_UI_VEHICLE],
	["ace_ui_gunnerMagCount", IDD_UNITINFO, [IDC_IGUI_MAGCOUNT], RSS_IHUD_UI_VEHICLE],
	["ace_ui_gunnerLaunchableName", IDD_UNITINFO, [152], RSS_IHUD_UI_VEHICLE],
	["ace_ui_gunnerLaunchableCount", IDD_UNITINFO, [151], RSS_IHUD_UI_VEHICLE],
	["ace_ui_gunnerZeroing", IDD_UNITINFO, [IDC_IGUI_WEAPON_ELEVATION], RSS_IHUD_UI_VEHICLE],
	["ace_ui_gunnerWeaponLowerInfoBackground", IDD_UNITINFO, [1202], RSS_IHUD_UI_VEHICLE],
	["ace_ui_vehicleName", IDD_UNITINFO, [IDC_IGUI_VEHICLE], RSS_IHUD_UI_VEHICLE],
	["ace_ui_vehicleNameBackground", IDD_UNITINFO, [1000, 1013], RSS_IHUD_UI_VEHICLE],
	["ace_ui_vehicleFuelBar", IDD_UNITINFO, [IDC_IGUI_VALUE_FUEL, 1202], RSS_IHUD_UI_VEHICLE],
	["ace_ui_vehicleSpeed", IDD_UNITINFO, [IDC_IGUI_SPEED, 1004, 1006], RSS_IHUD_UI_VEHICLE],
	["ace_ui_vehicleAltitude", IDD_UNITINFO, [IDC_IGUI_ALT, 1005, 1014], RSS_IHUD_UI_VEHICLE],
	["ace_ui_vehicleDamage", IDD_UNITINFO, [IDC_IGUI_HITZONES], RSS_IHUD_UI_VEHICLE],
	["ace_ui_vehicleInfoBackground", IDD_UNITINFO, [1200], RSS_IHUD_UI_VEHICLE]
];