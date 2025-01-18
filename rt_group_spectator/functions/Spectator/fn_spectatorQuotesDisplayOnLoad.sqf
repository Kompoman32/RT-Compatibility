if !(RT_SETTINGS_SPECTATOR_enable_quotes call CBA_settings_fnc_get) exitWith {};

private _quote = call RT_Spectator_fnc_spectatorGetQuote;
private _quoteText = _quote#0;
private _author = _quote#1;

private _quoteTextSplitted = _quoteText splitString "\";

_quoteText = _quoteTextSplitted joinString "<br/>";


if !(player getVariable ["ACE_isUnconscious", false]) exitWith {};

[ format ["<t color='#ffffff' size='0.8'>%1</t><br/><t color='#ffffff' size='0.6'>%2</t>", _quoteText, _author] ,-1,-1,1e+011,0.5,0,["Rsc_RT_Spectator_Quotes_UI"] call BIS_fnc_rscLayer] spawn BIS_fnc_dynamicText;

[] spawn {
    sleep 1;
    if !(player getVariable ["ACE_isUnconscious", false]) then {
        "Rsc_RT_Spectator_Quotes_UI" cutFadeOut 0;
    }
}
	

// disableSerialization;
// private _dsp = _this#0;
// private _ctrlQuoteText = _dsp displayCtrl 2;
// private _ctrlQuoteTextPosition =  ctrlPosition _ctrlQuoteText;
// private _quoteTextLines = count _quoteTextSplitted;
// private _textSize = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
// private _textSizeMultiplier = 1.2;
// +1 == author
// private _quoteTextHeight = (_quoteTextLines + 1) * _textSize *_textSizeMultiplier;
// private _quoteTextWidth = 0.5;

// _ctrlQuoteText ctrlSetStructuredText parseText format ["<t shadow='1' shadowOffset='0.1' shadowColor='#555555' size='%1' align='left' valign='top'>%2</t><br/><t size='1' align='right' valign='bottom'>%3</t>", _textSizeMultiplier, _quoteText, _author];
// _ctrlQuoteText ctrlSetPosition [safeZoneW + safeZoneX - _quoteTextWidth - 0.05, safeZoneH / 2 + safeZoneY - _quoteTextHeight, _quoteTextWidth, _quoteTextHeight];
// _ctrlQuoteText ctrlCommit 0;


