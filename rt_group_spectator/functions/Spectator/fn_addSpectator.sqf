/** Scripts Works Only with Ace */
if ([] call RT_UTILS_fnc_dontHasAce) exitwith {};

/** Only if real player */
if (!hasinterface) exitwith {};

[] spawn {
	[] call RT_UTILS_fnc_waitUntilPlayerInit;
	waitUntil {!(isNull findDisplay 46)};
    
    disableSerialization;

    // Remove spectator just in case
    [] call RT_Spectator_fnc_removeSpectator;

    /** Handle Hint */
    
    private _text = "Press Enter to switch to Spectator mode";

	// All position relative to https// community.bistudio.com/wiki/SafeZone
	// Width of the box
	private _width = 0.5;

	// count of Total rows
	// idk but 2.5 seems fine
	private _lineCount = 2.5;

	private _ctrl = findDisplay 46 ctrlCreate ["RscStructuredText", -1];

	private _lineHeight = getNumber (configFile >> "RscStructuredText" >> "size");

	private _YPosition = 1 - _lineCount * _lineHeight;
	private _XPosition = (1 - _width) / 2;

	_ctrl ctrlSetPosition [_XPosition, _YPosition, _width, _lineHeight * _lineCount];
	_ctrl ctrlSetBackgroundColor [0.2, 0.2, 0.2, 0.1];

	// idk why there is 2, not 3
	private _linesTotalSize = (ctrlPosition _ctrl select 2) / _lineHeight;

	private _trailingSpace = "";
	for "_i" from 1 to _linesTotalSize do {
		_trailingSpace = _trailingSpace + " "
	};

	_ctrl ctrlSetStructuredText parseText format ["<t size='%1'><t size='1' align='center' valign='middle'>%2%3</t> </t>", _linesTotalSize, _text, _trailingSpace];

	_ctrl ctrlCommit 0;

	player setVariable [RT_SPECTATOR_VAR_HINT_CTRL, _ctrl];
}
