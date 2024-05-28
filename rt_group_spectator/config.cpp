#include "CfgPatches.hpp"

class CfgFunctions
{
    class RT_Spectator
    {
        class Spectator
        {
            file = "rt\spectator\Functions\Spectator";
            class addSpectator
            {
            };
            class removeSpectator
            {
            };
        };

        class Init
        {
            file = "rt\spectator\Functions\Init";
            class vars
            {
                preInit = 1;
            };
            class postinit
            {
                postInit = 1;
            };
            class checkSpectatorUnits
            {
                postInit = 1;
            };
            class keyHandler
            {
                postInit = 1;
            };
        };
    };
};