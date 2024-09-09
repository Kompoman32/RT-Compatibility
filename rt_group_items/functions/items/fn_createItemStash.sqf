/**
  * Creates items on the position of the initialized object or with position and direction.
  * 
  * 0: _obj - object to get postition and direction (or position and direction => [x, y, z, direction])
  * 1: _items - array of items with count:
  *      _itemName   - name of item (ex: "30Rnd_65x39_caseless_mag")
  *      _itemCount  - count of items
  *      _isBackpack - is backpack (use it for adding backpacks, default: false)
  * 
  * Examples:
  * 
  * [this,
  *     [
  *         ["30Rnd_65x39_caseless_mag", 5],
  *         ["Item_U_Rangemaster", 1],
  *         ["B_Carryall_ocamo", 2, true]
  *     ]
  * ] call RT_Items_fnc_createItemStash;
  * 
  * Written by Kompoman32
  * Designed by Voxtell
  */

// run on Server in Sheduled
if ([_this, true, false] call RT_Utils_fnc_callByScriptName) exitWith {};

params ["_obj", "_items"];

private _loot = "groundweaponholder" createVehicle getPos _obj;

private _posAndDir = _obj;

if (typeName _obj != "ARRAY") then {
    private _pos = getPosATL _obj;
   _posAndDir = [_pos#0, _pos#1, _pos#2, getDir _obj];
};

_posAndDir params ["_posX", "_posY", "_posZ", "_dir"];

{
    _x params ["_itemName", "_itemCount", ["_isBackpack", false]];
    
    if (_isBackpack) then {
        _loot addbackpackCargoGlobal [_itemName, _itemCount];
    } else {
        _loot additemCargoGlobal [_itemName, _itemCount];
    };
    
    _loot setDir _dir;
    _loot setPosATL [_posX, _posY, _posZ];
} forEach _items;

deleteVehicle _obj;

{
    _x addCuratorEditableObjects [[_loot], true]
} count allCurators;