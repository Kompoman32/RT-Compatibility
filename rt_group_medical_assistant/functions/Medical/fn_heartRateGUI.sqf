params ["_ctrl","_parentCtrl"];

private _display = (findDisplay 180025);

private _heartBeatCtrl = _display ctrlCreate ["RscPicture",(15000 + (random 15000)),_parentCtrl];
_heartBeatCtrl ctrlSetText "\rt\medical_assistant\images\hr1.paa";

_heartBeatCtrl ctrlShow false;

[_ctrl, _parentCtrl, _heartBeatCtrl] spawn {
  private _startX = -1 * safezoneW / 2;
  private _startY = 0.088 * safezoneH;
  private _startW = 1 * safezoneW;
  private _startH = 0.044 * safezoneH;

  params ["_ctrl","_parentCtrl", "_heartBeatCtrl"];

  while {true} do {
    if (isNull _ctrl) exitWith {};

   _heartBeatCtrl ctrlShow ((ctrlBackgroundColor _ctrl)#3 != 0);

    _hr = _ctrl getVariable ["_hr", 120];
    private _endX = _startX + 1;

    _heartBeatCtrl ctrlSetPosition [_startX, _startY, _startW, _startH];
    _heartBeatCtrl ctrlSetTooltip format["%1bpm",if (_hr < 0.1) then {0} else {round _hr}];
    
    private _color = [1,1,1,1];

    if (_hr < 70) then {
      _color = [1,0.6,0,1];
    };

    if (_hr < 40) then {
      _color = [1,0,0,1];
    };

    if (_hr < 1) then {
      _endX = _startX;
    };

    _heartBeatCtrl ctrlSetTextColor _color;
    _heartBeatCtrl ctrlCommit 0;

    _heartBeatCtrl ctrlSetPositionX _endX;

    _hr = (round _hr) min 180 max 1;

    _time = 60/(_hr);
    _heartBeatCtrl ctrlCommit _time;

    uiSleep _time;
  };
}