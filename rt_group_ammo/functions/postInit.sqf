/** Only if real player */
if (!hasInterface) exitwith {};

_this spawn {
	[] call RT_UTILS_fnc_waitUntilPlayerInit;

	[missionNameSpace, "ace_throwablePickedUp", RT_AMMO_VAR_GRENADE_PICKUP_HANDLER] call Rt_Utils_fnc_removeCBAEventhandler;
	[missionNameSpace, "ace_throwablePickedUp", RT_AMMO_VAR_GRENADE_PICKUP_HANDLER, {
		params ["_activeThrowable"];

		// if (_activeThrowable isKindOf "RT_G_Potato") then {
		// 	[] spawn {
		// 		sleep 0.05;
		// 		ACE_player setVariable ["ace_advanced_throwing_primed", false];

		// 		call ace_advanced_throwing_fnc_updateControlsHint;
		// 	}
		// };
	}] call Rt_Utils_fnc_addCBAEventhandler;
}
