#include "CfgPatches.hpp"
#include "CfgEventHandlers.hpp"
#include "RSC.hpp"

class CfgFunctions
{
    class RT_PauseDisplay
    {
        class PauseDisplay
        {
            file = "rt\pausedisplay\Functions\Display";
            class SetPlayerInfo {};
        };

        class AdminPanel
        {
            file = "rt\pausedisplay\Functions\adminPanel";
            class SetSoundSlider {};
            class SetSoundSliderText {};
            class SetSound {};
            class HideControlIfNoZeus {};
        };
    };
};