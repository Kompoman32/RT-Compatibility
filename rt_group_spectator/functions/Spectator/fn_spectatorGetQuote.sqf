private _quoteIndex = floor (random (RT_SPECTATOR_VAR_HINT_QUOTE_COUNT)) + 1;

private _isFunSuffix = "";

if (RT_SETTINGS_SPECTATOR_enable_only_fun_quotes call CBA_settings_fnc_get) then {
	 _quoteIndex = floor (random (RT_SPECTATOR_VAR_HINT_FUN_QUOTE_COUNT)) + 1;
	_isFunSuffix = "Fun_";
} else {
	if (RT_SETTINGS_SPECTATOR_enable_add_fun_quotes call CBA_settings_fnc_get) then {
		_quoteIndex = floor (random (RT_SPECTATOR_VAR_HINT_QUOTE_COUNT + RT_SPECTATOR_VAR_HINT_FUN_QUOTE_COUNT)) + 1;

		if (_quoteIndex > RT_SPECTATOR_VAR_HINT_QUOTE_COUNT) then {
			_isFunSuffix = "Fun_";
			_quoteIndex = _quoteIndex - RT_SPECTATOR_VAR_HINT_QUOTE_COUNT;
		};
	}
};

private _quoteStr = format ["STR_RT_SPECTATOR_%2Quote_%1", _quoteIndex, _isFunSuffix];
private _quoteAuthorStr = format ["STR_RT_SPECTATOR_%2Quote_Author_%1", _quoteIndex, _isFunSuffix];

[localize _quoteStr, localize _quoteAuthorStr]