if (count RT_SPECTATOR_HINT_QUOTES_WHITELIST != 0) exitWith {
	private _count = count RT_SPECTATOR_HINT_QUOTES_WHITELIST;
	private _quoteIndex = floor (random (_count));

	private _quote = RT_SPECTATOR_HINT_QUOTES_WHITELIST select _quoteIndex;

	_quote
};


private _count = RT_SPECTATOR_HINT_QUOTE_COUNT;
private _isFunOnly = RT_SETTINGS_SPECTATOR_enable_only_fun_quotes call CBA_settings_fnc_get;
private _isAddFun = RT_SETTINGS_SPECTATOR_enable_add_fun_quotes call CBA_settings_fnc_get;

if (_isFunOnly) then {
	_count = RT_SPECTATOR_HINT_FUN_QUOTE_COUNT;
} else {
	if (_isAddFun) then {
		_count = _count + RT_SPECTATOR_HINT_FUN_QUOTE_COUNT;
	};
};

private _quoteIndex = floor (random (_count + (count RT_SPECTATOR_HINT_QUOTES_ADDED))) + 1;

private _isFunSuffix = "";

if (_isFunOnly) then {
	_isFunSuffix = "Fun_";

	if (_quoteIndex > _count) exitWith {
		private _quote = RT_SPECTATOR_HINT_QUOTES_ADDED select (_quoteIndex - _count - 1);
		_quote
	};
} else {
	if (_quoteIndex > _count) exitWith {
		private _quote = RT_SPECTATOR_HINT_QUOTES_ADDED select (_quoteIndex - _count - 1);
		_quote
	};


	if (_isAddFun && _quoteIndex > RT_SPECTATOR_HINT_QUOTE_COUNT) then {
		_isFunSuffix = "Fun_";
		_quoteIndex = _quoteIndex - RT_SPECTATOR_HINT_QUOTE_COUNT;
	};
};

if (_quoteIndex > _count) exitWith {
	private _quote = RT_SPECTATOR_HINT_QUOTES_ADDED select (_quoteIndex - _count - 1);

	_quote
};

private _quoteStr = format ["STR_RT_SPECTATOR_%2Quote_%1", _quoteIndex, _isFunSuffix];
private _quoteAuthorStr = format ["STR_RT_SPECTATOR_%2Quote_Author_%1", _quoteIndex, _isFunSuffix];

[localize _quoteStr, localize _quoteAuthorStr]