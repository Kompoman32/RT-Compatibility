_this spawn {
	params [["_show", true]];

	sleep 0.1;
	disableSerialization;
	private _display = findDisplay RT_FUN_VAR_ARSENAL_IDD;

	if !(isNUll _display) then {
		private _buttonMusicCtrl = _display displayCtrl RT_FUN_VAR_ARSENAL_SOUND_BUTTON_IDC;
		_buttonMusicCtrl ctrlShow _show;
		_buttonMusicCtrl ctrlCommit 0;

		if (RT_FUN_VAR_ARSENAL_DISABLE_MUSIC) then {
            _buttonMusicCtrl ctrlSetText "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_music_off_ca.paa";
        } else {
            _buttonMusicCtrl ctrlSetText "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_music_on_ca.paa";
        };
	};
}