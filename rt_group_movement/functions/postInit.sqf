if !(RT_SETTINGS_INITIALIZATION_movement call CBA_settings_fnc_get) exitwith {};

[missionNamespace, RT_MOVEMENT_VARS_MEDASSIST_SCRIPT] call RT_Utils_fnc_remooveScriptHandler;
[missionNamespace, RT_MOVEMENT_VARS_MEDASSIST_SCRIPT, [], 
{
    while {true} do {
        waitUntil {uiSleep 0.1; !(isNull (findDisplay RT_MEDICAL_ASSSISTANT_VAR_DISPLAY_IDC))};
        _unit = missionNamespace getVariable["bis_fnc_moduleRemoteControl_unit", player];
        _reloadAnim = getText (configfile >> "CfgWeapons" >> currentWeapon _unit >> "reloadAction");
        if (!(isNull objectParent _unit) or !(alive _unit) or (gestureState _unit == _reloadAnim) or (stance _unit == "PRONE") or (lifeState _unit == "INCAPACITATED")) then {
            uiSleep 3;
        }else{
            _attachPos = [0,0.0,-0.05];
            
            _y =-100;          
            _p = 122;          
            _r  = 10;
            _rotation = [
                [sin _y * cos _p, cos _y * cos _p, sin _p],
                [[sin _r, -sin _p, cos _r * cos _p], -_y] call BIS_fnc_rotateVector2D
            ];

            _obj = "Land_Tablet_02_F" createVehicle [0,0,0];
            _obj setObjectTextureGlobal [0, "rt\movement\images\tablet_ca.paa"];

            if (currentWeapon _unit == primaryWeapon _unit && currentWeapon _unit != "" && weaponLowered _unit) then {
                _unit playActionNow "WBK_map_start";

                _obj attachTo [_unit,_attachPos,"leftHand",true]; 
                _obj setVectorDirAndUp _rotation;

                _unit spawn {
                    uiSleep 0.5;
                    if (gestureState _this != "WBK_map_start") exitWith {};
                    uiSleep 0.5;
                    if (gestureState _this != "WBK_map_start") exitWith {};
                    uiSleep 0.4;
                    if (gestureState _this != "WBK_map_start") exitWith {};

                    _this playActionNow "WBK_map_loop";
                };
            
                waitUntil {(isNull (findDisplay RT_MEDICAL_ASSSISTANT_VAR_DISPLAY_IDC))};
                if (gestureState _unit == "WBK_map_loop" || gestureState _unit == "WBK_map_start") then {
                    _unit playActionNow "WBK_map_end";
                    uiSleep 0.4;
                };
                deleteVehicle _obj;
            }else{
                _unit playActionNow "WBK_map_start_NOTMAINWEAP";
                _obj = "Land_Tablet_02_F" createVehicle [0,0,0];

                _obj attachTo [_unit, _attachPos,"leftHand",true]; 
                _obj setVectorDirAndUp _rotation;

                _unit spawn {
                    uiSleep 0.5;
                    if (gestureState _this != "WBK_map_start_NOTMAINWEAP") exitWith {};
                    uiSleep 0.5;
                    if (gestureState _this != "WBK_map_start_NOTMAINWEAP") exitWith {};
                    uiSleep 0.4;
                    if (gestureState _this != "WBK_map_start_NOTMAINWEAP") exitWith {};

                    _this playActionNow "WBK_map_loop_NOTMAINWEAP";
                };

                waitUntil {(isNull (findDisplay RT_MEDICAL_ASSSISTANT_VAR_DISPLAY_IDC))};

                if (gestureState _unit == "WBK_map_loop_NOTMAINWEAP" || gestureState _unit == "WBK_map_start_NOTMAINWEAP") then {
                    _unit playActionNow "WBK_map_end_NOTMAINWEAP";
                    uiSleep 0.4;
                };
                deleteVehicle _obj;
            };
        };
        
        uiSleep 0.1;
    };
}

] call RT_Utils_fnc_addScriptHandler;