params ["_unitFrom", "_unitTo", ["_debug", false]];

private _validSide = [_unitTo] call RT_SpotSystem_fnc_canSeeBySide;

if (!_validSide) exitWith {false};

if !(([_unitFrom, "VIEW", vehicle _unitTo] checkVisibility [eyePos _unitFrom, eyePos _unitTo]) > 0.8) exitWith {false};

_unitTo = vehicle _unitTo;

private _camDir = getCameraViewDirection _unitFrom;
private _relDir = (getPosASL _unitFrom) vectorFromTo (eyePos _unitTo);
private _angle = acos (_camDir vectorDotProduct _relDir);
private _maxAngle = 58;

if (abs _angle >= _maxAngle) exitWith {false};


if (isPlayer _unitFrom && _unitFrom == player) then {
	_center = _unitTo modelToWorldVisual (_unitTo selectionPosition "head_axis");

	if (_unitTo isKindOf "Man") then {
		_positionHead = [_unitTo, "Head"] call RT_SpotSystem_fnc_drawEventGetCords;
		_positionPelvis = [_unitTo, "Pelvis"] call RT_SpotSystem_fnc_drawEventGetCords;
		_center = ((_positionHead vectorDiff _positionPelvis) vectorMultiply 1/2) vectorAdd _positionPelvis;
	};

	_cordOnScreen = worldToScreen _center;

	if (_debug) then {systemChat str RT_SPOTSYS_AllSpottedTargets};
	if (_cordOnScreen isEqualTo []) exitWith {false};
	if ((_cordOnScreen#0) > (safeZoneW + safeZoneX + 0.2) || (_cordOnScreen#0) < (safeZoneX - 0.2)) exitWith {false};
	if ((_cordOnScreen#1) > (safeZoneH + safeZoneY + 0.2) || (_cordOnScreen#1) < (safeZoneY - 0.2)) exitWith {false};
	true
} else {true}