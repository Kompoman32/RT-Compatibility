if !(isNUll findDisplay RT_FUN_VAR_ARSENAL_IDD) then {
	if (_this) then {
		[] call RT_FUN_fnc_onOpenArsenal;

		[true] call RT_FUN_fnc_arsenalMusicShowButton;
	} else {
		[] call RT_FUN_fnc_onCloseArsenal;

		[false] call RT_FUN_fnc_arsenalMusicShowButton;
	}
}