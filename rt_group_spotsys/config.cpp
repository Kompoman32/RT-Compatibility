#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
    
class CfgPatches
{
    class RT_Vehicles
    {
        name = "RT Compatibility - Spot System";
        requiredAddons[] = {"RT_Main", "ace_fastroping"};     
        
        units[] = {};
        weapons[] = {};

        author = "crub and Kompoman32";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 0;
    };
};