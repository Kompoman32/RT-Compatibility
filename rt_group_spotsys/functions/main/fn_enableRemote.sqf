if (!hasInterface) exitWith {}; 
if (isMultiplayer) then {waitUntil {sleep 0.1; getClientState isEqualTo "BRIEFING READ"};}; 
if !(isNil "RT_SPOTSYS_isSpotSystemAllowed") exitWith {}; 
waitUntil {sleep 0.1; !((findDisplay 12 displayCtrl 51) isEqualTo controlNull)}; 

// comment "Show Hint to non-zeus players"; 
// [] spawn { 
//   waitUntil {sleep 0.1; alive player}; 
//   if (player in (call BIS_fnc_listCuratorPlayers)) exitWith {}; 
//   hint parseText ("Press "+"<t color='#ffb300'>"+(actionKeysNamesarray ["revealTarget",1,"Keyboard"] select 0)+"</t>"+" while looking at a target to spot them!"); 
// }; 

if (!isNil "RT_SPOTSYS_isSpotSystemAllowed") exitWith {}; 
RT_SPOTSYS_isSpotSystemAllowed = true; 

waitUntil {!isNil "RT_SPOTSYS_ClientSpotUpdateRate"}; 

[player, "GetInMan", RT_SPOTSYS_VAR_GetInMan_HANDLER] call Rt_Utils_fnc_removeEventhandler;
[player, "GetInMan", RT_SPOTSYS_VAR_GetInMan_HANDLER, {  
  params ["_unit", "_role", "_vehicle", "_turret"]; 
  RT_SPOTSYS_AllSpottedTargets = (RT_SPOTSYS_AllSpottedTargets - [_vehicle]); 

  [_vehicle, true] remoteExec ["RT_SpotSystem_fnc_serverSpotTarget", 2];

  // [RT_SPOTSYS_AllSpottedTargets,{RT_SPOTSYS_AllSpottedTargets = _this;}] call RT_SpotSystem_fnc_RE_Server; 
}] call Rt_Utils_fnc_addEventhandler;



// comment "Update spotted targets the player is looking at on the server"; 
// if (SpotAllowAutoSpot) then { 
//   [] spawn { 
//   while {RT_SPOTSYS_isSpotSystemAllowed} do  
//   { 
//     [call RT_SpotSystem_fnc_getCursorTarget] call RT_SpotSystem_fnc_clientSpotTarget; 
//     uisleep RT_SPOTSYS_ClientSpotUpdateRate; 
//   }; 
//   }; 
// }; 

comment "Update spotted targets when the player presses revealAction"; 
[player, "KeyDown", 46, RT_SPOTSYS_VAR_SpotByKey_HANDLER] call Rt_Utils_fnc_removeDisplayEventhandler;
[player, "KeyDown", 46, RT_SPOTSYS_VAR_SpotByKey_HANDLER, {
  if (call RT_SpotSystem_fnc_isWallhackEnabled) exitWith {};

  private _pressed = ((_this select 1) isEqualTo ((actionKeys RT_SPOTSYS_SpotTargetActionKey) select 0)); 
  if (_pressed && RT_SPOTSYS_isSpotSystemAllowed) then {
    [call RT_SpotSystem_fnc_getCursorTarget] call RT_SpotSystem_fnc_clientSpotTarget;
  }; 
  
  false
}] call Rt_Utils_fnc_addDisplayEventhandler;

comment "Render the spotted units in 3D space"; 
if !(isNil "SpotMissionDrawEvent") then {
	removeMissionEventHandler ['Draw3D',SpotMissionDrawEvent];
};
SpotMissionDrawEvent = addMissionEventHandler ["Draw3D", RT_SpotSystem_fnc_drawEvent]; 

comment "Render the spotted units on the map"; 
if !(isNil "SpotMapDrawEvent") then {
	(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ['Draw',SpotMapDrawEvent]; 
};
SpotMapDrawEvent = (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw", RT_SpotSystem_fnc_drawMapEvent]; 

[true] spawn RT_SpotSystem_fnc_enableWallhack;
