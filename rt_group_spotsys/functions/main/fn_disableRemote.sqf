RT_SPOTSYS_isSpotSystemAllowed = nil; 
[player, "KeyDown", 46, RT_SPOTSYS_VAR_SpotByKey_HANDLER] call Rt_Utils_fnc_removeDisplayEventhandler;
[player, "GetInMan", RT_SPOTSYS_VAR_GetInMan_HANDLER] call Rt_Utils_fnc_removeEventhandler;\
if !(isNil "SpotMissionDrawEvent") then {
	removeMissionEventHandler ['Draw3D',SpotMissionDrawEvent];
	SpotMissionDrawEvent = nil;
};

if !(isNil "SpotMapDrawEvent") then {
	(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ['Draw',SpotMapDrawEvent]; 
	SpotMapDrawEvent = nil;
};

{
	_x setVariable ["SpotTime", nil, true];
} forEach RT_SPOTSYS_AllSpottedTargets;

RT_SPOTSYS_AllSpottedTargets = [];

[false] spawn RT_SpotSystem_fnc_enableWallhack;
