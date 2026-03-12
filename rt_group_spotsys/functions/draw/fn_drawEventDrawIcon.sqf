params ["_unit"];

_positionHeadAxis = _unit modelToWorldVisual (_unit selectionPosition "head_axis");
// _positionHeadAxis set[2,(_positionHeadAxis select 2)+0.5];

_distance = (player) distance (_positionHeadAxis); 

_dif = ((getObjectViewDistance select 0)-_distance); 
_alpha = (_dif/(getObjectViewDistance select 0)); 

if(vehicle _unit isEqualTo cursorObject) then {_alpha = 1;}; 
if (_distance >= (getObjectViewDistance select 0)) then {_alpha = 0;}; 

_color = switch (side group _unit) do 
{ 
	case west: {[0,0.3,0.6,_alpha]}; 
	case east: {[0.5,0,0,_alpha]}; 
	case independent: {[0,0.5,0,_alpha]}; 
	case civilian: {[0.4,0,0.5,_alpha]}; 
	default {[0.7,0.6,0,_alpha]}; 
};

_center = _positionHeadAxis;

if (_unit isKindOf "Man") then {
	_positionHead = [_unit, "Head"] call RT_SpotSystem_fnc_drawEventGetCords;
	_positionPelvis = [_unit, "Pelvis"] call RT_SpotSystem_fnc_drawEventGetCords;
	_center = ((_positionHead vectorDiff _positionPelvis) vectorMultiply 1/2) vectorAdd _positionPelvis;
};

// _cordOnScreen = worldToScreen _center;

// if (_cordOnScreen isEqualTo []) exitWith {};
// if ((_cordOnScreen#0 + 0.5) > (safeZoneW + safeZoneX) || (_cordOnScreen#0 - 0.5) < safeZoneX) exitWith {};
// if ((_cordOnScreen#1 + 0.5) > (safeZoneH + safeZoneY) || (_cordOnScreen#1 - 0.5) < safeZoneY) exitWith {};

private _showName = (RT_SETTINGS_SPOTSYSTEM_show_text call CBA_settings_fnc_get) == 1;
private _showDistance = (RT_SETTINGS_SPOTSYSTEM_show_text call CBA_settings_fnc_get) == 2;

private _text = "";

if (_showName) then {
	_text = getText(configfile >> "CfgVehicles" >> typeOf _unit >> "displayName"); 
	// if ((side _unit isEqualTo civilian) && (_unit isKindOf "Man")) then {_text = name _unit;}; 

} else {
	if (_showDistance) then {
		_text = format ["%1m", ceil ((player distance _center) * 100) / 100];
	}
};

// _text = str (_unit getVariable["SpotTime", true]);

_icon = RT_SETTINGS_SPOTSYSTEM_spot_icon call CBA_settings_fnc_get;

drawIcon3D [_icon,_color,_center, 1,1, 0, _text, 2, 0.02825, "RobotoCondensedBold","center",false]; 