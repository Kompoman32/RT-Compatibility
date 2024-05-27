
params [["_player", player], ["_time", 0]];
waitUntil {!(isNull _player) && (time > _time)};