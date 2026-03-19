params["_target", ["_silent", false]];

if (_target in RT_SPOTSYS_AllSpottedTargets) then {
	if (RT_SPOTSYS_VAR_Hold_Key_Delay_LastCall < (time - RT_SPOTSYS_VAR_Hold_Key_Delay)) then {
		[_target] remoteExec ["RT_SpotSystem_fnc_serverSpotTarget", 2, false];

		RT_SPOTSYS_VAR_Hold_Key_Delay_LastCall = time;
	};
} else {
	if (
		!([_target] call RT_SPOTSYSTEM_fnc_isGrenade) &&
		(
			!(_target isKindOf "AllVehicles") || !(alive _target) || (driver _target in allPlayers)
		)
	   ) exitWith {};
	if (!([_target] call RT_SpotSystem_fnc_canSeeBySide)) exitWith {};
	if (_target in RT_SPOTSYS_NonSpottableTargets) exitWith {};

	RT_SPOTSYS_VAR_Hold_Key_Delay_LastCall = time;

	// just add it to local to fix hold key
	RT_SPOTSYS_AllSpottedTargets pushBack _target; 

	// if (isServer) then
	// {
	// 	RT_SPOTSYS_AllSpottedTargets pushBack _target; 
	// } else {
	// 	[_target] remoteExec ["RT_SpotSystem_fnc_serverSpotTarget", 2, false];
	// };

	[_target] remoteExec ["RT_SpotSystem_fnc_serverSpotTarget", 2, false];

	if (!_silent) then {
		// [RT_SPOTSYS_AllSpottedTargets,{RT_SPOTSYS_AllSpottedTargets = _this;}] call RT_SpotSystem_fnc_RE_Server; 
		_sound = RT_SETTINGS_SPOTSYSTEM_spot_sound call CBA_settings_fnc_get;
		if (_sound != "") then {
			playSound _sound;
		};

		if (RT_SETTINGS_SPOTSYSTEM_spot_add_voice_and_anim call CBA_settings_fnc_get) then {
			if !(cameraView isEqualTo "GUNNER") then {[player,"gestureGo"] remoteExec ["playActionNow",0];}; 
			if (!RT_SPOTSYS_SpotIsPlayingVoice) then {[] spawn RT_SpotSystem_fnc_spawnPlaySpotVoiceLine;}; 
		}
	}
}
