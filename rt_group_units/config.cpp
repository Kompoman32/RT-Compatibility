#include "CfgFunctions.hpp"
#include "CfgVehicles.hpp"
#include "CfgSurfaces.hpp"
#include "CfgEventHandlers.hpp"

class CfgPatches
{
    class RT_Units
    {
        name = "RT Compatibility - Units";
        requiredAddons[] = {"RT_Main", "ace_medical_treatment", "ace_medical_gui"};
        
        units[] = {};
        weapons[] = {};

        author = "Kompoman32";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 0;
    };
};


