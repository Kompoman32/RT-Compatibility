class CfgPatches
{
    class RT_Fun
    {
        name = "RT Compatibility - Fun";
        requiredAddons[] = {
            "RT_Main",
            "RT_Settings",
            "RT_Utils",
            "RT_Support",
            "A3_Sounds_F",
            "ace_common",
            "ace_goggles",
        };
        units[]={"HellDiversSound"};
        weapons[] = {};

        author = "Kompoman32";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 0;
    };
};