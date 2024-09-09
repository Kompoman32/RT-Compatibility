if (!isServer) exitWith {};

RT_Music_Playlist_Current = [];

[] spawn {
    [5] call RT_UTILS_fnc_waitUntilTime;

    [] call RT_Music_fnc_initMusicHandlerServer;

    addMissionEventHandler ["PlayerDisconnected", {
        params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

        private _handlerOwner = missionNamespace getVariable [RT_MUSIC_VAR_MUSIC_HANDLER, 1];


        if (_handlerOwner == _owner || _handlerOwner == 1) then {
            [] spawn {
                sleep 1;
                [] call RT_Music_fnc_initMusicHandlerServer;
            }
        }
    }];
}