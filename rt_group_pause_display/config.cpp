#include "CfgFunctions.hpp"
#include "CfgEventHandlers.hpp"
#include "RSC.hpp"

class CfgPatches
{
    class RT_PauseMenu
    {
        name = "RT Compatibility - Pause Menu";
        requiredAddons[] = {"RT_Main", "A3_Ui_F"};
        
        units[] = {};
        weapons[] = {};

        author = "Kompoman32";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 0;
    };
};