
params [["_unit", objNull, [objNull]], "_force"];
if (isNull _unit) exitWith {};
if (!hasInterface) exitWith {};

private _allowSelective = missionNamespace getVariable ["ace_ui_allowSelectiveUI", false];
private _vehicle = objectParent _unit;
private _inVehicle = !isNull _vehicle;
private _currentWeapon = currentWeapon _unit;
private _binocularWeapon = binocular _unit;
private _usingBinoculars = (_currentWeapon != "") && {_currentWeapon == _binocularWeapon};
private _hasInfoDisplay312 = !(isNull findDisplay 312);
private _isAlive = alive _unit;
private _forceVanilla = _inVehicle || _hasInfoDisplay312 || !_isAlive || _usingBinoculars;
private _overlayActive = !_forceVanilla;
private _selectiveEnabled = _allowSelective && !_forceVanilla;
private _iguiDisplays = uiNamespace getVariable ["IGUI_displays", []] + [];
private _missionDisplay = findDisplay IDD_MISSION;
if (!isNull _missionDisplay) then {
	_iguiDisplays pushBackUnique _missionDisplay;
};

{
	_x params ["_settingName", "_idd", "_idcs", "_location"];
	private _settingValue = missionNamespace getVariable [_settingName, true];

	if (isNil "_force") then {
		switch (_location) do {
			case RSS_IHUD_UI_GROUND: {
				if (_overlayActive) then {
					_settingValue = false;
				} else {
					if (_inVehicle) then {
						_settingValue = false;
					};
				};
			};
			case RSS_IHUD_UI_VEHICLE: {
				if (_inVehicle) then {
					if (_forceVanilla) then {
						_settingValue = true;
					};
				} else {
					_settingValue = false;
				};
			};
		};
	};

	private _fade = if (_settingValue) then {0} else {1};
	{
		private _display = _x;
		if (isNull _display) then {continue};
		if (ctrlIDD _display != _idd) then {continue};
		{
			private _ctrl = controlNull;
			if ((typeName _x) == "STRING") then {
				_ctrl = uiNamespace getVariable [_x, controlNull];
			} else {
				_ctrl = _display displayCtrl _x;
			};

			if (isNull _ctrl) then {continue};
			if (_ctrl isEqualTo controlNull) then {continue};
			if (ctrlFade _ctrl == _fade) then {continue};
			_ctrl ctrlSetFade _fade;
			_ctrl ctrlCommit 0;
		} forEach _idcs;
	} forEach _iguiDisplays;
} forEach RSS_IHUD_selectiveUIElements;

private _hudMask = [
	true,
	missionNamespace getVariable ["ace_ui_soldierVehicleWeaponInfo", true],
	missionNamespace getVariable ["ace_ui_vehicleRadar", true],
	missionNamespace getVariable ["ace_ui_vehicleCompass", true],
	true,
	missionNamespace getVariable ["ace_ui_commandMenu", true],
	missionNamespace getVariable ["ace_ui_groupBar", true],
	true,
	true,
	true
];
showHUD _hudMask;