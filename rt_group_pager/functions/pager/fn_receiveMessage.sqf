if !(hasInterface) exitWith {};

params ["_message"];

private _queue = uiNamespace getVariable [RT_PAGER_VAR_QUEUE, []];
_queue pushBack _message;
uiNamespace setVariable [RT_PAGER_VAR_QUEUE, _queue];

private _display = uiNamespace getVariable [RT_PAGER_VAR_RSC, displayNull];

if !(isNull _display) exitWith {};

RT_PAGER_VAR_RSC cutRsc [RT_PAGER_VAR_RSC, "PLAIN", -1];
_display = uiNamespace getVariable [RT_PAGER_VAR_RSC, displayNull];

if (isNull _display) exitWith {};

while {count _queue > 0} do {
	sleep 0.1;

	playSoundUI ["RTPager"];

	private _mesage = _queue#0;

	[_display, _mesage] call RT_Pager_fnc_ShowMessage;

	_queue = uiNamespace getVariable [RT_PAGER_VAR_QUEUE, []];
	_queue deleteAt 0;

	uiNamespace setVariable [RT_PAGER_VAR_QUEUE, _queue];
};

RT_PAGER_VAR_RSC cutFadeOut 0.5;


