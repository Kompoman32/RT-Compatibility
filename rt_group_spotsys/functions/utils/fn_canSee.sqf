params ["_unitFrom", "_unitTo", ["_debug", false]];

if (_unitTo in RT_SPOTSYS_NonSpottableTargets) exitWith {false};

private _valid = [_unitTo] call RT_SpotSystem_fnc_canSeeBySide;

if (!_valid) exitWith {false};

// CHeck UAV
_uav = getConnectedUAV _unitFrom;
_isUavDriver = false;
_isUavGunner = false;

if (RT_SETTINGS_SPOTSYSTEM_check_uav call CBA_settings_fnc_get) then {
	_uavControl = UAVControl (_uav);

	if (_uavControl#0 == _unitFrom && _uavControl#1 == "DRIVER") then {
		_isUavDriver = true;
	};

	if (_uavControl#0 == _unitFrom && _uavControl#1 == "GUNNER") then {
		_isUavGunner = true;
	};

	if ((count _uavControl) > 2) then {
		if (_uavControl#2 == _unitFrom && _uavControl#3 == "DRIVER") then {
			_isUavDriver = true;
		};

		if (_uavControl#2 == _unitFrom && _uavControl#3 == "GUNNER") then {
			_isUavGunner = true;
		};
	};

	if (_isUavDriver || _isUavGunner) then {
		_unitFrom = _uav;	
	} else {
		_uav = objNull;
	};
} else {
	_uav = objNull;
};

// Check basic visibility
_minVisibility = 0.8;
_visibility =  ([_unitFrom, "VIEW", vehicle _unitTo] checkVisibility [eyePos _unitFrom, eyePos _unitTo]);

if ([_unitTo] call RT_SPOTSYSTEM_fnc_isGrenade) then {
	_minVisibility = 0.2;
};

if (_visibility < _minVisibility) exitWith {false};

_unitTo = vehicle _unitTo;

private _camDir = getCameraViewDirection _unitFrom;

if (_isUavGunner) then {
	_camDir = _uav weaponDirection (currentWeapon _uav);
};

private _relDir = (getPosASL _unitFrom) vectorFromTo (eyePos _unitTo);
private _angle = acos (_camDir vectorDotProduct _relDir);
private _maxAngle = 58;

if (abs _angle >= _maxAngle) exitWith {false};


if (_unitFrom == player) then {
	_center = [_unitTo, "head_axis"] call RT_SpotSystem_fnc_drawEventGetCords;

	if (_unitTo isKindOf "Man") then {
		_positionHead = [_unitTo, "Head"] call RT_SpotSystem_fnc_drawEventGetCords;
		_positionPelvis = [_unitTo, "Pelvis"] call RT_SpotSystem_fnc_drawEventGetCords;
		_center = ((_positionHead vectorDiff _positionPelvis) vectorMultiply 1/2) vectorAdd _positionPelvis;
	};

	if ([_unitTo] call RT_SPOTSYSTEM_fnc_isGrenade) then {
		_center = [_unitTo, "grenade"] call RT_SpotSystem_fnc_drawEventGetCords;
	};

	_cordOnScreen = worldToScreen _center;

	if (_debug) then {systemChat str RT_SPOTSYS_AllSpottedTargets};
	if (_cordOnScreen isEqualTo []) exitWith {false};
	if ((_cordOnScreen#0) > (safeZoneW + safeZoneX + 0.2) || (_cordOnScreen#0) < (safeZoneX - 0.2)) exitWith {false};
	if ((_cordOnScreen#1) > (safeZoneH + safeZoneY + 0.2) || (_cordOnScreen#1) < (safeZoneY - 0.2)) exitWith {false};
	true
} else {true}