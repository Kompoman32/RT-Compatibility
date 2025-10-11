if (!(hasInterface) or (isDedicated)) exitWith {};

// run on Local in Sheduled
if ([_this, true, false] call RT_Utils_fnc_callByScriptName) exitWith {};

disableSerialization;

waitUntil { !isNull findDisplay 46 };
uiSleep 1;

private _existed_control = uiNamespace getVariable [RT_INTERFACE_VAR_IMMERISVE_TEXT_CONTROL, [objNull, objNull]];

if !(isNull (_existed_control#0)) then {
	ctrlDelete (_existed_control#0);
};

if !(isNull (_existed_control#1)) then {
	ctrlDelete (_existed_control#1);
};

(uiNamespace getVariable [RT_INTERFACE_VAR_IMMERISVE_HANDLER, -1]) call CBA_fnc_removePerFrameHandler;

if !(RT_SETTINGS_INTERFACE_enable_immersive call CBA_Settings_fnc_get) exitWith {
	[player, true] call RSS_IHUD_fnc_applyInterface;
};


_TAG_TEXT = findDisplay 46 ctrlCreate ["RscStructuredText", -1];  
_TAG_TEXT ctrlSetPosition [0.4, -0.3, 0.2, 0.1];   
_TAG_TEXT ctrlSetTextColor [1, 1, 1, 1];     
_TAG_TEXT ctrlSetBackgroundColor [0, 0, 0, 0];    
_TAG_TEXT ctrlSetStructuredText parseText "";
_TAG_TEXT ctrlCommit 0;

_ACE_TEXT = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
_ACE_TEXT ctrlSetPosition [0.381406 * safezoneW + safezoneX,0.76 * safezoneH + safezoneY,0.2275 * safezoneW,0.04 * safezoneH];
_ACE_TEXT ctrlSetTextColor [1, 1, 1, 1];
_ACE_TEXT ctrlSetBackgroundColor [0, 0, 0, 0];
_ACE_TEXT ctrlSetStructuredText parseText "";
_ACE_TEXT ctrlCommit 0;

uiNamespace setVariable [RT_INTERFACE_VAR_IMMERISVE_TEXT_CONTROL, [_TAG_TEXT, _ACE_TEXT]];

RSS_IHUD_DynamicHud = [{
	_array = _this select 0;
	_TAG_TEXT = _array select 0;
	_ACE_TEXT = _array select 1;

	_unit = missionNamespace getVariable["bis_fnc_moduleRemoteControl_unit", player];
	[_unit] call RSS_IHUD_fnc_applyInterface;

	private _currentWeapon = currentWeapon _unit;
	private _currentMuzzle = currentMuzzle _unit;
	private _weaponState = weaponState _unit;
	if (!(isNull objectParent _unit) || !(isNull(findDisplay 312)) || !(alive _unit) || (_currentWeapon == binocular _unit && _currentWeapon != "")) then {
		_TAG_TEXT ctrlSetBackgroundColor [0, 0, 0, 0]; 
		_TAG_TEXT ctrlSetStructuredText parseText "";   
		_TAG_TEXT ctrlCommit 0;  
		_ACE_TEXT ctrlSetBackgroundColor [0, 0, 0, 0];
		_ACE_TEXT ctrlSetStructuredText parseText "";
		_ACE_TEXT ctrlCommit 0;
	}else{
		private _medicalPeekActivated = false;
			switch true do {
			case (!(dialog) && (_currentWeapon != "") && (cameraView == "GUNNER")): {
				private _currentZeroing = currentZeroing _unit;
				if (_currentZeroing != RSS_IHUD_lastZeroing) then {
					RSS_IHUD_lastZeroing = _currentZeroing;
					RSS_IHUD_zeroingShowTime = time + RSS_IHUD_zeroingDisplayDuration;
				};
				if (time <= RSS_IHUD_zeroingShowTime) then {
						_TAG_TEXT ctrlSetStructuredText parseText format ["<t size='1.25' color='#ffffff' align='center' font='%1'>%2:<br/><t font='%3'>%4</t></t>", RSS_IHUD_font, RSS_IHUD_zeroingLabel, RSS_IHUD_fontB, _currentZeroing];
					_weaponAccessories = _unit weaponAccessories _currentWeapon;
					_opticType = if (count _weaponAccessories > 2 && _weaponAccessories select 2 != "") then {
						getNumber (configfile >> "CfgWeapons" >> (_weaponAccessories select 2) >> "ItemInfo" >> "opticType")
					} else {0};
					if (_opticType != 2) then {
						_TAG_TEXT ctrlSetPosition [0.423 * safezoneW + safezoneX,0.709 * safezoneH + safezoneY,0.154687 * safezoneW,0.1 * safezoneH]; 
					}else{
						_TAG_TEXT ctrlSetPosition [0.423 * safezoneW + safezoneX,0.071 * safezoneH + safezoneY,0.154687 * safezoneW,0.1 * safezoneH];
					};
					_TAG_TEXT ctrlSetBackgroundColor [0, 0, 0, 0];    
					_TAG_TEXT ctrlCommit 0;
				} else {
					_TAG_TEXT ctrlSetBackgroundColor [0, 0, 0, 0]; 
					_TAG_TEXT ctrlSetStructuredText parseText "";   
					_TAG_TEXT ctrlCommit 0;
				};
					_ACE_TEXT ctrlSetBackgroundColor [0, 0, 0, 0];
					_ACE_TEXT ctrlSetStructuredText parseText "";
					_ACE_TEXT ctrlCommit 0;
			};
			case ((lifeState _unit != "INCAPACITATED") && (freeLook) && !(dialog) && (((positionCameraToWorld [0,0,(positionCameraToWorld [0,0,0] distance (_unit modelToWorld [0,0,0.1]))] distance (_unit modelToWorld [0,0,0.1]))/(positionCameraToWorld [0,0,0] distance (_unit modelToWorld [0,0,0.1]))) <= 0.8) && (cameraView == "INTERNAL")): {
				private _currentMuzzleCompatibleMags = [];
				if (_currentWeapon != "") then {
					private _weaponConfig = configFile >> "CfgWeapons" >> _currentWeapon;
					if (isClass _weaponConfig) then {
						if (_currentMuzzle != "" && {_currentMuzzle != "this"}) then {
							private _muzzleConfig = _weaponConfig >> _currentMuzzle;
							if (isClass _muzzleConfig) then {
								_currentMuzzleCompatibleMags = [_muzzleConfig] call CBA_fnc_compatibleMagazines;
							} else {
								_currentMuzzleCompatibleMags = [_weaponConfig] call CBA_fnc_compatibleMagazines;
							};
						} else {
							_currentMuzzleCompatibleMags = [_weaponConfig] call CBA_fnc_compatibleMagazines;
						};
					};
				};

				private _currentMagClass = "";
				if ((count _weaponState > 1) && {(_weaponState select 1) == _currentMuzzle}) then {
					_currentMagClass = _weaponState param [3, ""];
				};
				if (_currentMagClass isEqualTo "") then {
					_currentMagClass = currentMagazine _unit;
				};

				private _currentThrowable = currentThrowable _unit;
				private _throwableClass = "";
				if (_currentThrowable isEqualType []) then {
					if ((count _currentThrowable) > 0) then {
						_throwableClass = _currentThrowable select 0;
					};
				} else {
					_throwableClass = _currentThrowable;
				};

				if (RSS_IHUD_hasAceMedicalGui) then {
					if (!RSS_IHUD_medicalPeekVisible) then {
						private _acePatient = missionNamespace getVariable ["ACE_player", objNull];
						if (isNull _acePatient) then {
							_acePatient = _unit;
						};
						[_acePatient, -1] call ace_medical_gui_fnc_displayPatientInformation;
					};
					_medicalPeekActivated = true;
				};

				private _magazinesFull = magazinesAmmoFull _unit;
				private _throwablesData = throwables _unit;
				private _throwableEntries = [];
				private _registerThrowable = {
					params ["_magClass", "_ammoCount"];
					if (_magClass isEqualTo "") exitWith {};
					private _idx = _throwableEntries findIf {(_x select 0) isEqualTo _magClass};
					if (_idx == -1) then {
						_throwableEntries pushBack [_magClass, 1, _ammoCount max 0];
					} else {
						private _entry = _throwableEntries select _idx;
						_entry set [1, (_entry select 1) + 1];
						_entry set [2, (_entry select 2) + (_ammoCount max 0)];
						_throwableEntries set [_idx, _entry];
					};
				};

				{
					_x params ["_magClass", "_muzzleName", "_id", "_ammoCount"];
					[_magClass, _ammoCount] call _registerThrowable;
				} forEach _throwablesData;

				if (_throwableClass != "" && {(_throwableEntries findIf {(_x select 0) isEqualTo _throwableClass}) == -1}) then {
					[_throwableClass, 0] call _registerThrowable;
				};

				_throwableEntries = [_throwableEntries, [], {getText (configfile >> "CfgMagazines" >> (_x select 0) >> "displayName")}] call BIS_fnc_sortBy;

				private _throwableElements = [];
				{
					_x params ["_magClass", "_count", "_"];
					private _magConfig = configfile >> "CfgMagazines" >> _magClass;
					private _picture = getText (_magConfig >> "picture");
					if (_picture isEqualTo "") then {
						_picture = "#(argb,8,8,3)color(0,0,0,0)";
					};
					private _entryColor = "#8c8c8c";
					private _textAttributes = " shadow='1' shadowColor='#00000040'";
					private _entrySize = "0.9";
					if (_magClass isEqualTo _throwableClass) then {
						_entryColor = "#ffffff";
						_textAttributes = " shadow='2' shadowColor='#101010c0'";
						_entrySize = "1";
					};
					_throwableElements pushBack format ["<t size='%5' font='%1' color='%4'%6>%2</t> <img image='%3' size='2.2'></img>", RSS_IHUD_fontB, _count, _picture, _entryColor, _entrySize, _textAttributes];
				} forEach _throwableEntries;

				private _throwableDisplay = format ["<t color='#a0a0a0' align='center'>%1</t>", RSS_IHUD_noneLabel];
				if ((count _throwableElements) > 0) then {
					_throwableDisplay = format ["<t align='center'>%1</t>", _throwableElements joinString "  "];
				};

				private _magEntries = [];
				private _registerMag = {
					params ["_magClass"];
					private _idx = _magEntries findIf {(_x select 0) isEqualTo _magClass};
					if (_idx == -1) then {
						_magEntries pushBack [_magClass, 1];
					} else {
						private _entry = _magEntries select _idx;
						_entry set [1, (_entry select 1) + 1];
						_magEntries set [_idx, _entry];
					};
				};

				{
					_x params ["_magClass", "_ammoCount", "_magMuzzle"];
					if (_magClass isEqualTo "") then {continue;};
					if (!(_magClass in _currentMuzzleCompatibleMags)) then {continue;};
					if (_magMuzzle isEqualTo _currentMuzzle) then {
						_currentMagClass = _magClass;
					} else {
						[_magClass] call _registerMag;
					};
				} forEach _magazinesFull;

				_magEntries = [_magEntries, [], {getText (configfile >> "CfgMagazines" >> (_x select 0) >> "displayName")}] call BIS_fnc_sortBy;

				private _currentMagElement = format ["<t size='0.9' font='%1' color='#a0a0a0'>%2</t>", RSS_IHUD_fontB, RSS_IHUD_noMag];
				if (_currentMagClass != "") then {
					private _currentMagPicture = getText (configfile >> "CfgMagazines" >> _currentMagClass >> "picture");
					if (_currentMagPicture isEqualTo "") then {
						_currentMagPicture = "#(argb,8,8,3)color(0,0,0,0)";
					};
					_currentMagElement = format ["<img image='%1' size='2.2'></img>", _currentMagPicture];
				};

				private _spareElements = [];
				{
					_x params ["_magClass", "_count"];
					private _magEntryPicture = getText (configfile >> "CfgMagazines" >> _magClass >> "picture");
					if (_magEntryPicture isEqualTo "") then {
						_magEntryPicture = "#(argb,8,8,3)color(0,0,0,0)";
					};
					private _spareCount = _count;
					if ((_magClass isEqualTo _currentMagClass) && {_currentMagClass != ""}) then {
						_spareCount = (_spareCount - 1) max 0;
					};
					if (_spareCount > 0) then {
						_spareElements pushBack format ["<t size='0.9' font='%1' color='#d9d9d9'>%2</t> <img image='%3' size='2.2'></img>", RSS_IHUD_fontB, _spareCount, _magEntryPicture];
					};
				} forEach _magEntries;

				private _sparesDisplay = "";
				if ((count _spareElements) > 0) then {
					_sparesDisplay = _spareElements joinString "  ";
				} else {
					_sparesDisplay = format ["<t size='0.9' font='%1' color='#a0a0a0'>%2</t>", RSS_IHUD_fontB, RSS_IHUD_noSpare];
				};

				private _separatorElement = format ["<t size='1' font='%1' color='#c0c0c0'> %2 </t>", RSS_IHUD_fontB, RSS_IHUD_magSeparator];
				private _magDisplay = format ["<t align='center'>%1  %2  %3</t>", _currentMagElement, _separatorElement, _sparesDisplay];

				private _mainLines = [
					format ["<t size='1.25' color='#ffffff' font='%1' align='center'>%2</t>", RSS_IHUD_fontB, RSS_IHUD_grenadesLabel],
					_throwableDisplay,
					"",
					format ["<t size='1.25' color='#ffffff' font='%1' align='center'>%2</t>", RSS_IHUD_fontB, RSS_IHUD_magazinesLabel],
					_magDisplay
				];
				_TAG_TEXT ctrlSetStructuredText parseText (_mainLines joinString "<br/>");
				_TAG_TEXT ctrlSetBackgroundColor [0, 0, 0, 0];
				_TAG_TEXT ctrlSetPosition [0.36 * safezoneW + safezoneX,0.72 * safezoneH + safezoneY,0.26 * safezoneW,0.3 * safezoneH];
				_TAG_TEXT ctrlCommit 0;
				_ACE_TEXT ctrlSetBackgroundColor [0, 0, 0, 0];
				_ACE_TEXT ctrlSetStructuredText parseText "";
				_ACE_TEXT ctrlCommit 0;
			};
			case ((lifeState _unit != "INCAPACITATED") && (freeLook) && (gestureState _unit != (getText (configfile >> "CfgWeapons" >> _currentWeapon >> "reloadAction"))) && !(dialog) && (_currentWeapon != "") && (((positionCameraToWorld [0,0,(positionCameraToWorld [0,0,0] distance (_unit modelToWorld (_unit selectionPosition "rightHand")))] distance (_unit modelToWorld (_unit selectionPosition "rightHand")))/(positionCameraToWorld [0,0,0] distance (_unit modelToWorld (_unit selectionPosition "rightHand")))) <= 0.5) && (cameraView == "INTERNAL")): {
				_TAG_TEXT ctrlSetBackgroundColor [0, 0, 0, 0]; 
				_TAG_TEXT ctrlSetStructuredText parseText "";   
				_TAG_TEXT ctrlCommit 0;  
				private _firemodeDisplay = _weaponState param [2, ""];
				private _isSafe = false;
				if (RSS_IHUD_hasAceSafemode && {!(isNil "ace_safemode_fnc_getWeaponSafety")}) then {
					_isSafe = [_unit, _currentWeapon, _currentMuzzle] call ace_safemode_fnc_getWeaponSafety;
					if (_isSafe) then {
						_firemodeDisplay = RSS_IHUD_safe;
					};
				};
				private _firemodeColor = [1, 1, 1, 1];
				if (_isSafe) then {
					_firemodeColor = [0.45, 1, 0.45, 1];
				};
				drawIcon3D ["", _firemodeColor, _unit modelToWorld (_unit selectionPosition "rightHand"), 0, 0, 0, format ["%1: %2", RSS_IHUD_firemodeLabel, _firemodeDisplay], 2, 0.05, RSS_IHUD_fontB];
				_currentMag = currentMagazine _unit;
				if (_currentMag != "") then {
					_numFullMag = getNumber (configfile >> "CfgMagazines" >> _currentMag >> "count");
					_numCount = _unit ammo _currentMuzzle;
					private _isSingleShot = (_numFullMag <= 1);
					if (_isSingleShot) then {
						private _singleText = RSS_IHUD_singleLoaded;
						private _singleColor = [0.7, 1, 0.7, 1];
						if (_numCount == 0) then {
							_singleText = RSS_IHUD_singleEmpty;
							_singleColor = [1, 0.7, 0.7, 1];
						};
						drawIcon3D ["", _singleColor, _unit modelToWorld (_unit selectionPosition "leftHand"), 0, 0, 0, _singleText, 2, 0.05, RSS_IHUD_fontB];
					} else {
						_ratio = if (_numFullMag > 0) then {_numCount / _numFullMag} else {0};
						private _magColor = [1,1,1,1];
						if (_ratio > 0.5) then {
							private _t = (_ratio - 0.5) * 2; 
							_magColor = [0.7 + (0.3 * (1 - _t)), 1, 0.7 + (0.3 * (1 - _t)), 1]; 
						} else {
							if (_ratio > 0) then {
								private _t2 = _ratio * 2; 
								_magColor = [1, 0.7 + (0.3 * _t2), 0.7, 1]; 
							} else {
								_magColor = [1, 0.7, 0.7, 1];
							};
						};
						switch true do {
							case (_numCount == 0): {drawIcon3D ["", _magColor, _unit modelToWorld (_unit selectionPosition "leftHand"), 0, 0, 0, RSS_IHUD_magEmpty, 2, 0.05, RSS_IHUD_fontB];};
							case (_numCount == _numFullMag): {drawIcon3D ["", _magColor, _unit modelToWorld (_unit selectionPosition "leftHand"), 0, 0, 0, RSS_IHUD_magFull, 2, 0.05, RSS_IHUD_fontB];};
							case (_ratio >= 0.8): {drawIcon3D ["", _magColor, _unit modelToWorld (_unit selectionPosition "leftHand"), 0, 0, 0, RSS_IHUD_magNearlyFull, 2, 0.05, RSS_IHUD_fontB];};
							case (_ratio >= 0.6): {drawIcon3D ["", _magColor, _unit modelToWorld (_unit selectionPosition "leftHand"), 0, 0, 0, RSS_IHUD_magMoreThanHalf, 2, 0.05, RSS_IHUD_fontB];};
							case (_ratio >= 0.4): {drawIcon3D ["", _magColor, _unit modelToWorld (_unit selectionPosition "leftHand"), 0, 0, 0, RSS_IHUD_magAboutHalf, 2, 0.05, RSS_IHUD_fontB];};
							case (_ratio >= 0.2): {drawIcon3D ["", _magColor, _unit modelToWorld (_unit selectionPosition "leftHand"), 0, 0, 0, RSS_IHUD_magLessThanHalf, 2, 0.05, RSS_IHUD_fontB];};
							case (_ratio > 0): {drawIcon3D ["", _magColor, _unit modelToWorld (_unit selectionPosition "leftHand"), 0, 0, 0, RSS_IHUD_magNearlyEmpty, 2, 0.05, RSS_IHUD_fontB];};
						};
					};
				} else {
					drawIcon3D ["", [1,1,1,1], _unit modelToWorld (_unit selectionPosition "leftHand"), 0, 0, 0, RSS_IHUD_noMag, 2, 0.05, RSS_IHUD_fontB];
				};
				_ACE_TEXT ctrlSetBackgroundColor [0, 0, 0, 0];
				_ACE_TEXT ctrlSetStructuredText parseText "";
				_ACE_TEXT ctrlCommit 0;
			};
			default {
				_TAG_TEXT ctrlSetBackgroundColor [0, 0, 0, 0]; 
				_TAG_TEXT ctrlSetStructuredText parseText "";   
				_TAG_TEXT ctrlCommit 0;
				_ACE_TEXT ctrlSetBackgroundColor [0, 0, 0, 0];
				_ACE_TEXT ctrlSetStructuredText parseText "";
				_ACE_TEXT ctrlCommit 0;
			};
		};
		if (RSS_IHUD_hasAceMedicalGui) then {
			if (_medicalPeekActivated) then {
				RSS_IHUD_medicalPeekVisible = true;
			} else {
				if (RSS_IHUD_medicalPeekVisible) then {
					"ace_medical_gui_RscPatientInfo" cutFadeOut 0;
					RSS_IHUD_medicalPeekVisible = false;
				};
			};
		};
	};
}, 0, [_TAG_TEXT, _ACE_TEXT]] call CBA_fnc_addPerFrameHandler;

uiNamespace setVariable [RT_INTERFACE_VAR_IMMERISVE_HANDLER, RSS_IHUD_DynamicHud] ;
