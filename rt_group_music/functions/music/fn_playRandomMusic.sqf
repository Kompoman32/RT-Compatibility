params [["_fadeTime", 5]];
if (count RT_Music_Playlist_Current == 0) exitWith {};

private _newTrack = selectRandom RT_Music_Playlist_Current;

[_newTrack, _fadeTime] spawn {
    params ["_newTrack", "_fadeTime"];

    [_fadeTime, 0] remoteExec ["fadeMusic", 0];
    _newTrack remoteExec ["playMusic", 0];
    [_fadeTime, 1] remoteExec ["fadeMusic", 0];
};

