class CfgPatches
{
    class RT_Medical_Assistant
    {
        name = "RT Compatibility - Medical Assistant";
        requiredAddons[] = {
            "A3_Ui_F",
            "A3_Ui_F_Data",
            "RT_Main",
            "RT_Settings",
			"ace_common",
			"ace_medical"
        };
        units[] = {};

        weapons[] = {};

        author = "Asaayu & Kompoman32";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 1;
    };
};
