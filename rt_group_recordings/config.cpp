#include "CfgPatches.hpp"
#include "CfgEventHandlers.hpp"
#include "SteamGameRecording.hpp"

class CfgFunctions
{
    class RT_Recordings
    {
        class SpectatorRecordings
        {
            file = "rt\recordings\Functions\GameRecordings";
            class Spectator_Fall
            {
                file = "rt\recordings\Functions\GameRecordings\fn_fall.sqf";
            };
            class Spectator_Standup
            {
                file = "rt\recordings\Functions\GameRecordings\fn_standup.sqf";
            };
        };
    };
};