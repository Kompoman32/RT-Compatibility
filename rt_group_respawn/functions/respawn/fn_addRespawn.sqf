
private _respawnResult = ([group player, player] call BIS_fnc_addRespawnPosition);

_respawnResult params ["_target", "_respawnId"];

player setVariable [RT_RESPAWN_VAR_TARGET, _target];
player setVariable [RT_RESPAWN_VAR_RESPAWN_ID, _respawnId];
