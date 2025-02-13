
class Extended_PreStart_EventHandlers {
    class RT_PauseDisplay {
        init = "call compileScript ['rt\pausedisplay\functions\preStart.sqf']";
    };
};

class Extended_PreInit_EventHandlers {
    class RT_PauseDisplay {
        init = "call compileScript ['rt\pausedisplay\functions\preInit.sqf']";
    };
};

class Extended_PostInit_EventHandlers {
    class RT_PauseDisplay {
        init = "call compileScript ['rt\pausedisplay\functions\postInit.sqf']";
    };
};
