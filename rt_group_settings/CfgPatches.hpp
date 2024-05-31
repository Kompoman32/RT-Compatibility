class CfgPatches
{
	class RT_GROUP_CFG_PATCHES;

    class RT_Settings: RT_GROUP_CFG_PATCHES
    {
        name = "RT Compatibility - Settings";
        requiredAddons[] = {"RT_Main", "cba_settings"};
    };
};