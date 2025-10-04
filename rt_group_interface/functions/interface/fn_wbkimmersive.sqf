if (!(hasInterface) or (isDedicated)) exitWith {};

// run on Local in Sheduled
if ([_this, true, false] call RT_Utils_fnc_callByScriptName) exitWith {};

disableSerialization;

waitUntil { !isNull findDisplay 46 };
uiSleep 1;

private _TAG_TEXT = uiNamespace getVariable [RT_INTERFACE_VAR_IMMERISVE_TEXT_CONTROL, objNull];

if !(isNull _TAG_TEXT) then {
	ctrlDelete _TAG_TEXT;
};

(uiNamespace getVariable [RT_INTERFACE_VAR_IMMERISVE_HANDLER, -1]) call CBA_fnc_removePerFrameHandler;

if !(RT_SETTINGS_INTERFACE_enable_immersive call CBA_Settings_fnc_get) exitWith {
		showHUD [
			true, // scriptedHUD
			true, // info
			true, // radar
			true, // compass
			true, // direction
			true, // menu
			true, // group
			true, // cursors
			true, // panels
			true, // kills
			true  // showIcon3D
		];
};

_TAG_TEXT = findDisplay 46 ctrlCreate ["RscStructuredText", -1];  
_TAG_TEXT ctrlSetPosition [0.4, -0.3, 0.2, 0.1];   
_TAG_TEXT ctrlSetTextColor [1, 1, 1, 1];     
_TAG_TEXT ctrlSetBackgroundColor [0, 0, 0, 0];    
_TAG_TEXT ctrlSetStructuredText parseText "";
_TAG_TEXT ctrlCommit 0;

