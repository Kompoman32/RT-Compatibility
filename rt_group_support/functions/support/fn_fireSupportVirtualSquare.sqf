/*
	Author: Vaclav "Watty Watts" Oliva & Kompoman32

	Description:
	Virtual fire support of artillery/mortar unit.

	Parameters:
	Select 0 - ARRAY of parameters as in function BIS_fnc_fireSupportVirtual
	Select 1 - ARRAY: area to bomb (must have length 4 or 5) (0-3: center, a, b, rotation, 4: isRectangle (default: true))
	Select 2 - (OPTIONAL) ARRAY: safe area (must have length 4 or 5) (0-3: center, a, b, rotation, 4: isRectangle (default: true))
	
	Returns:
	Boolean

	Examples:
	_barrage = [[BIS_Player,"Sh_82mm_AMOS",100,24,10], [[0,0,0], 10,10, 0], [0,0,0], 0,0, 0]] spawn RT_Support_fnc_fireSupportVirtualSquare;
	// you can set 5th element in "area to bomb" or "safe area" to false to calculate area as Ellipse
	_barrage = [[BIS_Player,"Sh_82mm_AMOS",100,24,10], [[0,0,0], 10,10, 0, false], [0,0,0], 0,0, 0]] spawn RT_Support_fnc_fireSupportVirtualSquare;
	_barrage = [[[3600,3600,0],nil,100,24,10], (_trigger call BIS_fnc_getArea) select [0, 5]] spawn RT_Support_fnc_fireSupportVirtualSquare;
*/

params [["_virtualSupportParams", [[]]], ["_bombArea", [], [[]]], ["_safeArea", [], [[]]]];

if ((_bombArea isEqualType []) and {!(count _bombArea == 4 or count _bombArea == 5)}) exitWith {["VIRTUAL ARTILLERY SUPPORT: Wrong coordinates %1 for barrage used!",_bombArea] call BIS_fnc_logFormat; false};
if ((_safeArea isEqualType []) and {!(count _safeArea == 0 or count _safeArea == 4 or count _safeArea == 5)}) exitWith {["VIRTUAL ARTILLERY SUPPORT: Wrong coordinates %1 for safe zone for barrage used!",_safeArea] call BIS_fnc_logFormat; false};

_noSafeArea = count _safeArea == 0;

