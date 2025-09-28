#include "CfgFunctions.hpp"
#include "CfgEventHandlers.hpp"


class CfgPatches
{
    class RT_Pause
    {
        name = "RT Compatibility - Items";
        requiredAddons[] = {"RT_Main"};
        
        units[] = {};
        weapons[] = {};

        author = "Kompoman32";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 0;
    };
};