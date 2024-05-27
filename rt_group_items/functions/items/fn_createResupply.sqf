
_this spawn { 
	params ["_ammoBox", ["_numPrim", 10], ["_numHand", 2], ["_numSec", 2], ["_numUndBar", 2]];
	
	if (isNil "_ammoBox") exitWith {};

	if (!isServer) exitWith {
		[_ammoBox, _numPrim, _numHand, _numSec, _numUndBar] remoteExec ["RT_Items_fnc_CreateResupply", 2, false];
	};

	sleep 1; 

	private _players = [] call CBA_fnc_players;
	{
		private _primaryWeaponMagazine = (primaryWeaponMagazine _x) select 0;
		private _primaryWeaponUndBarMagazine = (primaryWeaponMagazine _x) select 1;
		private _secondaryWeaponMagazine = (secondaryWeaponMagazine _x) select 0;
		private _handgunMagazine = (handgunMagazine _x) select 0;

		{
			_x params ["_slot", "_num"];
			if (!(isNil "_slot")) then {
				_ammoBox addMagazineCargoGlobal [_x, _num]
			}
		} forEach [
			[_primaryWeaponMagazine, _numPrim],
			[_primaryWeaponUndBarMagazine, _numUndBar],
			[_secondaryWeaponMagazine, _numSec],
			[_handgunMagazine, _numHand]
		];
	} forEach _players;
};