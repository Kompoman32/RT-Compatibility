private _owner = owner (([] call CBA_fnc_players)#0);

missionNamespace setVariable [RT_MUSIC_VAR_MUSIC_HANDLER, _owner];

[] remoteExec ["RT_Music_fnc_initMusicHandler", _owner];
