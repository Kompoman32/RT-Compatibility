#include "CfgPatches.hpp"

class CfgFunctions
{
    class RT_Items
    {
        class Items
        {
            file = "rt\items\Functions\Items";
            class CreateResupply
            {
            };
        };

        class Init
        {
            file = "rt\items\Functions\Init";
            class vars
            {
                preInit = 1;
            };
            class postinit
            {
                postInit = 1;
            };
        }
    };
};