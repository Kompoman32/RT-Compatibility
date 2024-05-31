class CfgPatches
{
	class RT_GROUP_CFG_PATCHES;
    class RT_Spectator: RT_GROUP_CFG_PATCHES
    {
        name = "RT Compatibility - Spectator";
        requiredAddons[] = {"RT_Main", "RT_Utils", "ace_spectator", "ace_medical"};
    };
};