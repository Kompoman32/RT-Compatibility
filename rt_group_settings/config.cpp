#include "CfgEventHandlers.hpp"

class CfgPatches
{
    class RT_Settings
    {
        name = "RT Compatibility - Settings";
        requiredAddons[] = {"a3_data_f_mod_loadorder", "cba_settings"};
        
        units[] = {};
        weapons[] = {};

        author = "Kompoman32";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 0;
    };
};