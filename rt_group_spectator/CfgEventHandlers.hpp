
class Extended_PreStart_EventHandlers {
    class RT_Spectator {
        init = "call compileScript ['rt\spectator\functions\preStart.sqf']";
    };
};

class Extended_PreInit_EventHandlers {
    class RT_Spectator {
        init = "call compileScript ['rt\spectator\functions\preInit.sqf']";
    };
};

class Extended_PostInit_EventHandlers {
    class RT_Spectator {
        init = "call compileScript ['rt\spectator\functions\postInit.sqf']";
    };
    class RT_Spectator_CheckUnits {
        init = "call compileScript ['rt\spectator\functions\init\fn_checkSpectatorUnits.sqf']";
    };
    class RT_Spectator_KeyHandler {
        init = "call compileScript ['rt\spectator\functions\init\fn_keyHandler.sqf']";
    };
};
