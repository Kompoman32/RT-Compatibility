if (!hasInterface) exitWith {};

sleep 0.2;

private _AMA_medical_assistant_Display = 180025;
private _AMA_medical_assistant_Display_Main_Group = 956;

disableSerialization;

//== No dialog, no display or is dedicated server/headless client
if (isNull (findDisplay _AMA_medical_assistant_Display) || isNull ((findDisplay _AMA_medical_assistant_Display) displayCtrl _AMA_medical_assistant_Display_Main_Group) || !hasInterface) exitWith {};

private _display = (findDisplay _AMA_medical_assistant_Display);
private _mainCtrlGroup = ((findDisplay _AMA_medical_assistant_Display) displayCtrl _AMA_medical_assistant_Display_Main_Group);

private _setPic = {
    params ["_ctrl"];
    
    // private _picture = "\A3\ui_f\data\map\markers\military\arrow2_CA.paa";
    // private _picture = "\a3\UI_F_Enoch\Data\CfgMarkers\arrowSmall1_ca.paa";
    // private _picture = "\A3\ui_f\data\map\mapcontrol\ViewTower_CA.paa"; // BEST
    
    private _picture = "\rt\medical\arrow_CA.paa";

    _ctrl ctrlSetText _picture;  
};

private _setEmpty = {
    params ["_ctrl"];
    
    _ctrl ctrlSetText "";
    _ctrl ctrlCommit 0;  
};

private _getDir = {
    params ["_unit"];

    [[player, _unit] call BIS_fnc_dirTo, getDir player] call BIS_fnc_getAngleDelta
};

private _AMA_medical_assistant_array = [];

private _xSpot = 0;
private _ySpot = 0;

for "_i" from 0 to (18-1) do
{
    private _ctrl = _mainCtrlGroup controlsGroupCtrl _i;
    
    private _ctrl_dir = _display ctrlCreate ["RscPicture", (1000 + _i), _ctrl];
    _ctrl_dir ctrlSetPosition [4.67151e-007 * safezoneW, 0.033 * safezoneH, 0.034062 * safezoneW, 0.055 * safezoneH];

    _ctrl_dir ctrlSetBackgroundColor [0,0,0,0];
    _ctrl_dir ctrlSetTextColor [1,1,1,0.5];

    [_ctrl_dir] call _setPic;
    _ctrl_dir ctrlCommit 0;
        
    _AMA_medical_assistant_array pushBack _ctrl_dir;
};

for "_o" from 0 to 1 step 0 do
{
        private _unitsList = (units group player);
        
        {
            [_x] call {
            
                params ["_ctrl_dir"];
                
                if (((isNull _ctrl_dir) && (isNull (findDisplay _AMA_medical_assistant_Display)))) exitWith {};
    
                if ((count _unitsList) - 1 < _forEachIndex) exitWith
                {
                    [_ctrl_dir] call _setEmpty;
                    _ctrl_dir ctrlCommit 0;
                };
    
                private _unit = (_unitsList # _forEachIndex);

                if (_unit == player) exitWith
                {
                    [_ctrl_dir] call _setEmpty;
                    _ctrl_dir ctrlCommit 0;
                };

                if !(_unit getVariable ["AMA_Medical_Device",true]) exitWith
                {
                    [_ctrl_dir] call _setEmpty;
                    _ctrl_dir ctrlCommit 0;
                };
                
                [_ctrl_dir] call _setPic;
                
                _ctrl_dir ctrlSetAngle [[_unit] call _getDir, 0.5, 0.5, false];
                
                _ctrl_dir ctrlCommit 0;
            
            }				
        } forEach _AMA_medical_assistant_array;
        
        if (isNull (findDisplay _AMA_medical_assistant_Display)) exitWith { _o = 2 };

        uiSleep 0.1;
};

{ ctrlDelete _x }forEach _AMA_medical_assistant_array;
