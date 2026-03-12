
{ 
	comment "Check if visible in line of sight"; 
	_unit = driver vehicle _x; 
	_vehicle = vehicle _x; 

	if(_unit isEqualTo objNull) then {_unit = _vehicle;}; 

	_cansee = [player, _vehicle] call RT_SpotSystem_fnc_canSee;

	if (_cansee || (RT_SETTINGS_SPOTSYSTEM_show_through_wall call CBA_settings_fnc_get)) then {
		[_vehicle] call RT_SpotSystem_fnc_drawEventDrawIcon;
	}; 

	// _textSize = 0.02825 / 1.2; 
	// _imageSize = [4,4];

	// _file = "\a3\ui_f\data\gui\rsc\RscDisplayEGSpectator\UnitIcon_ca.paa"; 
	// drawIcon3D [_file,_color,_positionHeadAxis, _imageSize select 0,_imageSize select 1, 0,(""), 2, _textSize, "RobotoCondensedBold","center",false]; 


} forEach RT_SPOTSYS_AllSpottedTargets; 
