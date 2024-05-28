#include "CfgPatches.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
#include "CfgGlasses.hpp"

class CfgFunctions
{
    class RT_Fun
    {
        class Init
        {
            file = "rt\fun\functions\init";
            class postinit
            {
                postInit = 1;
            };
            class vars
            {
                preinit = 1;
            };
        };
    };
};
