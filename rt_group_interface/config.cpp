#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"

class CfgPatches
{
    class RT_Interface
    {
        name = "RT Compatibility - Interface";
        requiredAddons[] = {"RT_Main"};
        
        units[] = {};
        weapons[] = {};

        author = "Kompoman32 && WebKnight";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 0;
    };
};