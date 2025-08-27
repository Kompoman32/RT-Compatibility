[missionNameSpace, "ace_medical_injured", RT_MEDICAL_VAR_WOUND_RECEIVED_HANDLER] call Rt_Utils_fnc_removeCBAEventhandler;
[missionNameSpace, "ace_medical_injured", RT_MEDICAL_VAR_WOUND_RECEIVED_HANDLER, {
	params ["_unit"];

	if (!(alive _unit) || (_unit != player)) exitWith {};
	
	[_unit] call RT_Medical_fnc_triggerSecondWind;
}] call Rt_Utils_fnc_addCBAEventhandler;