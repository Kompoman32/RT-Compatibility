private _time = call ace_medical_treatment_fnc_getBandageTime;

private _bandage = param [3, ""];

if (_bandage == 'BasicBandage') then {
    _bandage = 'FieldDressing';
};

private _multiplier = (format ["%1_%2", RT_SETTINGS_MEDICAL, _bandage]) call CBA_settings_fnc_get;

if (typename _multiplier != typename 0) then { _multiplier = 1 };

(_multiplier * _time) max 2.25