private _WBK_DynamicHud = [{
	_array = _this select 0;
	_TAG_TEXT = _array select 0;

	uiNamespace setVariable [RT_INTERFACE_VAR_IMMERISVE_TEXT_CONTROL, _TAG_TEXT];

	_unit = missionNamespace getVariable["bis_fnc_moduleRemoteControl_unit", player];
	if (!(isNull objectParent _unit) || !(isNull(findDisplay 312)) || !(alive _unit) || (currentWeapon _unit == binocular _unit && currentWeapon _unit != "")) then {
		_TAG_TEXT ctrlSetBackgroundColor [0, 0, 0, 0]; 
		_TAG_TEXT ctrlSetStructuredText parseText "";   
		_TAG_TEXT ctrlCommit 0;  
		showHUD [
			true, // scriptedHUD
			true, // info
			true, // radar
			true, // compass
			true, // direction
			true, // menu
			true, // group
			true, // cursors
			true, // panels
			true, // kills
			true  // showIcon3D
		];
	}else{
		showHUD [
			true, // scriptedHUD
			false, // info
			true, // radar
			true, // compass
			true, // direction
			true, // menu
			true, // group
			true, // cursors
			true, // panels
			true, // kills
			true  // showIcon3D
		];
		switch true do {
			// case (!(dialog) && (currentWeapon _unit != "") && (cameraView == "GUNNER")): {
			// 	_TAG_TEXT ctrlSetStructuredText parseText format ["<t size='1.25' color='#ffffff' align='center' font='PuristaSemibold'>Zeroing:<br/>%1</t>",currentZeroing _unit];    
			// 	if (getNumber (configfile >> "CfgWeapons" >> (_unit weaponAccessories currentWeapon _unit) select 2 >> "ItemInfo" >> "opticType") != 2) then {
			// 		_TAG_TEXT ctrlSetPosition [0.4, 0.9, 0.2, 0.1];
			// 	}else{
			// 		_TAG_TEXT ctrlSetPosition [0.4, -0.3, 0.2, 0.1]; 
			// 	};
			// 	_TAG_TEXT ctrlSetBackgroundColor [0, 0, 0, 0];    
			// 	_TAG_TEXT ctrlCommit 0;
			// };
			case ((lifeState _unit != "INCAPACITATED") && (freeLook) && !(dialog) && (((positionCameraToWorld [0,0,(positionCameraToWorld [0,0,0] distance (_unit modelToWorld [0,0,0.1]))] distance (_unit modelToWorld [0,0,0.1]))/(positionCameraToWorld [0,0,0] distance (_unit modelToWorld [0,0,0.1]))) <= 0.8) && (cameraView == "INTERNAL")): {
				if ((count (currentThrowable _unit)) == 0) then {
					_TAG_TEXT ctrlSetStructuredText parseText format ["<t size='1.2' color='#ffffff' align='center' font='PuristaSemibold'>No grenades in inventory<br/><img image='%2' size='2'></img>Available mags: %1</t>",{_x in ([currentWeapon _unit] call CBA_fnc_compatibleMagazines)} count magazines _unit,getText (configfile >> "CfgMagazines" >> currentMagazine _unit >> "picture")];    
				}else{
					_TAG_TEXT ctrlSetStructuredText parseText format ["<t size='1.2' color='#ffffff' align='center' font='PuristaSemibold'><img image='%2' size='2'></img>%1<br/><img image='%4' size='2'></img>Available mags: %3</t>",getText (configfile >> "CfgMagazines" >> (currentThrowable _unit) select 0 >> "displayName"),getText (configfile >> "CfgMagazines" >> (currentThrowable _unit) select 0 >> "picture"),{_x in ([currentWeapon _unit] call CBA_fnc_compatibleMagazines)} count magazines _unit,getText (configfile >> "CfgMagazines" >> currentMagazine _unit >> "picture")];  
				};
				_TAG_TEXT ctrlSetBackgroundColor [0.3, 0.3, 0.3, 0.9];  
				_TAG_TEXT ctrlSetPosition [0.381406 * safezoneW + safezoneX,0.775 * safezoneH + safezoneY,0.2275 * safezoneW,0.09 * safezoneH];
				_TAG_TEXT ctrlCommit 0;
			};
			case ((lifeState _unit != "INCAPACITATED") && (freeLook) && (gestureState _unit != (getText (configfile >> "CfgWeapons" >> currentWeapon _unit >> "reloadAction"))) && !(dialog) && (currentWeapon _unit != "") && (((positionCameraToWorld [0,0,(positionCameraToWorld [0,0,0] distance (_unit modelToWorld (_unit selectionPosition "rightHand")))] distance (_unit modelToWorld (_unit selectionPosition "rightHand")))/(positionCameraToWorld [0,0,0] distance (_unit modelToWorld (_unit selectionPosition "rightHand")))) <= 0.35) && (cameraView == "INTERNAL")): {
				_TAG_TEXT ctrlSetBackgroundColor [0, 0, 0, 0]; 
				_TAG_TEXT ctrlSetStructuredText parseText "";   
				_TAG_TEXT ctrlCommit 0;  
				_text = format ["Firemode: %1",weaponState _unit select 2];
				drawIcon3D ["", [1,1,1,1], _unit modelToWorld (_unit selectionPosition "rightHand"), 0, 0, 0, _text, 1, 0.05, "PuristaSemibold"];
				_numFullMag = getNumber (configfile >> "CfgMagazines" >> currentMagazine _unit >> "count");
				_numCount = _unit ammo currentWeapon _unit;
				_halfMag = (_numFullMag / 2);
				switch true do {
					case (_numCount == 0): {drawIcon3D ["", [1,1,1,1], _unit modelToWorld (_unit selectionPosition "leftHand"), 0, 0, 0, "Mag is empty", 1, 0.05, "PuristaSemibold"];};
					case (_numCount == _numFullMag): {drawIcon3D ["", [1,1,1,1], _unit modelToWorld (_unit selectionPosition "leftHand"), 0, 0, 0, "Mag is full", 1, 0.05, "PuristaSemibold"];};
					case (_numCount >= _halfMag): {drawIcon3D ["", [1,1,1,1], _unit modelToWorld (_unit selectionPosition "leftHand"), 0, 0, 0, "More then a half", 1, 0.05, "PuristaSemibold"];};
					case (_numCount < _halfMag): {drawIcon3D ["", [1,1,1,1], _unit modelToWorld (_unit selectionPosition "leftHand"), 0, 0, 0, "Less then a half", 1, 0.05, "PuristaSemibold"];};
				};
			};
			default {
				_TAG_TEXT ctrlSetBackgroundColor [0, 0, 0, 0]; 
				_TAG_TEXT ctrlSetStructuredText parseText "";   
				_TAG_TEXT ctrlCommit 0;   
			};
		};
	};
}, 0, [_TAG_TEXT]] call CBA_fnc_addPerFrameHandler;

uiNamespace setVariable [RT_INTERFACE_VAR_IMMERISVE_HANDLER, _WBK_DynamicHud] ;
