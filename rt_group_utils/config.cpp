#include "CfgPatches.hpp"
#include "CfgEventHandlers.hpp"

class CfgFunctions
{
    class RT_Utils
    {
        class Utils
        {
            file = "rt\utils\functions\utils";
            class timer
            {
            };
            class getAllCuratorUnits
            {
            };
            class getAllPlayersWithoutCurators
            {
            };
        };
        class Checking
        {
            file = "rt\utils\functions\checking";
            class hasAce
            {
            };
            class dontHasAce
            {
            };
            class hasDLC
            {
            };
        };
        class ScriptFlow
        {
            file = "rt\utils\functions\scriptFlow";

            class callByScriptName
            {
            };
            class addScripthandler
            {
            };
            class addEventhandler
            {
            };
            class addCBAEventhandler
            {
            };
            class addDisplayEventhandler
            {
            };
            class removeScripthandler
            {
            };
            class removeEventhandler
            {
            };
            class removeCBAEventhandler
            {
            };
            class removeDisplayEventhandler
            {
            };
            class waitUntilPlayerInit
            {
            };
            class waitUntilTime
            {
            };
        };
    };
};