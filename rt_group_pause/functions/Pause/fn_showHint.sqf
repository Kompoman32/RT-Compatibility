/*
	Description: Shows Pause hint or shows Resume hint
	Author: Kompoman32
	Made for: RT group
	
	Arguments:
	0: _showPauseHint  - Show Pause hint
	1: _showResumeHint - Optional. Show Resume hint (only if _showPauseHint = false) (default: true)
	
	Examples:
	* [true] call RT_Utils_fnc_showStopStartHint;
	* [false, false] call RT_Utils_fnc_showStopStartHint;
*/

/** Only local and not in local server */
if (!hasInterface || isServer) exitwith {};

params [["_showPauseHint", false], ["_showResumeHint", true]];

IDC_STOPSTART = 9999;

if (!_showPauseHint) exitWith {
	private _hintCtrl = player getVariable [RT_PAUSE_VAR_HINT_CTRL, nil];

	if (!(isNil "_hintCtrl")) then {
		ctrlDelete _hintCtrl;
	};

	player setVariable [RT_PAUSE_VAR_HINT_CTRL, nil];

	if (_showResumeHint) then {
		cutText ["<t color='#00ff00' size='5'>ПРОДОЛЖАЕМ</t><br/>", "PLAIN", 0.2, true, true];
	}
};

[player] spawn {
	disableSerialization;
	params ["_player"];

	// Убираем контрол на всякий случай
	[false, false] call RT_Utils_fnc_showStopStartHint;

	private _text = "<t color='#ff0000' size='4'>ИГРА ПРИОСТАНОВЛЕНА</t>";

	private _display = findDisplay 46;
	private _ctrlGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars", IDC_STOPSTART];
	private _ctrlBackground = _display ctrlCreate ["RscStructuredText", -1, _ctrlGroup];

	private _ctrlWidth = 0.86;
	private _ctrlHeight = 0.17;

	// Размеры точно настроены. Надо бы проверить на других экранах
	_ctrlBackground ctrlSetPositionX ((safeZoneW - _ctrlWidth) / 2);
	_ctrlBackground ctrlSetPositionY ((safeZoneH - _ctrlHeight) / 2);
	_ctrlBackground ctrlSetPositionW _ctrlWidth;
	_ctrlBackground ctrlSetPositionH _ctrlHeight;

	_ctrlBackground ctrlSetBackgroundColor [0, 0, 0, 0];
	_ctrlBackground ctrlSetStructuredText parseText _text;
	_ctrlBackground ctrlEnable false;
	_ctrlBackground ctrlCommit 0;

	_ctrlGroup ctrlSetPosition [safeZoneX, safeZoneY, safeZoneW, safeZoneH];
	_ctrlGroup ctrlCommit 0;

	_player setVariable [RT_PAUSE_VAR_HINT_CTRL, _ctrlGroup];
}