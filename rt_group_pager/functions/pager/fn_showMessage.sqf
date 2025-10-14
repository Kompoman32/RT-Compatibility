params ["_display", "_message"];
if (isNull _display) exitWith {};

forceUnicode 0;

_message = toUpper _message;

private _maxShownLength = 10;
private _sleepTime = 0.3;
private _sleepAfterMessage = 1.2;
private _repeatTime = 2;

private _textCtrl = _display displayCtrl 1;
private _messageInPlaced = false;

private _messageToShow = "";


for "_i" from 1 to _maxShownLength do {
	_messageToShow = " " + _messageToShow;
};

for "_i" from 1 to _repeatTime do {
	_messageToShow = _messageToShow + _message;

	for "_j" from 1 to _maxShownLength do {
		_messageToShow = _messageToShow + " ";
	};
};


private _messageToShowLength = (count _messageToShow) - _maxShownLength;

for "_i" from 0 to (_messageToShowLength) do {
	sleep _sleepTime;

	if (isNull _display) exitWith {};

	private _shownMesage = _messageToShow select [_i, _maxShownLength];

	_textCtrl ctrlSetText _shownMesage;
	_textCtrl ctrlCommit 0;
};


sleep _sleepAfterMessage;