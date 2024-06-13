class CfgPatches
{
    class RT_Spectator
    {
        name = "RT Compatibility - Spectator";
        requiredAddons[] = {"RT_Main", "RT_Utils", "ace_spectator", "ace_medical"};
        
        units[] = {};
        weapons[] = {};

        author = "Kompoman32";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 0;
    };
};