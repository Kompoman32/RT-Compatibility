#include "CfgFunctions.hpp"
#include "CfgEventHandlers.hpp"
#include "RscTitles.hpp"

class CfgPatches
{
    class RT_Spectator
    {
        name = "RT Compatibility - Spectator";
        requiredAddons[] = {"RT_Main", "ace_spectator", "ace_medical"};
        
        units[] = {};
        weapons[] = {};

        author = "Kompoman32";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 0;
    };
};