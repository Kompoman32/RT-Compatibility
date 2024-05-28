#include "CfgPatches.hpp"

class CfgFunctions
{
    class RT_Pause
    {
        class Pause
        {
            file = "rt\pause\Functions\Pause";
            class StopStart
            {
            };
            class ShowHint
            {
            };
        };

        class Init
        {
            file = "rt\pause\Functions\Init";
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