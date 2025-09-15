params ["_player"];

if (animationState _player == "wbk_helldivers_salutein") exitWith {
	[_player, "WBK_HellDivers_SaluteOut"] remoteExec ["switchMove", 0, true];

	[_player] spawn {
		sleep 0.5;
		[_this#0, ["", 0, 0.1]] remoteExec ["switchMove", 0, true];
	}
};

[_player, ["", 0, 0.1]] remoteExec ["switchMove", 0, true];
