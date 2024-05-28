class CfgMods
{
    author = "Kompoman32";
};

class CfgPatches
{
    class RT_Fun
    {
        // Meta information for editor
        name = "RT Compatibility - Fun";
        author = "Kompoman32";

        // Minimum compatible version. When the game's version is lower, pop-up warning will appear when launching the game. Note: was disabled on purpose some time late into Arma 2: OA.
        requiredVersion = 1.60;
        // Required addons, used for setting load order. (CfgPatches classname NOT PBO filename!)
        // When any of the addons are missing, a pop-up warning will appear when launching the game.
        requiredAddons[] = {
            "RT_Utils",
            "RT_Support",
            "A3_Sounds_F",
            "A3_Sounds_F_Decade",
            "ace_common",
            "ace_goggles",
        };
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
    class RT_Fun
    {
        class Init
        {
            file = "rt\fun\functions\init";
            class postinit
            {
                postInit = 1;
            };
            class vars
            {
                preinit = 1;
            };
        };
    };
};

class CfgSounds
{
    class RTBoom
    {
        sound[] = {"\rt\fun\sounds\boom.ogg", 1, 1, 3};
        titles[] = {};
    };
};

class CfgSFX
{
    class HellDivers
    {
        sounds[] = {"sound0"};
        sound0[] = {"rt\fun\sounds\helldivers.ogg", 1, 1, 500, 1, 0, 0, 0};
        empty[] = {"", 1, 1, 2000, 1, 0, 0, 0};
    };
};

class CfgVehicles
{
    class All;
    class Sound;
    class HellDiversSound : Sound // class name to be used with createSoundSource
    {
        author = "Arrowhead Game Studios";
        sound = "HellDivers"; // reference to CfgSFX class
    };
};

class CfgGlasses
{
    class G_Combat;
    class None;

    class G_Goggles_VR : None
    {
        // displayname = "RT Goggles";
        // author = "Kompoman32 from RT Group";

        ACE_Color[] = {0, 0, 0};
        ACE_TintAmount = 8.0;

        ACE_Overlay = "";
        ACE_OverlayCracked = "rt\fun\textures\valmar.paa";
        ACE_Resistance = 1;
        ACE_Protection = 0;
    };
};
