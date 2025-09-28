#include "CfgFunctions.hpp"
#include "CfgEventHandlers.hpp"

class CfgPatches
{
    class RT_Utils {
        name = "RT Compatibility - Utils";
        requiredAddons[] = {"a3_data_f_mod_loadorder"};        
        
        units[] = {};
        weapons[] = {};

        author = "Kompoman32";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 0;
    };
};