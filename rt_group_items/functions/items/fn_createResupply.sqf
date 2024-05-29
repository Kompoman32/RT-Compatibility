// isNill _ammoBox
if (isNil {_this select 0}) exitWith {};

// run on Server in Sheduled
if ([_this, true, true] call RT_Utils_fnc_callByScriptName) exitWith {};

params ["_ammoBox", ["_numPrim", 10], ["_numHand", 2], ["_numSec", 2], ["_numUndBar", 2]];

private _players = [] call CBA_fnc_players;
{
	(primaryWeaponMagazine _x) params [["_primaryWeaponMagazine", ""], ["_primaryWeaponUndBarMagazine", ""]];
	(secondaryWeaponMagazine _x) params [["_secondaryWeaponMagazine", ""]];
	(handgunMagazine _x) params [["_handgunMagazine", ""]];

	{
		_x params ["_magName", "_num"];
		if (!(_magName isEqualTo "")) then {
			_ammoBox addMagazineCargoGlobal [_magName, _num]
		}
	} forEach [
		[_primaryWeaponMagazine, _numPrim],
		[_primaryWeaponUndBarMagazine, _numUndBar],
		[_secondaryWeaponMagazine, _numSec],
		[_handgunMagazine, _numHand]
	];
} forEach _players;
