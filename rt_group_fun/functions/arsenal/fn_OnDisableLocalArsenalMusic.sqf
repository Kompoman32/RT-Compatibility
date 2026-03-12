RT_FUN_VAR_ARSENAL_DISABLE_MUSIC = !RT_FUN_VAR_ARSENAL_DISABLE_MUSIC;

disableSerialization;
private _display = findDisplay RT_FUN_VAR_ARSENAL_IDD;

if !(isNUll _display) then {
    private _buttonMusicCtrl = _display displayCtrl RT_FUN_VAR_ARSENAL_SOUND_BUTTON_IDC;
    _buttonMusicCtrl ctrlShow true;
    _buttonMusicCtrl ctrlCommit 0;

    if (RT_FUN_VAR_ARSENAL_DISABLE_MUSIC) then {
        _buttonMusicCtrl ctrlSetText "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_music_off_ca.paa";
		[] call RT_FUN_fnc_onCloseArsenal;
    } else {
        _buttonMusicCtrl ctrlSetText "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_music_on_ca.paa";
		[] call RT_FUN_fnc_onOpenArsenal;
    };
}