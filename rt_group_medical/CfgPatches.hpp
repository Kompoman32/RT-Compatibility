class CfgPatches
{
    class RT_Medical
    {
        name = "RT Compatibility - Medical";
        requiredAddons[] = {
            "A3_Ui_F_Data",
            "RT_Main",
            "RT_Settings",
			"ace_common",
			"ace_medical",
            "ace_medical_treatment",
            "ASAAYU_ACE_MEDICAL_ASSISTANT"
        };
        units[] = {};

        weapons[] = {};

        author = "Asaayu & Kompoman32";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 0;
    };
};
