if !(RT_SETTINGS_MOVEMENT_enable_dropBackpack call CBA_Settings_fnc_get) exitWith {};

params ["_unit"];
if (!local _unit) exitWith {};
if (isNull unitbackpack _unit) exitWith {};
if (!isNull (findDisplay 602)) exitWith {};
if !(vehicle _unit == _unit) exitWith {};

[_unit] spawn {
	params ["_unit"];
	sleep 0.2;
	if (_unit getVariable ["TransferBag", false]) exitWith {};
	_unit setVariable ["TransferBag", true];

	if ((!isNull (remoteControlled _unit) || isPlayer _unit)) then {
		if (isNil {_unit getVariable "BackItems"}) then {				
			private _items = backpackItems _unit; 
			_unit setVariable ["BackItems", _items, true];
		} else {
			//_unit call FTAC_UnitRestoreItems;						
		};
	};

	_unit setVariable ["UnitPack", (unitbackpack _unit), true];

	private _isInside = insideBuilding _unit > 0.5;
	private _randomNumber = selectRandom [1, 2, 3, 4, 5, 6];
	private _soundFile = format ["\FTAC_Hardcore_Gear\SFX\prone%1.ogg", _randomNumber];

	playSound3D [_soundFile, objNull, _isInside, _unit modelToWorldWorld [0, 1, -1], 3, 1, 0];
	
	private _backpack = unitbackpack _unit;

	_unit playActionNow "PutDown";

	sleep 0.3;

	_backpack hideObjectGlobal true;
	_unit addBackpack "FTAC_Invisi_bp";
	removeBackpack _unit;	

	sleep 0.2;

	private _NewWeaponHolder = (
		nearestObjects [
			ASLToAGL getPosASL _unit, 
			["WeaponHolder", "WeaponHolderSimulated","WeaponHolderSimulated_Scripted", "GroundWeaponHolder", "GroundWeaponHolder_Scripted"], 
			1.5
		]) param [0, objNull];

	// Pega a posição do modelo da unidade e obtém a altura correta do solo
	private _position = _unit modelToWorldWorld [0, 1.25, 0];
	private _groundLevel = getPosATL _unit select 2;  // Pegamos a altura do solo onde a unidade está

	// Ajusta a altura para garantir que o WeaponHolder fique acima do solo
	_position set [2, _groundLevel];  // 0.1 metro acima do terreno

	_NewWeaponHolder setPosATL _position;		
	_position set [2, 0];
	_NewWeaponHolder setPosATL _position;	
	
	_backpack hideObjectGlobal false;
		

	_unit setVariable ["TransferBag", false]; //--- Enables Open pack action 
};

