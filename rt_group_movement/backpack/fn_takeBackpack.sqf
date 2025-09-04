if !(RT_SETTINGS_MOVEMENT_enable_dropBackpack call CBA_Settings_fnc_get) exitWith {};

params ["_unit"];
if (!local _unit) exitWith {};
if (!isNull (findDisplay 602)) exitWith {};
if !(vehicle _unit == _unit) exitWith {};
if !(isNull (unitbackpack _unit)) exitWith {};

[_unit] spawn {
	sleep 0.2;

	params ["_unit"];

	if (_unit getVariable ["TransferBag", false]) exitWith {};
	// waitUntil {!(_unit getVariable ["TransferBag", false])};
	_unit setVariable ["TransferBag", true]; //--- Makes pack quick actions waitUntil this one is done

	private _wpHolders = nearestObjects [
							ASLToAGL getPosASL _unit, 
							["WeaponHolder", "WeaponHolderSimulated","WeaponHolderSimulated_Scripted", "GroundWeaponHolder", "GroundWeaponHolder_Scripted"], 
							3.0
						];

	if (count _wpHolders == 0) exitWith {
		_unit setVariable ["TransferBag", false]; //--- Makes pack quick actions waitUntil this one is done
	};

	private _savedPack = _unit getVariable ["UnitPack", objNull];
	private _pack = objNull;

	// one wh one backpack
	if (count _wpHolders == 1 && (count (everyBackpack (_wpHolders#0)) == 1)) then {
		_pack = (everyBackpack (_wpHolders#0))#0;
	} else {
		for "_i" from 0 to (count _wpHolders) do {
			if (_savedPack in (everyBackpack (_wpHolders # _i))) exitWith {
				_pack = _savedPack;
			}
		};
	};

	if (isNull _pack) then {
		for "_i" from 0 to (count _wpHolders) do {
			private _every = everyBackpack (_wpHolders # _i);
			if (count _every > 0) exitWith {
				_pack = _every#0;
			}
		};
	};

	if (isNull _pack) exitWith {
		_unit setVariable ["TransferBag", false]; //--- Makes pack quick actions waitUntil this one is done
	};


	_unit action ["TakeBag", _pack];
	_unit setVariable ["UnitPack", _pack, true];
				
	private _isInside = insideBuilding _unit > 0.5;
	private _randomNumber = selectRandom [1, 2];
	private _soundFile = format ["\FTAC_Hardcore_Gear\SFX\pack%1.ogg", _randomNumber];
	sleep 0.5;
	playSound3D [_soundFile, objNull, _isInside, _unit modelToWorldWorld [0, 1, -1], 3, 1, 0];

	waitUntil {!isNull unitbackpack _unit};
	_unit setVariable ["TransferBag", false]; //--- Makes pack quick actions waitUntil this one is done
}

