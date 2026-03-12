if !(isServer) exitWith {};

params [["_enable", true]];

if (_enable) then {
	[] remoteExec ["RT_SpotSystem_fnc_enableRemote",0,"JIP_ID_SPOTSYSTEM"]; 
	[] remoteExec ["RT_SpotSystem_fnc_enableRemoteServer",2];
} else {
	[] remoteExec ["RT_SpotSystem_fnc_disableRemote",0,"JIP_ID_SPOTSYSTEM"]; 
};