params [["_control", controlNull], ["_isMusic", false]];

if (isNull _control) exitWith {};

private _group =  ctrlParentControlsGroup _control;
private _sliderCtrl = _group controlsGroupCtrl 1;

if (isNull _sliderCtrl) exitWith {};
 
private _value = sliderPosition _sliderCtrl;

private _function = if (_isMusic) then {"fadeMusic"} else {"fadeSound"};

[5, _value] remoteExec [_function, 0, true];

[_sliderCtrl, _isMusic] spawn {
	params [["_sliderCtrl", controlNull], ["_isMusic", false]];

	private _counter = 5;

	while {_counter > 0} do {
		if (isNull _sliderCtrl) exitWith {};


		private _newValue = 0;

		_newValue = if (_isMusic) then {musicVolume} else {soundVolume};

		_sliderCtrl sliderSetPosition _newValue;
		[_sliderCtrl, _newValue] call RT_PauseDisplay_fnc_setSoundSliderText;
		_sliderCtrl ctrlCommit 0;

		_counter = _counter - 0.01;
		sleep 0.01;
	};
}
