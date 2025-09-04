
(_this#0) params ["_ctrl","_ctrl_name","_ctrl_info","_ctrl_pulse", "_ctrl_dir", "_ctrl_blood_rate", ["_ctrl_groupIcon", objNull], ["_ctrl_groupIconBG", objNull]];
private _index = _this#1;
private _unitsList = _this#2;

if ((isNull _ctrl) || (isNull (findDisplay RT_MEDICAL_ASSSISTANT_VAR_DISPLAY_IDC))) exitWith {};

private _unit = objNull;

if (_index < (count _unitsList)) then {
	_unit = _unitsList#_index;
};

if ((isNull _unit) || !(_unit getVariable ["AMA_Medical_Device",true])) exitWith
{
	[_ctrl_name,_ctrl_info,_ctrl_pulse, _ctrl_dir, _ctrl_blood_rate, _ctrl_groupIcon, _ctrl_groupIconBG] call RT_Medical_Assistant_fnc_searchControl;
};

if !(isNull _ctrl_groupIcon) then {
	_ctrl_groupIcon ctrlShow true;
	_ctrl_groupIcon ctrlCommit 0;
};

if !(isNull _ctrl_groupIconBG) then {
	_ctrl_groupIconBG ctrlShow true;
	_ctrl_groupIconBG ctrlCommit 0;
};

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
	_ctrl_dir ctrlSetText "\rt\medical_assistant\images\arrow_CA.paa";
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

private _isMedic = [player, 1] call ace_medical_treatment_fnc_isMedic;

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
		case (_bleedRate < _bleedRateKO * 0.1): {[[1, 1, 0, 1], "Slow bleeding", "\rt\medical_assistant\images\loss_rate1.paa"]};
		case (_bleedRate < _bleedRateKO * 0.5): {[[1, 0.67, 0, 1], "Moderate bleeding", "\rt\medical_assistant\images\loss_rate2.paa"]};
		case (_bleedRate < _bleedRateKO * 1): {[[1, 0.33, 0, 1], "Severe bleeding", "\rt\medical_assistant\images\loss_rate3.paa"]};
		default {[[1, 0, 0, 1], "Massive bleeding", "\rt\medical_assistant\images\loss_rate4.paa"]};
	};

	_ctrl_blood_rate ctrlSetTextColor _loss_rate#0;
	_ctrl_blood_rate ctrlSetTooltip _loss_rate#1;
	_ctrl_blood_rate ctrlSetText _loss_rate#2;

} else {
	_ctrl_blood_rate ctrlSetTooltip "";
	_ctrl_blood_rate ctrlSetText "";   
}