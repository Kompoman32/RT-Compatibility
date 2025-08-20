if !(RT_SETTINGS_FUN_enable call CBA_settings_fnc_get) exitwith {};
if !(RT_SETTINGS_FUN_enable_arsenal_music call CBA_settings_fnc_get) exitwith {};

private _soundName = selectRandom RT_FUN_VAR_ARSENAL_MUSIC_POOL;
private _index = RT_FUN_VAR_ARSENAL_MUSIC_POOL find _soundName;

if (_index < 0) exitWith {};

private _sound = playSoundUI [_soundName];

missionNamespace setVariable [RT_FUN_VAR_ARSENAL_MUSIC_INDEX, _index];
missionNamespace setVariable [RT_FUN_VAR_ARSENAL_MUSIC, _sound];

[missionNamespace, RT_FUN_VAR_ARSENAL_MUSIC_POOL_SPAWN, [], {
	waitUntil {
		private _sound = missionNamespace getVariable [RT_FUN_VAR_ARSENAL_MUSIC, nil];
		if (isNil "_sound") exitWith{true};

		if (soundParams _sound isEqualTo []) then {
			private _index = missionNamespace getVariable [RT_FUN_VAR_ARSENAL_MUSIC_INDEX, nil];

			if (isNil "_index") exitWith{true};

			_index = (_index + 1) mod (count RT_FUN_VAR_ARSENAL_MUSIC_POOL);

			private _soundName = RT_FUN_VAR_ARSENAL_MUSIC_POOL select _index;
	
			_sound = playSoundUI [_soundName];

			missionNamespace setVariable [RT_FUN_VAR_ARSENAL_MUSIC_INDEX, _index];
			missionNamespace setVariable [RT_FUN_VAR_ARSENAL_MUSIC, _sound];
		};

		sleep 1;

		false
	}	
}] call RT_Utils_fnc_addScriptHandler;
