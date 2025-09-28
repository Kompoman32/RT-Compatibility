#include "CfgFunctions.hpp"
#include "CfgVehicles.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgSounds.hpp"
#include "Menu.hpp"

class CfgPatches
{
    class RT_Medical_Assistant
    {
        name = "RT Compatibility - Medical Assistant";
        requiredAddons[] = {
            "RT_Main",
            "A3_Ui_F",
            "A3_Ui_F_Data",
            "ace_common",
            "ace_medical"
        };
        units[] = {};

        weapons[] = {};

        author = "Asaayu & Kompoman32";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 1;
    };
};
