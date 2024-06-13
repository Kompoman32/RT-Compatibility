if (is3DEN || !isServer) exitWith{};

params [
	["_mode", "", [""]],
	["_input", [], [[]]]
];

if (_mode != "init") exitWith {};


_input params [
	["_teleportPosition", objNull, [objNull]],		
	["_isActivated", true, [true]],		
	["_isCuratorPlaced", false, [true]]	
];

_teleportPosition setVariable ["title", _teleportPosition getVariable "title", true];
