class CfgPatches
{
    class RT_Medical
    {
        name = "RT Compatibility - Medical";
        requiredAddons[] = {
            "A3_Characters_F",
            "A3_Ui_F",
            "A3_Ui_F_Data",
            "RT_Main",
            "RT_Settings",
			"ace_common",
			"ace_medical",
            "ace_medical_treatment"
        };
        units[] = {};

        weapons[] = {};

        author = "Kompoman32";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 0;
    };
};
