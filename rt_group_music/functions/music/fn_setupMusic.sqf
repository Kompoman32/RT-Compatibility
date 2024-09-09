params [["_musicKind", "pause"], ["_fadeTime", 5]];

private _handlerOwner = missionNamespace getVariable [RT_MUSIC_VAR_MUSIC_HANDLER, 1];

if (_handlerOwner == 1) then {
	[] call RT_Music_fnc_initMusicHandlerServer;
};

_musicKind = toLower _musicKind;

private _availableMusicKinds = ["pause", "calm", "action"];

if (_availableMusicKinds findIf {_x == _musicKind} == -1) exitWith {};

private _wasPaused = count RT_Music_Playlist_Current == 0;

RT_Music_Playlist_Current = switch (_musicKind) do
{
	case "calm": { RT_Music_Playlist_Calm };
	case "action": { RT_Music_Playlist_Action };
	default { [] };
};


if (_wasPaused && count RT_Music_Playlist_Current > 0 ) then {
	[_fadeTime] call RT_Music_fnc_playRandomMusic;
} else {
	[_fadeTime] remoteExec ["RT_Music_fnc_stopMusic", 0];
};
