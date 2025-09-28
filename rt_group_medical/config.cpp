#include "CfgFunctions.hpp"
#include "CfgEventHandlers.hpp"
#include "AceMedical.hpp"

class CfgPatches
{
    class RT_Medical
    {
        name = "RT Compatibility - Medical";
        requiredAddons[] = {
            "RT_Main",
            "A3_Characters_F",
            "A3_Ui_F",
            "A3_Ui_F_Data",
            "ace_common",
            "ace_medical",
            "ace_medical_treatment"
        };
        units[] = {};

        weapons[] = {};

        author = "Kompoman32";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 0;
    };
};

class CfgMovesFatigue {
    staminaCooldown = 0.1;
};