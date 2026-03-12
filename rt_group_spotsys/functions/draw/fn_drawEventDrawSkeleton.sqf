params ["_unit", "_color", "_imageSize", "_textSize"];

_positionHead = [_unit, "Head"] call RT_SpotSystem_fnc_drawEventGetCords;
_positionNeck = [_unit, "Neck"] call RT_SpotSystem_fnc_drawEventGetCords;
_positionSpine3 = [_unit, "Spine3"] call RT_SpotSystem_fnc_drawEventGetCords;
_positionSpine3_1 = [(_positionNeck#0 - _positionSpine3#0)/2 + _positionSpine3#0, (_positionNeck#1 - _positionSpine3#1)/2 + _positionSpine3#1, (_positionNeck#2 - _positionSpine3#2)/2 + _positionSpine3#2];
_positionSpine3_2 = [(_positionNeck#0 - _positionSpine3#0)/2 + _positionSpine3#0, (_positionNeck#1 - _positionSpine3#1)/2 + _positionSpine3#1, (_positionNeck#2 - _positionSpine3#2)/2 + _positionSpine3#2];
_positionSpine2 = [_unit, "Spine2"] call RT_SpotSystem_fnc_drawEventGetCords;
_positionSpine1 = [_unit, "Spine1"] call RT_SpotSystem_fnc_drawEventGetCords;
_positionPelvis = [_unit, "Pelvis"] call RT_SpotSystem_fnc_drawEventGetCords;
_positionPelvis_1 = [_unit, "Pelvis"] call RT_SpotSystem_fnc_drawEventGetCords;
_positionPelvis_2 = [_unit, "Pelvis"] call RT_SpotSystem_fnc_drawEventGetCords;

// _positionLeftShoulder = _unit modelToWorldVisual (_unit selectionPosition "LeftShoulder");
_positionLeftArm = [_unit, "LeftArm"] call RT_SpotSystem_fnc_drawEventGetCords;
_positionLeftForeArm = [_unit, "LeftForeArm"] call RT_SpotSystem_fnc_drawEventGetCords;
_positionLeftHand = [_unit, "LeftHand"] call RT_SpotSystem_fnc_drawEventGetCords;

// _positionRightShoulder = _unit modelToWorldVisual (_unit selectionPosition "RightShoulder");
_positionRightArm = [_unit, "RightArm"] call RT_SpotSystem_fnc_drawEventGetCords;
_positionRightForeArm = [_unit, "RightForeArm"] call RT_SpotSystem_fnc_drawEventGetCords;
_positionRightHand = [_unit, "RightHand"] call RT_SpotSystem_fnc_drawEventGetCords;

_positionLeftUpLeg = [_unit, "LeftUpLeg"] call RT_SpotSystem_fnc_drawEventGetCords;
_positionLeftLeg = [_unit, "LeftLeg"] call RT_SpotSystem_fnc_drawEventGetCords;
_positionLeftFoot = [_unit, "LeftFoot"] call RT_SpotSystem_fnc_drawEventGetCords;

_positionRightUpLeg = [_unit, "RightUpLeg"] call RT_SpotSystem_fnc_drawEventGetCords;
_positionRightLeg = [_unit, "RightLeg"] call RT_SpotSystem_fnc_drawEventGetCords;
_positionRightFoot = [_unit, "RightFoot"] call RT_SpotSystem_fnc_drawEventGetCords;

// _positionHead0 = _positionNeck + [];
// _positionHead1 = _positionHead0 + [];

_head = [];
_spine = [_positionNeck, _positionSpine3, _positionPelvis];
_leftArm = [_positionSpine3_1, _positionLeftArm, _positionLeftForeArm, _positionLeftHand];
_rightArm = [_positionSpine3_2, _positionRightArm, _positionRightForeArm, _positionRightHand];
_leftFoot = [_positionPelvis_1, _positionLeftUpLeg, _positionLeftLeg, _positionLeftFoot];
_rightFoot = [_positionPelvis_2, _positionRightUpLeg, _positionRightLeg, _positionRightFoot];

{
	_previous = _unit#0;

	{

		// _unit set[0,(_unit select 0)+0.7];
		// _unit set[1,(_unit select 1)+0.7];
		if (_forEachIndex == 0) then {continue};

		[_previous, _unit, _color, [2,2], 0.02825] call RT_SpotSystem_fnc_drawEventDraw;

		_previous = _unit
	} forEach _unit;
} forEach [_head, _spine, _leftArm, _rightArm,  _leftFoot, _rightFoot];