private _display = (findDisplay 180025);
if (isNull _display) exitWith {};

private _mainCtrlGroup = (_display displayCtrl 956);
if (isNull _mainCtrlGroup) exitWith {};

private _count = _this#0;

private _resultArray = [];

private _xSpot = 0;
private _ySpot = 0;

[] call RT_Medical_Assistant_fnc_clearControls;

for "_i" from 0 to (_count-1) do
{
	private _ctrl = _display ctrlCreate ["RscControlsGroupNoScrollbars", _i, _mainCtrlGroup];

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
	_ctrl_dir ctrlSetText "\rt\medical_assistant\images\arrow_CA.paa";

	private _ctrl_blood_rate = _display ctrlCreate ["RscPicture", (1100 + _i), _ctrl];
	_ctrl_blood_rate ctrlSetPosition [0.1 * safezoneW - 1.67151e-007 * safezoneW, 0.033 * safezoneH, 0.017031 * safezoneW, 0.0275 * safezoneH];
	_ctrl_blood_rate ctrlSetBackgroundColor [0,0,0,0.75];
	_ctrl_blood_rate ctrlSetTextColor [1,1,1,1];

	[_ctrl_pulse,_ctrl] spawn AMA_fnc_heartRateGUI;

	{
		_x ctrlEnable false;
		_x ctrlCommit 0;
	} forEach [_ctrl_name,_ctrl_info,_ctrl_pulse, _ctrl_dir, _ctrl_blood_rate];


	_resultArray append [[_ctrl, _ctrl_name, _ctrl_info, _ctrl_pulse, _ctrl_dir, _ctrl_blood_rate]];
};

_resultArray