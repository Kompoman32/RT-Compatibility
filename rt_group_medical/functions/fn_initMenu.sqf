/*
===================================
  File: fn_initMenu.sqf
  Author: Asaayu
  Description: Setup all the stuff required for the menu
===================================
*/
disableSerialization;

//== No dialog, no display or is dedicated server/headless client
if (isNull (findDisplay 180025) || !hasInterface) exitWith {};


private _AMA_search_control =
{
        _this params ["_ctrl_name","_ctrl_info","_ctrl_pulse", "_ctrl_dir", "_ctrl_blood_rate"];
        {
                _x ctrlSetTextColor [1,1,1,1];
        } forEach [_ctrl_name,_ctrl_info,_ctrl_pulse];
        _ctrl_name ctrlSetText "";
        _ctrl_name ctrlSetTooltip "";
        private _picture = format["a3\ui_f\data\igui\rsctitles\rschvtphase\jac_a3_signal_%1_ca.paa",(floor _counter min 4)];
        if ((getResolution#5) >= 0.85) then
        {
                _ctrl_info ctrlSetStructuredText parseText format["<t align='center' font='PuristaMedium'><img image='%1'/><br/><t size='0.64'>SEARCHING...</t></t>",_picture];
        }
        else
        {
                _ctrl_info ctrlSetStructuredText parseText format["<t align='center' font='PuristaMedium'><img image='%1'/><br/><t size='0.64'>SEARCHING FOR A CONNECTION...</t></t>",_picture];
        };
        _ctrl_info ctrlSetTooltip "";
        _ctrl_pulse ctrlSetBackgroundColor [0,0,0,0];
        _ctrl_pulse ctrlSetTooltip "";

        _ctrl_dir ctrlSetText "";
        
        _ctrl_blood_rate ctrlSetTextColor [1,1,1,0];
        _ctrl_blood_rate ctrlSetTooltip "";
};

private _AMA_medical_assistant_array = [];
private _pulseCooldowns = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
private _xSpot = 0;
private _ySpot = 0;
private _display = (findDisplay 180025);
private _mainCtrlGroup = ((findDisplay 180025) displayCtrl 956);


for "_i" from 0 to (18-1) do
{
        private _ctrl = _display ctrlCreate ["RscControlsGroupNoScrollbars", _i, _mainCtrlGroup];
        switch _xSpot do
        {
                case 0:
                {
                _ctrl ctrlSetPosition [2.26276e-007 * safezoneW, (0.132 * _ySpot) * safezoneH,0.134062 * safezoneW,0.134063 * safezoneH];
                _xSpot = 1;
                };
                case 1:
                {
                _ctrl ctrlSetPosition [0.134063 * safezoneW, (0.132 * _ySpot) * safezoneH,0.134062 * safezoneW,0.134063 * safezoneH];
                _xSpot = 2;
                };
                case 2:
                {
                _ctrl ctrlSetPosition [0.2677 * safezoneW, (0.132 * _ySpot) * safezoneH,0.134062 * safezoneW,0.134063 * safezoneH];
                _ySpot = _ySpot + 1;
                _xSpot = 0;
                };
        };
        _ctrl ctrlCommit 0;

        private _ctrl_name = _display ctrlCreate ["RscTextCenter", (100 + _i), _ctrl];
        _ctrl_name ctrlSetPosition [-2.45869e-008 * safezoneW, -3.27826e-008 * safezoneH,0.134062 * safezoneW,0.033 * safezoneH];
        _ctrl_name ctrlSetFont "PuristaBold";

        private _ctrl_info = _display ctrlCreate ["RscStructuredText", (100 + _i), _ctrl];
        _ctrl_info ctrlSetPosition [4.67151e-007 * safezoneW, 0.033 * safezoneH,0.134062 * safezoneW,0.055 * safezoneH];

        private _ctrl_pulse = _display ctrlCreate ["RscText", (100 + _i), _ctrl];
        _ctrl_pulse ctrlSetPosition [-1.25393e-006 * safezoneW, 0.088 * safezoneH,0.134062 * safezoneW,0.044 * safezoneH];
        _ctrl_pulse ctrlSetBackgroundColor [0,0,0,0.75];


        private _ctrl_dir = _display ctrlCreate ["RscPicture", (1000 + _i), _ctrl];
        _ctrl_dir ctrlSetPosition [4.67151e-007 * safezoneW, 0.033 * safezoneH, 0.034062 * safezoneW, 0.055 * safezoneH];
        _ctrl_dir ctrlSetBackgroundColor [0,0,0,0];
        _ctrl_dir ctrlSetTextColor [1,1,1,0.5];
        _ctrl_dir ctrlSetText "\rt\medical\images\arrow_CA.paa";

        private _ctrl_blood_rate = _display ctrlCreate ["RscPicture", (1100 + _i), _ctrl];
        _ctrl_blood_rate ctrlSetPosition [0.1 * safezoneW - 1.67151e-007 * safezoneW, 0.033 * safezoneH, 0.017031 * safezoneW, 0.0275 * safezoneH];
        _ctrl_blood_rate ctrlSetBackgroundColor [0,0,0,0.75];
        _ctrl_blood_rate ctrlSetTextColor [1,1,1,1];

        [_ctrl_pulse,_ctrl] spawn AMA_fnc_heartRateGUI;

        {
                _x ctrlCommit 0;
        } forEach [_ctrl_name,_ctrl_info,_ctrl_pulse, _ctrl_dir, _ctrl_blood_rate];

        _AMA_medical_assistant_array append [[_ctrl,_ctrl_name,_ctrl_info,_ctrl_pulse, _ctrl_dir, _ctrl_blood_rate]];
};


private _counter = 1;
for "_o" from 0 to 1 step 0 do
{
        {
                _x params ["_ctrl","_ctrl_name","_ctrl_info","_ctrl_pulse", "_ctrl_dir", "_ctrl_blood_rate"];

                if (!((isNull _ctrl) && (isNull (findDisplay 180025)))) then
                {
                        private _unitsList = (units group player);
                        if !((count _unitsList)-1 < _forEachIndex) then
                        {
                                private _unit = (_unitsList # _forEachIndex);
                                if (_unit getVariable ["AMA_Medical_Device",true]) then
                                {
                                        private _bp = [_unit] call ace_medical_status_fnc_getbloodpressure;
                                        private _bv = _unit getVariable ["ace_medical_bloodvolume", 0];
                                        private _hr = _unit getVariable ["ace_medical_heartrate",0];
                                        private _hemorrhage = _unit getVariable ["ace_medical_hemorrhage", 0];
                                        private _color  = switch _hemorrhage do
                                        {
                                                case 0: { [1, 1, 1, 1] };
                                                case 1: { [1, 1, 0, 1] };
                                                case 2: { [1, 0.67, 0, 1] };
                                                case 3: { [1, 0.33, 0, 1] };
                                                case 4: { [1, 0, 0, 1]};
                                        };
                                        private _isMedic = [player, 1] call ace_medical_treatment_fnc_isMedic;

                                        if (_unit getVariable ["ACE_isUnconscious", false]) then {
                                              _color set [3, 0.5];  
                                        };

                                        if (!(alive _unit)) then {
                                              _color = [0,0,0, 0.5]  
                                        };

                                        {
                                                _x ctrlSetTextColor _color;
                                        } forEach [_ctrl_name,_ctrl_info,_ctrl_pulse];


                                        ([_unit] call RT_Utils_fnc_getUnitRoleInfo) params ["_name", "_role"];

                                        if (_name isEqualTo "") then {
                                                _unit getVariable ["ace_name","Unknown"]
                                        };

                                        private _nameTooltip = _name;
                                        if !(_role isEqualTo "") then {
                                                _nameTooltip = format ["%1\n%2", _name, _role];
                                        };

                                        _ctrl_name ctrlSetText _name;
                                        _ctrl_name ctrlSetTooltip _nameTooltip;

                                        _ctrl_pulse ctrlSetBackgroundColor [0,0,0,0.5];
                                        _hr = (_hr max 0.00000000001);

                                        _ctrl_pulse setVariable ["_hr", _hr];


                                        if (_unit != player) then
                                        {
                                                _ctrl_dir ctrlSetText "\rt\medical\images\arrow_CA.paa";
                                                _ctrl_dir ctrlSetAngle [[[player, _unit] call BIS_fnc_dirTo, getDir player] call BIS_fnc_getAngleDelta, 0.5, 0.5, false];
                                        }
                                        else 
                                        {
                                                _ctrl_dir ctrlSetText "";
                                        };

                                        _ctrl_dir ctrlCommit 0;

                                        private _blood_loss = switch _hemorrhage do
                                        {
                                                case 0: { ["No loss", "No blood loss"] };
                                                case 1: { ["Some", "Lost some blood"] };
                                                case 2: { ["A lot", "Lost a lot of blood"] };
                                                case 3: { ["Large", "Lost a large amount of blood"] };
                                                case 4: { ["Fatal", "Lost a fatal amount of blood"] };
                                        };

                                        _ctrl_info ctrlSetTooltip format[
                                                "Blood loss: %1\nUnit is %2",
                                                _blood_loss#1,
                                                ["conscious", "unconscious"] select (_unit getVariable ["ACE_isUnconscious", false])
                                        ];

                                        _ctrl_pulse ctrlSetTooltip format["%1bpm",if (_hr < 0.1) then {0} else {round(_hr)}];

                                        private _ctrl_info_distance_text = "%1m";
                                        private _ctrl_info_bp_text = "";

                                        if (_unit isEqualTo player) then
                                        {
                                                _ctrl_info_distance_text = "--";  
                                        };

                                        if (_isMedic) then {
                                                _ctrl_info_bp_text = "%1/%2 -- "
                                        };

                                        _ctrl_info ctrlSetStructuredText parseText format[
                                                "<t align='center' shadow='2' font='PuristaMedium'>%1%2<br/>%3</t>",
                                                format [_ctrl_info_bp_text, round(_bp#0), round(_bp#1)],
                                                _blood_loss#0,
                                                format [_ctrl_info_distance_text, round(player distance _unit)]
                                                
                                        ];
                                        
                                        if (_isMedic) then {
                                                private _bleedRate = [_unit] call ace_medical_status_fnc_getBloodLoss;
                                                private _bleedRateKO = ace_medical_const_bloodLossKnockOutThreshold * (([_unit] call ace_medical_status_fnc_getCardiacOutput) max 0.05);
                                                // Use nonzero minimum cardiac output to prevent all bleeding showing as massive during cardiac arrest

                                                private _loss_rate = switch (true) do {
                                                        case (!(alive _unit));
                                                        case (_bleedRate == 0): {[[1, 1, 1, 0], "", ""]};
                                                        case (_bleedRate < _bleedRateKO * 0.1): {[[1, 1, 0, 1], "Slow bleeding", "\rt\medical\images\loss_rate1.paa"]};
                                                        case (_bleedRate < _bleedRateKO * 0.5): {[[1, 0.67, 0, 1], "Moderate bleeding", "\rt\medical\images\loss_rate2.paa"]};
                                                        case (_bleedRate < _bleedRateKO * 1): {[[1, 0.33, 0, 1], "Severe bleeding", "\rt\medical\images\loss_rate3.paa"]};
                                                        default {[[1, 0, 0, 1], "Massive bleeding", "\rt\medical\images\loss_rate4.paa"]};
                                                };

                                                _ctrl_blood_rate ctrlSetTextColor _loss_rate#0;
                                                _ctrl_blood_rate ctrlSetTooltip _loss_rate#1;
                                                _ctrl_blood_rate ctrlSetText _loss_rate#2;

                                        } else {
                                                _ctrl_blood_rate ctrlSetTooltip "";
                                                _ctrl_blood_rate ctrlSetText "";   
                                        }

                                }
                                else
                                {
                                        [_ctrl_name,_ctrl_info,_ctrl_pulse, _ctrl_dir, _ctrl_blood_rate] call _AMA_search_control;
                                };
                        }
                        else
                        {
                                [_ctrl_name,_ctrl_info,_ctrl_pulse, _ctrl_dir, _ctrl_blood_rate] call _AMA_search_control;
                        };
                };
        } forEach _AMA_medical_assistant_array;
        if (isNull (findDisplay 180025)) exitWith { _o = 2 };

        if (floor _counter <= 4) then
        {
                _counter = _counter + 0.2;
        }
        else
        {
                _counter = 1;
        };
        uiSleep 0.1;
};
