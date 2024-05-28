
class Extended_PreStart_EventHandlers {
    class RT_Pause {
        init = "call compileScript ['rt\pause\functions\preStart.sqf']";
    };
};

class Extended_PreInit_EventHandlers {
    class RT_Pause {
        init = "call compileScript ['rt\pause\functions\preInit.sqf']";
    };
};

class Extended_PostInit_EventHandlers {
    class RT_Pause {
        init = "call compileScript ['rt\pause\functions\postInit.sqf']";
    };
};
