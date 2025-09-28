params ["_args", "_elapsedTime", "_totalTime"];
_args params ["_medic", "_patient", "_bodyPart"];

private _woundStitchTime = RT_SETTINGS_MEDICAL_StitchTime call CBA_Settings_fnc_get;

// Not enough time has elapsed to stitch a wound
if (_totalTime - _elapsedTime > ([_patient, _patient, _bodyPart, false] call RT_Medical_fnc_getStitchTime) - _woundStitchTime) exitWith {true};


private _bandagedWounds = _patient getVariable ["ace_medical_bandagedWounds", createHashMap];
private _bandagedWoundsOnPart = _bandagedWounds get _bodyPart;

// Stop treatment if there are no wounds that can be stitched remaining
if (_bandagedWoundsOnPart isEqualTo []) exitWith {false};

private _items = [_medic, 0] call ace_common_fnc_uniqueItems;

if (!isNull(([_medic, _patient, ["ACE_suture"]] call ace_medical_treatment_fnc_useItem)#0)) then {
    private _stitched = [_patient, _bodyPart] call RT_Medical_fnc_stitchOneWound;

    if (_stitched) then {
        [_medic, _patient, "Head", "Suture"] call ace_medical_treatment_fnc_createLitter
    };

    _stitched
} else {
    false
}
