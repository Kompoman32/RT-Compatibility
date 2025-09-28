#include "CfgFunctions.hpp"
#include "CfgEventHandlers.hpp"

class CfgPatches
{
    class RT_Support
    {
        name = "RT Compatibility - Support";
        requiredAddons[] = {"RT_Main", "cba_events"};
        
        units[] = {};
        weapons[] = {};

        author = "Kompoman32";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 0;
    };
};