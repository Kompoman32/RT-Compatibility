if (is3DEN) exitWith{};

params [
	["_mode", "", [""]],
	["_input", [], [[]]]
];

if (_mode != "init") exitWith {};

if (!isServer) exitWith {};


_input params [
	["_teleporter", objNull, [objNull]],		
	["_isActivated", true, [true]],		
	["_isCuratorPlaced", false, [true]]	
];


[_teleporter] remoteExec ["RT_Teleport_fnc_initTeleporterToPositionsLocal", -2, true];

