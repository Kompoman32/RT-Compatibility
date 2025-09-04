params ["_displayorcontrol", "_key"];

/**
* https//community.bistudio.com/wiki/DIK_KeyCodes
* F1 - F6
*/
    
if (_key isEqualto 0x3B) exitwith {
    0 spawn RT_Medical_Assistant_fnc_onGroupButtonClick;
};

if (_key isEqualto 0x3C) exitwith {
    1 spawn RT_Medical_Assistant_fnc_onGroupButtonClick;
};

if (_key isEqualto 0x3D) exitwith {
    2 spawn RT_Medical_Assistant_fnc_onGroupButtonClick;
};

if (_key isEqualto 0x3E) exitwith {
    3 spawn RT_Medical_Assistant_fnc_onGroupButtonClick;
};

if (_key isEqualto 0x3F) exitwith {
    4 spawn RT_Medical_Assistant_fnc_onGroupButtonClick;
};

if (_key isEqualto 0x40) exitwith {
    5 spawn RT_Medical_Assistant_fnc_onGroupButtonClick;
};

if (_key isEqualto 0x29) exitwith {
    -1 spawn RT_Medical_Assistant_fnc_onGroupButtonClick;
};