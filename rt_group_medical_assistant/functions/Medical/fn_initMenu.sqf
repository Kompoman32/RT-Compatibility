disableSerialization;

//== No dialog, no display or is dedicated server/headless client
if (isNull (findDisplay RT_MEDICAL_ASSSISTANT_VAR_DISPLAY_IDC) || !hasInterface) exitWith {};

private _display = (findDisplay RT_MEDICAL_ASSSISTANT_VAR_DISPLAY_IDC);
private _mainCtrlGroup = (_display displayCtrl 956);
if (isNull _mainCtrlGroup) exitWith {};

params [["_group", objNull, []]];

private _units = [];
if (isNil "_group") then {
    _group = objNull;
};

if !(isNull _group) then {
    _units = units _group
};


private _minCardCount = 12;
private _cardsCount = _minCardCount max (count _units);

if (_cardsCount > _minCardCount) then {
    _cardsCount = _minCardCount + ceil ((_cardsCount - _minCardCount) / 3) * 3;
};

[] call RT_Medical_Assistant_fnc_clearControls;

private _controls = [_cardsCount] call RT_Medical_Assistant_fnc_initControls;

[_units, _controls] spawn {
    [missionNamespace, RT_MEDICAL_ASSSISTANT_VAR_MENU_SPAWN] call RT_Utils_fnc_removeScriptHandler;
    [missionNamespace, RT_MEDICAL_ASSSISTANT_VAR_MENU_SPAWN, _this, {
        params ["_units", "_controls"];
        while {true} do
        {
            if (isNull (findDisplay RT_MEDICAL_ASSSISTANT_VAR_DISPLAY_IDC)) exitWith {
                [missionNamespace, RT_MEDICAL_ASSSISTANT_VAR_MENU_SPAWN] call RT_Utils_fnc_removeScriptHandler;
            };

            {
                [_x, _forEachIndex, _units] call RT_Medical_Assistant_fnc_renderControl;
            } forEach _controls;

            uiSleep 0.1;
        };
    }] call RT_Utils_fnc_addScriptHandler;
}
