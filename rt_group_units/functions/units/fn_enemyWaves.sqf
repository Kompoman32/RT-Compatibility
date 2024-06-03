/*
	Authors: Voxtell & Kompoman32

	Description:
		Randomly generates enemy squad around unit (randomly choosen) and sends them to unit group location.

	Parameters:
		_availableTargets - Available units to hunting (type: Object)
		_endless - Generating squads endlessly (generate new squad after previous killed (except 1 unit)) (type: Boolean)
		_safeRadius - Radius to generate squad (type: Number)
		_maxHuntingDistance - Distance to target after wich squad will delete to prevent long pathings (type: Number)
		_groupOptions - Options to function BIS_fnc_spawnGroup
			_groupSide = side
			_enemy = toSpawn
			_groupRanks = ranks
			_groupSkillRange = skillRange
			_groupAmmoRange = ammoRange
			_groupRandomControls = randomControls
			_groupAzimuth = azimuth
			_groupPrecisePos = precisePos
			_groupMaxVehicles = maxVehicles
		_processGroupCode - code that will be executed on the created squad (type: Code)
			params:
				_this - created squad

	Execution:
		spawn on Server
		(just in case it wiil check the environment and executed it on needed environment)

	Examples:
		[] call RT_Units_fnc_enemyWaves;

		[allPlayers, false, 500, 1000, [], { _this setSpeedMode "NORMAL" }] call RT_Units_fnc_enemyWaves;

		[allPlayers, nil, 700, nil, nil, { _this setSpeedMode "NORMAL" }] call RT_Units_fnc_enemyWaves;
*/

// run on Server in Sheduled
if ([_this, true, true] call RT_Utils_fnc_callByScriptName) exitWith {};

missionNamespace setVariable [RT_UNITS_VAR_ENEMY_WAVES_HANDLER, _thisScript];

params [
	["_availableTargets", [] call RT_Utils_fnc_getAllPlayersWithoutCurators],
	["_endless", false],
	["_safeRadius", 200],
	["_maxHuntingDistance", 550],
	["_groupOptions", []],
	["_processGroupCode", {
		private _group = _this;

		{
			_x setSkill [ "general", 1 ];
			_x setSkill [ "courage", 1 ];
			_x setSkill [ "aimingAccuracy", 0.15 ];
			_x setSkill [ "aimingShake", 1 ];
			_x setSkill [ "aimingSpeed", 1 ];
			_x setSkill [ "commanding", 1 ];
			_x setSkill [ "spotDistance", 1 ];
			_x setSkill [ "spotTime", 1 ];
			_x setSkill [ "reloadSpeed", 1 ];
			_x setUnitPos "UP";
			_x disableAI "AUTOCOMBAT";
			_x allowFleeing 0;

		} forEach ( units _group );

		_group setSpeedMode "NORMAL";
		_group setFormation "FILE";
	}]
	];

if (count _availableTargets == 0) exitWith {
	diag_log text "[RT_GROUP] WARNING: RT_Units_fnc_enemyWaves called with no _availableTargets";
};

_groupOptions params [
	["_groupSide", east],
	["_enemy", configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfTeam"],
	["_groupRanks", []],
	["_groupSkillRange", [0.2, 0.3]],
	["_groupAmmoRange", []],
	["_groupRandomControls", [-1,1]],
	["_groupAzimuth", 0],
	["_groupPrecisePos", true],
	["_groupMaxVehicles", 10e10]	
];

private _target = selectRandom _availableTargets;
private _pos = getpos _target;
private _positionDir = random 360;

private _positions = [ (_pos select 0) + (sin _positionDir) * _safeRadius, (_pos select 1) + (cos _positionDir) * _safeRadius, 0 ];

private _newGrp = [ _positions, _groupSide, _enemy, [], _groupRanks, _groupSkillRange, _groupRandomControls, _groupAzimuth, _groupPrecisePos, _groupMaxVehicles] call BIS_fnc_spawnGroup;
sleep 0.1;

_newGrp call _processGroupCode;

private _stalk 		= 	[_newGrp, group _target] spawn RT_Units_fnc_stalkF;
{_x addCuratorEditableObjects [ units _newGrp, true ]} forEach allCurators;

sleep 5;

private _teamLead = leader _newGrp;
// Checking if there is nobody to hunt
if ( speed _teamLead == 0 ) exitWith { { deleteVehicle _x } forEach units _newGrp; };
// Checking if hunters in water
if ( surfaceIsWater position _teamLead ) exitWith { { deleteVehicle _x } forEach units _newGrp; };

while { ({ alive _x } count units _newGrp) > 1 } do { 
	
	if (scriptDone _stalk) then {
		_target = selectRandom _availableTargets;
		if (alive _target) then {
			_stalk = [_newGrp, group _target] spawn RT_Units_fnc_stalkF; 
		};

		continue;
	};

	if (_target distance _teamLead > _maxHuntingDistance) then {
		{ deleteVehicle _x } forEach units _newGrp; 
		break;
	};

	sleep 10;
};

if (_endless) then {
	_this spawn RT_Units_fnc_enemyWaves;
}