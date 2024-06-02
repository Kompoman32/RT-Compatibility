class CfgPatches
{
	class RT_GROUP_CFG_PATCHES;

    class RT_Movement: RT_GROUP_CFG_PATCHES
    {
        name = "RT Compatibility - Movement";
        author = "Kompoman32 and others";
        authors[] = {"Kompoman32", "Alkanet", "POLPOX"};
        requiredAddons[] = {"RT_Main", "RT_Utils", "A3_Anims_F_Config_Sdr", "A3_Data_F_Sams_Loadorder", "A3_Data_F_AoW_Loadorder"};
    };
};