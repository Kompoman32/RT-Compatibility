
params ["_teleporter"];

private _trg = createTrigger ["EmptyDetector", position _teleporter, false];
_trg setTriggerArea (_teleporter getvariable ["objectArea",[0,0,0,false,0]]);
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trg setTriggerStatements ["player in thisList", "[thisTrigger] call RT_Teleport_fnc_teleportDialogOpen", ""];
_trg setTriggerTimeout [1, 1, 1, true];
_trg setTriggerInterval 1;
_teleporter setVariable [RT_TELEPORT_VAR_TELEPORTER_MODULE, _trg];
_trg setVariable [RT_TELEPORT_VAR_TELEPORTER_MODULE, _teleporter];
