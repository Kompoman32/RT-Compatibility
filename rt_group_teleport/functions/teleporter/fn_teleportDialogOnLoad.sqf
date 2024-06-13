// run on Local in Sheduled
if ([_this, true, false] call RT_Utils_fnc_callByScriptName) exitWith {};

sleep 0.05;

// params ["_displayOrControl", ["_config", configNull]];

private _teleporter = uiNamespace getVariable RT_TELEPORT_VAR_TELEPORTER_MODULE;

private _allPositions = synchronizedObjects _teleporter;

private _pagesCount = floor ((count _allPositions) / 5) + 1;

private _hasPages = _pagesCount > 1;

// Page Left Button
ctrlShow [21437, _hasPages];
// Page Title
ctrlShow [21438, _hasPages];
// Page Right Button
ctrlShow [21439, _hasPages];

ctrlSetText [21438, format ["1/%1", _pagesCount]];

[] call RT_Teleport_fnc_teleportDialogSetValues;
