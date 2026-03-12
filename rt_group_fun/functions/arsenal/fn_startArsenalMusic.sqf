params [["_next", false]];

private _index = -1;
private _soundName = objNull;

if (count RT_FUN_VAR_ARSENAL_MUSIC_POOL == 0) exitWith {-1};

if (_next) then {
	_index = missionNamespace getVariable [RT_FUN_VAR_ARSENAL_MUSIC_INDEX, selectRandom RT_FUN_VAR_ARSENAL_MUSIC_POOL];
	_index = (_index + 1) mod (count RT_FUN_VAR_ARSENAL_MUSIC_POOL);

	_soundName = RT_FUN_VAR_ARSENAL_MUSIC_POOL select _index;
} else {
	_soundName = selectRandom RT_FUN_VAR_ARSENAL_MUSIC_POOL;
	_index = RT_FUN_VAR_ARSENAL_MUSIC_POOL find _soundName;
};

if (_index < 0) exitWith {-1};
if (_soundName == "") exitWith {-1};

private _sound = missionNamespace getVariable [RT_FUN_VAR_ARSENAL_MUSIC, nil];

if !(isNil "_sound") then {
	[_sound] call RT_FUN_fnc_stopArsenalMusic;
};

_sound = playSoundUI [_soundName];

missionNamespace setVariable [RT_FUN_VAR_ARSENAL_MUSIC_INDEX, _index];
missionNamespace setVariable [RT_FUN_VAR_ARSENAL_MUSIC, _sound];

_index