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

        author = "WebKnight && Rei && Kompoman32";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 0;
    };
};