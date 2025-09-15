private _display = (findDisplay RT_MEDICAL_ASSSISTANT_VAR_DISPLAY_IDC);
if (isNull _display) exitWith {};

private _mainCtrlGroup = (_display displayCtrl 956);
if (isNull _mainCtrlGroup) exitWith {};

params [["_count", 0], ["_xSpot", 0], ["_ySpot", 0], ["_groupIndex", -1], ["_group", objNull]];

private _resultArray = [];

for "_i" from 0 to (_count-1) do
{
	private _ctrl = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1, _mainCtrlGroup];

	switch _xSpot do {
		case 0: {
			_ctrl ctrlSetPosition [2.26276e-007 * safezoneW, (0.131 * _ySpot) * safezoneH,0.134062 * safezoneW,0.134063 * safezoneH];
			_xSpot = 1;
		};
		case 1: {
			_ctrl ctrlSetPosition [0.134063 * safezoneW, (0.131 * _ySpot) * safezoneH,0.134062 * safezoneW,0.134063 * safezoneH];
			_xSpot = 2;
		};
		case 2: {
			_ctrl ctrlSetPosition [0.2677 * safezoneW, (0.131 * _ySpot) * safezoneH,0.134062 * safezoneW,0.134063 * safezoneH];
			_ySpot = _ySpot + 1;
			_xSpot = 0;
		};
	};

	_ctrl ctrlCommit 0;

	private _ctrl_name = _display ctrlCreate ["MedAssistRscTextCenter", -1, _ctrl];
	_ctrl_name ctrlSetPosition [-2.45869e-008 * safezoneW, -3.27826e-008 * safezoneH,0.134062 * safezoneW,0.033 * safezoneH];
	_ctrl_name ctrlSetFont "PuristaBold";

	private _ctrl_info = _display ctrlCreate ["RscStructuredText", -1, _ctrl];
	_ctrl_info ctrlSetPosition [4.67151e-007 * safezoneW, 0.033 * safezoneH,0.134062 * safezoneW,0.055 * safezoneH];

	private _ctrl_pulse = _display ctrlCreate ["RscText", -1, _ctrl];
	_ctrl_pulse ctrlSetPosition [-1.25393e-006 * safezoneW, 0.088 * safezoneH,0.134062 * safezoneW,0.044 * safezoneH];
	_ctrl_pulse ctrlSetBackgroundColor [0,0,0,0.75];


	private _ctrl_dir = _display ctrlCreate ["RscPicture", -1, _ctrl];
	_ctrl_dir ctrlSetPosition [4.67151e-007 * safezoneW, 0.033 * safezoneH, 0.034062 * safezoneW, 0.055 * safezoneH];
	_ctrl_dir ctrlSetBackgroundColor [0,0,0,0];
	_ctrl_dir ctrlSetTextColor [1,1,1,0.5];
	_ctrl_dir ctrlSetText "\rt\medical_assistant\images\arrow_CA.paa";

	private _ctrl_blood_rate = _display ctrlCreate ["RscPicture", -1, _ctrl];
	_ctrl_blood_rate ctrlSetPosition [0.1 * safezoneW - 1.67151e-007 * safezoneW, 0.033 * safezoneH, 0.017031 * safezoneW, 0.0275 * safezoneH];
	_ctrl_blood_rate ctrlSetBackgroundColor [0,0,0,0.75];
	_ctrl_blood_rate ctrlSetTextColor [1,1,1,1];

	[_ctrl_pulse,_ctrl] spawn RT_Medical_Assistant_fnc_heartRateGUI;

	private _ctrls = [_ctrl_name,_ctrl_info,_ctrl_pulse, _ctrl_dir, _ctrl_blood_rate];

	if (_groupIndex != -1) then {
		private _ctrl_groupIconBG = _display ctrlCreate ["RscStructuredText", -1, _ctrl];
		private _ctrl_groupIcon = _display ctrlCreate ["RscStructuredText", -1, _ctrl];

		private _bgColor = [_groupIndex] call RT_Medical_assistant_fnc_getGroupColor;
		private _pos = [0, 0, 0.02, 0.02];

		_ctrl_groupIcon ctrlSetPosition _pos;
		_ctrl_groupIcon ctrlSetBackgroundColor _bgColor;

		if !(isNull _group) then {
			_ctrl_groupIcon ctrlSetTooltip (groupId _group);
		};

		_ctrl_groupIconBG ctrlSetPosition _pos;
		_ctrl_groupIconBG ctrlSetBackgroundColor [0,0,0,1];

		_ctrls pushBack _ctrl_groupIcon;
		_ctrls pushBack _ctrl_groupIconBG;
	};

	{
		_x ctrlEnable false;
		_x ctrlCommit 0;
	} forEach _ctrls;

	_ctrls insert [0, [_ctrl]];

	_resultArray append [_ctrls];
};

_resultArray