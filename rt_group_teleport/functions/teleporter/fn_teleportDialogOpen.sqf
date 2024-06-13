params ["_trigger"];

closeDialog 2;

private _teleporter = (_trigger getVariable RT_TELEPORT_VAR_TELEPORTER_MODULE);
uiNamespace setVariable [RT_TELEPORT_VAR_TELEPORTER_MODULE, _teleporter];

private _dialog = createDialog "TeleporterDialog";

if (!_dialog) exitWith {
	uiNamespace setVariable [RT_TELEPORT_VAR_TELEPORTER_MODULE, nil];
};

