_this spawn {
	sleep 0.1;

	params ["_player", ["_danceAnim", "Acts_Dance_01"]];

	[_player, _danceAnim] remoteExec ["switchMove"];
}
