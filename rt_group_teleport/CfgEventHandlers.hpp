
class Extended_PreStart_EventHandlers {
    class RT_Teleport {
        init = "call compileScript ['rt\teleport\functions\preStart.sqf']";
    };
};

class Extended_PreInit_EventHandlers {
    class RT_Teleport {
        init = "call compileScript ['rt\teleport\functions\preInit.sqf']";
    };
};

class Extended_PostInit_EventHandlers {
    class RT_Teleport {
        init = "call compileScript ['rt\teleport\functions\postInit.sqf']";
    };
};
