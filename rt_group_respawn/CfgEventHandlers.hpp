
class Extended_PreStart_EventHandlers {
    class RT_Settings {
        init = "call compileScript ['rt\settings\functions\preStart.sqf']";
    };
};

class Extended_PreInit_EventHandlers {
    class RT_Settings {
        init = "call compileScript ['rt\settings\functions\preInit.sqf']";
    };
};

class Extended_PostInit_EventHandlers {
    class RT_Settings {
        init = "call compileScript ['rt\settings\functions\postInit.sqf']";
    };
};
