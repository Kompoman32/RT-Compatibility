addMusicEventHandler ["MusicStop", {
    params ["_musicClassname", "_ehId"];

	[] remoteExec ["RT_Music_fnc_playRandomMusic", 2];
}];