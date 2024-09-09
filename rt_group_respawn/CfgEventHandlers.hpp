
class Extended_PreStart_EventHandlers {
    class RT_Respawn {
        init = "call compileScript ['rt\respawn\functions\preStart.sqf']";
    };
};

class Extended_PreInit_EventHandlers {
    class RT_Respawn {
        init = "call compileScript ['rt\respawn\functions\preInit.sqf']";
    };
};

class Extended_PostInit_EventHandlers {
    class RT_Respawn {
        init = "call compileScript ['rt\respawn\functions\postInit.sqf']";
    };
};
