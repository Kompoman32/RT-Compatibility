#include "CfgPatches.hpp"

class CfgFunctions
{
    class RT_Support
    {
        class Support
        {
            file = "rt\support\Functions\Support";
            class expressArtillery
            {
            };
        };

        class Init
        {
            file = "rt\support\Functions\Init";
            class vars
            {
                preInit = 1;
            };
            class postinit
            {
                postInit = 1;
            };
        };
    };
};