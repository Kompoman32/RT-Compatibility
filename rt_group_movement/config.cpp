#include "CfgEventHandlers.hpp"
#include "CfgMoves.hpp"
#include "CfgFunctions.hpp"
#include "CfgVehicles.hpp"

class CfgPatches
{
    class RT_Movement
    {
        name = "RT Compatibility - Movement";
        author = "Kompoman32 & Alkanet & POLPOX";
        requiredAddons[] = {"RT_Main", "RT_Medical_Assistant", "A3_Anims_F_Config_Sdr", "A3_Data_F_Sams_Loadorder", "A3_Data_F_AoW_Loadorder"};
        
        units[] = {};
        weapons[] = {};

        requiredVersion = 1.60;
        skipWhenMissingDependencies = 0;
    };
};