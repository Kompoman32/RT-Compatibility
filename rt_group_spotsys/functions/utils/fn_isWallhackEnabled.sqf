if !(RT_SETTINGS_SPOTSYSTEM_WALLHACK_enable call CBA_settings_fnc_get) exitWith {false};

if (!hasInterface) exitWith {true};

private _requiredItem = RT_SETTINGS_SPOTSYSTEM_WALLHACK_required_item call CBA_settings_fnc_get;

if (_requiredItem == "") exitWith {true};

private _requireEquipped = RT_SETTINGS_SPOTSYSTEM_WALLHACK_required_item_equipped call CBA_settings_fnc_get;

if ((_requiredItem in (assignedItems [player, true, true])) ||
	(_requiredItem in primaryWeaponMagazine player) ||
	(_requiredItem in secondaryWeaponMagazine player) ||
	(_requiredItem in (handgunMagazine player)) ||
	(_requiredItem in (handgunItems player)) ||
	(_requiredItem in (primaryWeaponItems player)) ||
	(_requiredItem in (secondaryWeaponItems player))
) exitWith {true};

if !(_requireEquipped) exitWith {
	[player, _requiredItem, true] call ace_common_fnc_hasItem
};

false
