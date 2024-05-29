/** Only with Ace */
if ([] call RT_UTILS_fnc_dontHasAce) exitwith {};
/** Only local */
if (!hasInterface) exitwith {};

_this spawn {
	[] call RT_UTILS_fnc_waitUntilPlayerInit;

	_action = ["PAUSETHEGAME", "PAUSE THE GAME", "z\ace\addons\microdagr\images\icon_infoClock.paa", {
		[true] remoteExec ["RT_Pause_fnc_stopstart", -2];
	}, {
		true
	}, {}, [], [0, 0, 0], 2] call ace_interact_menu_fnc_createAction;

	[["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;

	_action = ["UNPAUSETHEGAME", "UNPAUSE THE GAME", "z\ace\addons\microdagr\images\icon_infoClock.paa", {
		[false] remoteExec ["RT_Pause_fnc_stopstart", -2];
	}, {
		true
	}, {}, [], [0, 0, 0], 2] call ace_interact_menu_fnc_createAction;

	[["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;
}
