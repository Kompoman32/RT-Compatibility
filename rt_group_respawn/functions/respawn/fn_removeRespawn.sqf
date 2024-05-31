private _respawnId = player getVariable [RT_RESPAWN_VAR_RESPAWN_ID, nil];
private _target = player getVariable [RT_RESPAWN_VAR_TARGET, nil];

if (!(isNil "_respawnId") && !(isNil "_target")) then {
    [_target, _respawnId] call BIS_fnc_removeRespawnPosition;
};

player setVariable [RT_RESPAWN_VAR_RESPAWN_ID, nil];
player setVariable [RT_RESPAWN_VAR_TARGET, nil];