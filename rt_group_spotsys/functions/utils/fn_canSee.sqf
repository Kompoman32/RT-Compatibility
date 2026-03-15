params ["_unitFrom", "_unitTo", ["_debug", false]];

private _valid = [_unitTo] call RT_SpotSystem_fnc_canSeeBySide;

if (!_valid) exitWith {false};

_minVisibility = 0.8;
_visibility =  ([_unitFrom, "VIEW", vehicle _unitTo] checkVisibility [eyePos _unitFrom, eyePos _unitTo]);

if ([_unitTo] call RT_SPOTSYSTEM_fnc_isGrenade) then {
	_minVisibility = 0.2;
};

if (_visibility < _minVisibility) exitWith {false};

_unitTo = vehicle _unitTo;

private _camDir = getCameraViewDirection _unitFrom;
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