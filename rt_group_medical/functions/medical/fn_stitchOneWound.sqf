params ["_patient", "_bodyPart", ["_treatedWound", []]];

private _bandagedWounds = _patient getVariable ["ace_medical_bandagedWounds", createHashMap];
private _bandagedWoundsOnPart = _bandagedWounds getOrDefault [_bodyPart, []];

// Get the first stitchable wound from bandaged wounds, or make sure the passed wound exists
private _bandagedIndex = (count _bandagedWoundsOnPart) - 1;
if (_treatedWound isEqualTo []) then {
    _treatedWound = _bandagedWoundsOnPart param [_bandagedIndex, _treatedWound];
} else {
    _bandagedIndex = _bandagedWoundsOnPart find _treatedWound;
};

// Wound doesn't exist or there are no bandaged wounds to stitch
if (_bandagedIndex == -1) exitWith {false};

_treatedWound params ["_treatedID", "_treatedAmountOf", "", "_treatedDamageOf"];

// Remove the wound from bandagedWounds
if (_treatedAmountOf == 1) then {
    _bandagedWoundsOnPart deleteAt _bandagedIndex;
} else {
    _treatedWound set [1, _treatedAmountOf - 1];
};

_treatedAmountOf = 1;

// Check if we need to add a new stitched wound or increase the amount of an existing one
private _stitchedWounds = _patient getVariable ["ace_medical_stitchedWounds", createHashMap];
private _stitchedWoundsOnPart = _stitchedWounds getOrDefault [_bodyPart, [], true];



private _stitchedIndex = _stitchedWoundsOnPart findIf {
    _x params ["_classID"];
    _classID == _treatedID
};

if (_stitchedIndex == -1) then {
    private _stitchedWound = _treatedWound + [];
    _stitchedWound set [1, 1];
    _stitchedWoundsOnPart pushBack (_stitchedWound);
} else {
    private _wound = _stitchedWoundsOnPart select _stitchedIndex;
    _wound set [1, (_wound select 1) + _treatedAmountOf];
};

if (ace_medical_treatment_clearTrauma == 1) then {
    // TRACE_2("trauma - clearing trauma after stitching",_bodyPart,_treatedWound);
    [_patient, _bodyPart, -(_treatedDamageOf * _treatedAmountOf)] call ace_medical_treatment_fnc_addTrauma;
};

_patient setVariable ["ace_medical_bandagedWounds", _bandagedWounds, true];
_patient setVariable ["ace_medical_stitchedWounds", _stitchedWounds, true];

// Check if we fixed limping by stitching this wound (only for leg wounds)
if (
    ace_medical_limping == 2
    && {_patient getVariable ["ace_medical_isLimping", false]}
    && {_bodyPart in ["leftleg", "rightleg"]}
) then {
    // TRACE_3("Updating damage effects",_patient,_bodyPart,local _patient);
    ["ace_medical_engine_updateDamageEffects", _patient, _patient] call CBA_fnc_targetEvent;
};

true // return
