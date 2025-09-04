disableSerialization;

//== No dialog, no display or is dedicated server/headless client
if (isNull (findDisplay RT_MEDICAL_ASSSISTANT_VAR_DISPLAY_IDC) || !hasInterface) exitWith {};

private _display = (findDisplay RT_MEDICAL_ASSSISTANT_VAR_DISPLAY_IDC);
private _mainCtrlGroup = (_display displayCtrl 956);
if (isNull _mainCtrlGroup) exitWith {};

params [["_groups", [group player], []]];

private _minCardCount = 12;
private _cardsCount = 0;

private _allControls = [];

[] call RT_Medical_Assistant_fnc_clearControls;

private _allUnits = [];

{
    private _group = _x;
    private _groupIndex = _forEachIndex;

    {
        if (_x != player) then {
            _allUnits pushBack [_x, _group, _groupIndex];
        };
    } forEach (units _group);
} forEach _groups;

diag_log _allUnits;


_allUnits = [_allUnits, [], { ([_x#0] call RT_Utils_fnc_getUnitRoleInfo)#0 }, "ASCEND"] call BIS_fnc_sortBy;

private _groupCardsCount = count _allUnits;

private _XSpot = 0;
private _YSpot = 0;

{
    private _groupCardsCount = 1;
    _allControls append ([_groupCardsCount, _XSpot, _YSpot, _x#2, _x#1] call RT_Medical_Assistant_fnc_initControls);

    _YSpot = _YSpot + floor ((_XSpot + _groupCardsCount) / 3);
    _XSpot = (_XSpot + _groupCardsCount) mod 3;    
} forEach _allUnits;

[_allUnits, _allControls] spawn {
    [missionNamespace, RT_MEDICAL_ASSSISTANT_VAR_MENU_SPAWN] call RT_Utils_fnc_removeScriptHandler;
    [missionNamespace, RT_MEDICAL_ASSSISTANT_VAR_MENU_SPAWN, _this, {
        params ["_allUnits", "_allControls"];
        while {true} do
        {
            if (isNull (findDisplay RT_MEDICAL_ASSSISTANT_VAR_DISPLAY_IDC)) exitWith {
                [missionNamespace, RT_MEDICAL_ASSSISTANT_VAR_MENU_SPAWN] call RT_Utils_fnc_removeScriptHandler;
            };

            private _allControlsCounter = 0;

            {
                private _controls = _x;
                private _index = _forEachIndex;

                private _units = [(_allUnits#_index)#0];

                [_controls, 0, _units] call RT_Medical_Assistant_fnc_renderControl;
            } forEach _allControls;

            uiSleep 0.1;
        };
    }] call RT_Utils_fnc_addScriptHandler;
}
