params ["_displayorcontrol", "_key"];
 
/**
* https//community.bistudio.com/wiki/DIK_KeyCodes
* F1 - F6
*/

if (_key in [0x3B, 0x3C, 0x3D, 0x3E, 0x3F, 0x40, 0x29]) exitWith {
    true
};

false