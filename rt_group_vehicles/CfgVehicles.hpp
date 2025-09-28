class CfgVehicles {
    class Air;
    class Helicopter: Air {
		class ACE_SelfActions { 
        	class ACE_prepareFRIES {
            	condition = "(RT_SETTINGS_VEHICLES_enable call CBA_Settings_fnc_get) && [_target] call ace_fastroping_fnc_canPrepareFRIES"; 
			};
		};
    };
	
    class Plane: Air {
		class ACE_SelfActions { 
        	class ACE_prepareFRIES {
            	condition = "(RT_SETTINGS_VEHICLES_enable call CBA_Settings_fnc_get) && [_target] call ace_fastroping_fnc_canPrepareFRIES"; 
			};
		};
    };

};
