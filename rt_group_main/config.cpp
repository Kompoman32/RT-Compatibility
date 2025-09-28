#include "CfgPatches.hpp"

class CfgPatches
{
    class RT_Main {
        name = "RT Compatibility - Main";
        author = "Kompoman32";

        requiredAddons[] = {"a3_data_f_mod_loadorder", "RT_Settings", "RT_Utils"};
        requiredVersion = 1.60;
        
        units[] = {};
        weapons[] = {};
        
        skipWhenMissingDependencies = 0;
    };
};