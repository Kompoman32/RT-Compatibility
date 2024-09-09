ace_hearing_disableVolumeUpdate = true;

0 fadeSound 0;

enableEnvironment false;
showCinemaBorder false;
cutText ["", "BLACK FADED", 69];

0 spawn {
	sleep 5;
	private _scenes = [
		"rt\menu\videos\Spasibo Voxtell!.Ogg",
		"rt\menu\videos\davai strelyai.ogg",
		"rt\menu\videos\HomeFront 2.ogg",
		"rt\menu\videos\Nuzhdiki.ogg",
		"rt\menu\videos\Prestupnik.ogg",
		"rt\menu\videos\rt_experience.ogg",
		"rt\menu\videos\rtmeme.ogg",
		"rt\menu\videos\rtsmile.ogg",
		"rt\menu\videos\Vozmozhno etot mod byl oshibkoj.ogg"
	];

	private _track = selectRandom _scenes;

	while {true} do
	{
		
		0 fadeSound 1;

		_video = [_track] spawn BIS_fnc_playVideo;
		waitUntil {scriptDone _video};

		0 fadeSound 0;

		_track = selectRandom _scenes;
	};
}