if (!_noSafeArea) then {
	_safeArea = [_safeArea#0, _safeArea#1, _safeArea#2, _safeArea#3, _safeArea param [4, true]];
};

// Params
_virtualSupportParams params
[
	["_position",objNull],
	["_ammo","Sh_82mm_AMOS",[""]],
	["_radius",100],
	["_limit",10,[999]],
	["_delay",10,[999,[]]],
	["_condition",{false},[{}]],
	["_safeZone",0],
	["_altitude",250,[999]],
	["_velocity",150,[999]],
	["_shellSounds",[""],[[]]]
];


// Check for validity
// if ((_position isEqualType "") and {getMarkerType _position == ""}) exitWith {["VIRTUAL ARTILLERY SUPPORT: Non-existent marker %1 for barrage used!",_position] call BIS_fnc_logFormat; false};
// if ((_position isEqualType objNull) and {isNull _position}) exitWith {["VIRTUAL ARTILLERY SUPPORT: Non-existent object %1 for barrage used!",_position] call BIS_fnc_logFormat; false};
// if ((_position isEqualType []) and {count _position != 3}) exitWith {["VIRTUAL ARTILLERY SUPPORT: Wrong coordinates %1 for barrage used!",_position] call BIS_fnc_logFormat; false};
if (_ammo == "") then {_ammo = "Sh_82mm_AMOS"};
if (!(isClass (configFile >> "CfgAmmo" >> _ammo))) exitWith {["VIRTUAL ARTILLERY SUPPORT: Non-existing ammo classname %1 for virtual fire support!",_ammo] call BIS_fnc_logFormat; false};
// if (_radius < 0) exitWith {"VIRTUAL ARTILLERY SUPPORT: radius cannot be lower than 0 meters!" call BIS_fnc_log; false};
if (_limit < 1) exitWith {"VIRTUAL ARTILLERY SUPPORT: At least one round must be fired!" call BIS_fnc_log; false};
if ((_delay isEqualType 999) and {_delay < 0}) exitWith {"VIRTUAL ARTILLERY SUPPORT: Delay cannot be less than 0 seconds!" call BIS_fnc_log; false};
if ((_delay isEqualType []) and {count _delay != 2}) exitWith {"VIRTUAL ARTILLERY SUPPORT: Wrong format of random delay, use [#x,#y]." call BIS_fnc_log; false};
if ((_delay isEqualType []) and {_delay select 0 < 0}) exitWith {"VIRTUAL ARTILLERY SUPPORT: Min delay cannot be less than 0 seconds!" call BIS_fnc_log; false};
if ((_delay isEqualType []) and {_delay select 1 < 0}) exitWith {"VIRTUAL ARTILLERY SUPPORT: Max delay cannot be less than 0 seconds!" call BIS_fnc_log; false};
if ((_delay isEqualType []) and {_delay select 1 < _delay select 0}) exitWith {"VIRTUAL ARTILLERY SUPPORT: Max delay cannot be lower than min delay!" call BIS_fnc_log; false};
// if (_safeZone < 0) exitWith {"VIRTUAL ARTILLERY SUPPORT: Safezone cannot be lower than 0!" call BIS_fnc_log; false};
// if (_safeZone > _radius) exitWith {"VIRTUAL ARTILLERY SUPPORT: Safezone cannot be bigger than radius!" call BIS_fnc_logFormat; false};
if (_altitude < 0) exitWith {"VIRTUAL ARTILLERY SUPPORT: Altitude cannot be lower than 0m!" call BIS_fnc_logFormat; false};


// Private variables, set roundsFired to 0
private ["_roundsFired","_targetPos","_finalPos","_marker","_shell","_minDelay","_maxDelay","_finalDelay"];
_roundsFired = 0;

// Handle delays
if (_delay isEqualType 999) then {_minDelay = _delay; _maxDelay = _delay};
if (_delay isEqualType []) then {_minDelay = _delay select 0; _maxDelay = _delay select 1};

// Log the action
// ["VIRTUAL ARTILLERY SUPPORT: target: %1 ammo: %2 limit: %3",_bombArea, _ammo, _limit] call BIS_fnc_logFormat;

// Fire support
while
{
	(_roundsFired < _limit)
}
do
{
	// if the condition is triggered, stop the barrage
	if (!(isNil _condition) and (_condition)) exitWith {/*["VIRTUAL ARTILLERY SUPPORT: Condition to end bombardment activated."] call BIS_fnc_log*/};

	// Getting the position - done each time to be able to track moving targets
	if (_bombArea isEqualType []) then {_targetPos = _bombArea};

	_finalPos = _targetPos;

	// Selecting the final position where the AI should fire
	// _finalPos = [_targetPos,(random (_radius - _safeZone)) + _safeZone, random 360] call BIS_fnc_relPos;

	// if we cant find prefered location for 100000 iterations we will stop
	_errorCounter = 0;

	while {true} do {
		_finalPos = [_targetPos#0, _targetPos#1, _targetPos#2, _targetPos#3, _targetPos param [4, true]] call BIS_fnc_randomPosTrigger;

		if (_errorCounter > 10000) then { break; };
		
		if (_noSafeArea) then {
			break;
		};

		if (!(_finalPos inArea _safeArea)) then {
			break;
		};

		_errorCounter = _errorCounter + 1;
	};

	if (_errorCounter > 10000) then { break; };

	_shell = _ammo createVehicle [_finalPos select 0, _finalPos select 1, _altitude];
	_shell setVectorUp [0,0,-1];
	_shell setVelocity [0,0,-(abs _velocity)];
	_roundsFired = _roundsFired + 1;

	if !(_shellSounds isEqualTo [""]) then {[_shell,(selectRandom _shellSounds)] remoteExec ["say3D"]};

	_finalDelay = _minDelay + (random (_maxDelay - _minDelay));
	sleep _finalDelay;
};

// if !(_roundsFired < _limit) then {["VIRTUAL ARTILLERY SUPPORT: Fire mission finished, shell limit:%1 reached.",_limit] call BIS_fnc_logFormat};

// Return
true

