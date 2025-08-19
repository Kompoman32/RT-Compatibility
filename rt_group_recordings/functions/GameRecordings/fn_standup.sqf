steamGameRecordingEvent ["RTConsiousEvent", 0, [], 0];

private _lastEnter = player getVariable [RT_RECORDINGS_VAR_LAST_UNCOSCIOUS_FALL, time];
private _diff = time - _lastEnter;

if (_diff > 0.5) then {
	steamGameRecordingEvent ["RTUnconsiousEvent", _diff, [], -_diff];
};

player setVariable [RT_RECORDINGS_VAR_LAST_UNCOSCIOUS_FALL, nil];
