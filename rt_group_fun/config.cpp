#include "CfgFunctions.hpp"
#include "CfgVehicles.hpp"
#include "CfgSounds.hpp"
#include "CfgGlasses.hpp"
#include "CfgEventHandlers.hpp"
#include "RscAttributes.hpp"

class CfgPatches
{
    class RT_Fun
    {
        name = "RT Compatibility - Fun";
        requiredAddons[] = {
            "RT_Main",
            "RT_Support",
            "A3_Ui_F",
            "A3_3DEN",
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