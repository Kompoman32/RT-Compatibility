/*
    Description: Создаёт стэш с предметами на позиции инициализированного объекта, устанавливает то же положение и поворот 
    Author: Kompoman32 & Voxtell
    Made for: RT group

    Arguments:
    0: _posOrObj - объект для получения позиции и поворота (или позиция и направление [x, y, z, direction])
    1: _items - список предметов для спавна (массив [_itemName, _itemCount, _isBackpack]): 
        0: _itemName   - название предмета (пример: "30Rnd_65x39_caseless_mag")
        1: _itemCount  - колличество предметов
        2: _isBackpack - является ли рюкзаком (используется для добавления рюкзаков, default: false)
    
    Examples:
    * [_posOrObj,
        [
          ["30Rnd_65x39_caseless_mag", 5],
          ["Item_U_Rangemaster", 1],
          ["B_Carryall_ocamo", 2, true]
        ]
      ] call RT_Items_fnc_createItemStash;
*/

if (!isServer) exitWith {
    diag_log "[E] RT_Items_fnc_createItemStash : cant spawn items stash on client, please execute it on Server";
}

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