class CfgPatches
{
    class RT_Movement
    {
        name = "RT Compatibility - Movement";
        author = "Kompoman32 and others";
        // authors[] = {"Kompoman32", "Alkanet", "POLPOX"};
        requiredAddons[] = {"RT_Main", "RT_Utils", "RT_Medical_Assistant", "A3_Anims_F_Config_Sdr", "A3_Data_F_Sams_Loadorder", "A3_Data_F_AoW_Loadorder"};
        
        units[] = {};
        weapons[] = {};

        requiredVersion = 1.60;
        skipWhenMissingDependencies = 0;
    };
};