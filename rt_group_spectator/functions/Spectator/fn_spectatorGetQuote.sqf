private _quoteIndex = floor (random (RT_SPECTATOR_VAR_HINT_QUOTE_COUNT)) + 1;

private _quoteStr = format ["STR_RT_SPECTATOR_Quote_%1", _quoteIndex];
private _quoteAuthorStr = format ["STR_RT_SPECTATOR_Quote_Author_%1", _quoteIndex];

[localize _quoteStr, localize _quoteAuthorStr]