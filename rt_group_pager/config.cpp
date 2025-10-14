#include "CfgFunctions.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgSounds.hpp"
#include "Dialogs.hpp"

class CfgPatches
{
    class RT_Pager
    {
        name = "RT Compatibility - Pager";
        requiredAddons[] = {
            "RT_Main",
            "A3_Ui_F",
            "A3_Ui_F_Data",
            "ace_common",
            "ace_interact_menu"
        };

        units[] = {"RT_Pager_Item"};
        weapons[] = {"RT_Pager"};

        author = "Kompoman32";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 1;
    };
};
