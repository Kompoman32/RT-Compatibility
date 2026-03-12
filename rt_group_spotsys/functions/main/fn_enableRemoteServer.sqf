if !(isNil "RT_SPOTSYS_isSpotSystemAllowedServer") exitWith {}; 
RT_SPOTSYS_isSpotSystemAllowedServer = true; 
RT_SPOTSYS_AllSpottedTargets = [];
  
publicVariable "RT_SPOTSYS_ServerSpotUpdateRate"; 
publicVariable "RT_SPOTSYS_ClientSpotUpdateRate"; 
publicVariable "RT_SPOTSYS_AllSpottedTargets"; 

while {RT_SPOTSYS_isSpotSystemAllowedServer} do  
{ 
  comment "Remove dead and missing units and update array across the network"; 
  RT_SPOTSYS_AllSpottedTargets = (RT_SPOTSYS_AllSpottedTargets - allDead - [objNull]); 

  private _updated = false;
  private _spotDelay = RT_SETTINGS_SPOTSYSTEM_max_spot_time call CBA_settings_fnc_get;

  if (RT_SETTINGS_SPOTSYSTEM_WALLHACK_enable call CBA_settings_fnc_get) then {
    _spotDelay = RT_SETTINGS_SPOTSYSTEM_WALLHACK_max_spot_time call CBA_settings_fnc_get;
  };

  {
    _time = _x getVariable "SpotTime"; 
    if (isNil "_time") then {
      _time = time;
      _x setVariable ["SpotTime", _time, true]; 
    };

    if (alive _x && (RT_SETTINGS_SPOTSYSTEM_WALLHACK_enable call CBA_settings_fnc_get)) then {
      _unit = _x;
      _spotBySomebody = (call CBA_fnc_players /*RT_Utils_fnc_getAllPlayersWithoutCurators*/ ) findIf {
        _res = [_x, _unit] call RT_SpotSystem_fnc_canSee;
        _res
      }; 

      if (_spotBySomebody != -1) then {
        _time = time;
        _x setVariable ["SpotTime", _time, true]; 
      }
    };

    if (_time < (time - _spotDelay)) then  
    { 
      RT_SPOTSYS_AllSpottedTargets = (RT_SPOTSYS_AllSpottedTargets - [_x]); 
      _x setVariable ["SpotTime",nil, true]; 

      _updated = true;
    }; 
  } foreach RT_SPOTSYS_AllSpottedTargets; 



  if (_updated) then {
    publicVariable "RT_SPOTSYS_AllSpottedTargets"; 
  };

  uisleep RT_SPOTSYS_ServerSpotUpdateRate; 
};