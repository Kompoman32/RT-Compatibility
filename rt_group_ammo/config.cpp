#include "CfgFunctions.hpp"
#include "CfgVehicles.hpp"
#include "CfgAmmo.hpp"
#include "ACE_Medical_Injuries.hpp"
#include "CfgEventHandlers.hpp"

class CfgPatches
{
    class RT_Ammo {
        name = "RT Compatibility - Ammo";
        requiredAddons[] = {"ace_advanced_throwing", "A3_Weapons_F","A3_Weapons_F_Exp","ace_ballistics", "ace_medical_damage", "ace_frag"};        
        
        units[] = {};
        weapons[] = {};

        author = "Kompoman32";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 0;
    };
};