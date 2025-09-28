params ["", "_patient", "_bodyPart", ["_useMin", true]];

private _bandagedWounds = _patient getVariable ["ace_medical_bandagedWounds", createHashMap];
private _bandagedWoundsOnPart = _bandagedWounds get _bodyPart;

private _sumOfWounds = 0;

{
	_sumOfWounds = _sumOfWounds + (_x#1) * (RT_SETTINGS_MEDICAL_StitchTime call CBA_Settings_fnc_get);
} forEach _bandagedWoundsOnPart;

// if (_useMin) then { _sumOfWounds min 5 } else {_sumOfWounds}
_sumOfWounds
