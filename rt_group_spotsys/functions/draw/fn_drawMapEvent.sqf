_vehicleList = [];
{
	_pos = vehicle _x modelToWorldVisual [0, 0, 0];
	_unit = driver vehicle _x;
	if (_unit isEqualTo objNull) then {
		_unit = _x;
	};
	_dir = getDirVisual _x;
	_text = (name _x);
	_distance = player distance _x;
	_textSize = 0.04;
	_textSize2 = 0.05;

	_alpha = 1;
	_color = switch (side group _x) do
	{
		case west: {
			[0, 0.3, 0.6, _alpha]
		};
		case east: {
			[0.5, 0, 0, _alpha]
		};
		case independent: {
			[0, 0.5, 0, _alpha]
		};
		case civilian: {
			[0.4, 0, 0.5, _alpha]
		};
		default {
			[0.7, 0.6, 0, _alpha]
		};
	};

	comment "show name";
	_pos2D = (_this select 0) ctrlMapWorldToScreen _pos;
	_posCursor2D = getMousePosition;
	_dist = _pos2D distance2D _posCursor2D;
	_scale = ctrlMapScale (_this select 0);

	comment "check if man";
	if (_x isKindOf "Man") then {
		if (vehicle _x != _x) exitWith {};

		comment "text";
		_text = getText(configfile >> "CfgVehicles" >> typeOf _x >> "displayName");
		if ((_dist > RT_SPOTSYS_SpotMaxCursorRangeUnitMarker)) then {
			_text = "";
		};
		if (_scale > RT_SPOTSYS_SpotMinMapZoomUnitMarker) then {
			_textSize = _textSize2;
		};

		comment "text outline";
		_this select 0 drawIcon
		[
			"\A3\ui_f\data\Map\VehicleIcons\iconManVirtual_ca.paa",
			_color,
			_pos,
			20,
			20,
			_dir,
			_text,
			2,
			_textSize,
			"RobotoCondensedBold",
			"left"
		];

		comment "marker outline";
		_this select 0 drawIcon
		[
			"\A3\ui_f\data\Map\VehicleIcons\iconManVirtual_ca.paa",
			_color,
			_pos,
			20,
			20,
			_dir,
			_text,
			1,
			_textSize,
			"RobotoCondensedBold",
			"left"
		];
	} else {
		if (_x isKindOf "Man") exitWith {};

		_dir = getDirVisual _x;
		_pos = _x modelToWorldVisual [0, 0, 0];

		comment "file";
		_className = (typeOf _x);
		_file = getText (configfile >> "CfgVehicles" >> _className >> "icon");

		comment "text";
		_vehName = getText (configfile >> "CfgVehicles" >> _className >> "displayName");
		_text = _vehName;

		if ((_dist > RT_SPOTSYS_SpotMaxCursorRangeUnitMarker)) then {
			_text = "";
		};
		if (_scale > RT_SPOTSYS_SpotMinMapZoomUnitMarker) then {
			_textSize = _textSize2;
		};

		comment "text outline";
		_this select 0 drawIcon
		[
			_file,
			_color,
			_pos,
			20,
			20,
			_dir,
			_text,
			2,
			_textSize,
			"RobotoCondensedBold",
			"left"
		];

		comment "marker outline";
		_this select 0 drawIcon
		[
			_file,
			_color,
			_pos,
			20,
			20,
			_dir,
			_text,
			1,
			_textSize,
			"RobotoCondensedBold",
			"left"
		];
	};
} forEach RT_SPOTSYS_AllSpottedTargets;