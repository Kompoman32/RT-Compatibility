class CfgPatches
{
    class RT_Animations
    {
        name = "RT Compatibility - Dancing";
        requiredAddons[] = {
            "RT_Main", 
            "RT_Utils", 
            "RT_Settings", 
            "cba_common",
			"A3_Anims_F",
            "A3_Anims_F_Config_Sdr",
            "A3_Data_F_Enoch_Loadorder",
            "ace_common",
            "ace_gestures",
            "ace_interaction"
        };
        
        units[] = {};
        weapons[] = {};

        author = "Kompoman32 && WebKnight && TheSpeshalPlatoon team";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 0;
    };
};