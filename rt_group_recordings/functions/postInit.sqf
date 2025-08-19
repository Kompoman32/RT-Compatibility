/** Only if real player */
if (!hasInterface) exitwith {};

_this spawn {
	[missionNamespace, "ace_arsenal_displayOpened", RT_RECORDINGS_VAR_ACE_ARSENAL_OPENED_HANDLER] call Rt_Utils_fnc_removeCBAEventhandler;
	[missionNamespace, "ace_arsenal_displayOpened", RT_RECORDINGS_VAR_ACE_ARSENAL_OPENED_HANDLER, {
		missionNamespace setVariable [RT_RECORDINGS_VAR_ACE_ARSENAL_TIME_HANDLER, diag_tickTime];
	}] call Rt_Utils_fnc_addCBAEventhandler;

	[missionNamespace, "ace_arsenal_displayClosed", RT_RECORDINGS_VAR_ACE_ARSENAL_CLOSED_HANDLER] call Rt_Utils_fnc_removeCBAEventhandler;
	[missionNamespace, "ace_arsenal_displayClosed", RT_RECORDINGS_VAR_ACE_ARSENAL_CLOSED_HANDLER, {
		private _openTime = diag_tickTime - (missionNamespace getVariable [RT_RECORDINGS_VAR_ACE_ARSENAL_TIME_HANDLER, diag_tickTime]);

		systemChat str ["ArsenalUI", _openTime];

		steamGameRecordingEvent ["ArsenalUI", _openTime, [], -_openTime];
		missionNamespace setVariable [RT_RECORDINGS_VAR_ACE_ARSENAL_TIME_HANDLER, nil];
	}] call Rt_Utils_fnc_addCBAEventhandler;
	

	[missionNameSpace, "ace_unconscious", RT_RECORDINGS_VAR_UNCOSCIOUS_HANDLER] call Rt_Utils_fnc_removeCBAEventhandler;
	[missionNameSpace, "ace_unconscious", RT_RECORDINGS_VAR_UNCOSCIOUS_HANDLER, {
		params ["_unit", "_state"];

		if (!(isPlayer _unit) || !(alive _unit)) exitWith {};

		if (_state) then {
			[] call RT_Recordings_fnc_Spectator_Fall;
		} else {
			[] call RT_Recordings_fnc_Spectator_Standup;
		};
	}] call Rt_Utils_fnc_addCBAEventhandler;

	[player, "Killed", RT_RECORDINGS_VAR_KILLED_HANDLER] call Rt_Utils_fnc_removeEventhandler;
	[player, "Killed", RT_RECORDINGS_VAR_KILLED_HANDLER, { 
		[] call RT_Recordings_fnc_Spectator_Standup;
	}] call Rt_Utils_fnc_addEventhandler;

	[player, "Respawn", RT_RECORDINGS_VAR_RESPAWN_HANDLER] call Rt_Utils_fnc_removeEventhandler;
	[player, "Respawn", RT_RECORDINGS_VAR_RESPAWN_HANDLER, { 
		[] call RT_Recordings_fnc_Spectator_Standup;
	}] call Rt_Utils_fnc_addEventhandler;

}