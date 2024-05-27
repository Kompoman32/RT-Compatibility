class CfgMods
{
    author = "Kompoman32";
};

class CfgPatches
{
    class RT_Spectator
    {
        // Meta information for editor
        name = "RT Compatibility - Spectator";
        author = "Kompoman32";

        // Minimum compatible version. When the game's version is lower, pop-up warning will appear when launching the game. Note: was disabled on purpose some time late into Arma 2: OA.
        requiredVersion = 1.60;
        // Required addons, used for setting load order. (CfgPatches classname NOT PBO filename!)
        // When any of the addons are missing, a pop-up warning will appear when launching the game.
        requiredAddons[] = {"RT_Utils"};
        // List of objects (CfgVehicles classes) contained in the addon. Important also for Zeus content (units and groups) unlocking.
        units[] = {};
        // List of weapons (CfgWeapons classes) contained in the addon.
        weapons[] = {};

        // Optional. If this is 1, if any of requiredAddons[] entry is missing in your game the entire config will be ignored and return no error (but in rpt) so useful to make a compat Mod (Since Arma 3 2.14)
        skipWhenMissingDependencies = 0;
    };
};

class CfgFunctions
{
    class RT_Spectator
    {
        class Spectator
        {
            file = "rt\spectator\Functions\Spectator";
            class addSpectator
            {
            };
            class removeSpectator
            {
            };
        };

        class Init
        {
            file = "rt\spectator\Functions\Init";
            class vars
            {
                preInit = 1;
            };
            class postinit
            {
                postInit = 1;
            };
            class checkSpectatorUnits
            {
                postInit = 1;
            };
            class keyHandler
            {
                postInit = 1;
            };
        };
    };
};