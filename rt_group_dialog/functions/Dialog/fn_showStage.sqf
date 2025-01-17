private _TextBottomY = safeZoneY + safeZoneH * 0.95833334;
private _ControlsGap = 0.02356903;

params ["_speaker",["_hash", createHashMap], ["_stage", createHashMap], ["_silent", false]];

disableSerialization;

private _d = findDisplay 2143;

if (isNil "_d" || isNil "_speaker") exitWith {};

_d setVariable ["_hash", _hash];

private _id = _stage getOrDefault ["id", -1];
private _text = _stage getOrDefault ["text", "<ERROR: TEXT NOT FOUND>"];

private _g = _d displayCtrl 10;
private _t = _d displayCtrl 999;

private _groupTopY = (ctrlPosition _g)#1;

// Чистим опции
{ctrlDelete _x} forEach allControls _g;

if (typeName _text == 'STRING') then {
	// private _sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	// private _size = (safeZoneH * 0.1 - _sizeEx * 1.5 - _sizeEx * 1.5) / 2 / _sizeEx;


	// _text = parseText (format ["<t size='%1'>&#160;</t><br/><t size='1.5'align='left'>%2:</t><br/><t size='1.5' align='left'>%3&#160;&#160;</t>", _size, name _speaker, _text])
	// _text = parseText (format ["<t size='1.5' align='left'>%2</t>", _size,_text])
	_t ctrlSetText _text;
};

if (typeName _text == 'TEXT') then {
	_t ctrlSetStructuredText _text;
};

_theight =(ctrlTextHeight _t);
_t ctrlSetPositionH _theight;
_t ctrlSetPositionY _TextBottomY - _theight;
_t ctrlCommit 0;

// systemChat str (ctrlTextHeight _t);

private _callbackBefore = _stage getOrDefault ["callbackBefore", nil];

if (!isNil "_callbackBefore") then {
	[_this#0, _this#1, _this#2] call _callbackBefore;
};

if (!_silent) then {
	private _sleepTime = _stage getOrDefault ["textTime", 5];

	private _sound = _stage getOrDefault ["sound", nil];

	// Произносим
	if (!isNil "_sound") then {
		private _soundArgs = _stage getOrDefault ["soundArgs", []];

		if (count _soundArgs == 0) then {
			_speaker say3D _sound;
		} else {
			_speaker say3D ([_sound] + _soundArgs);
		};
	};
	_speaker setRandomLip true;

	// Ждём когда закончится фраза
	sleep _sleepTime;

	_speaker setRandomLip false;
};


// Если закрыли диалог, надо бы ничего больше не делать
if (isNull findDisplay 2143) exitWith {};

private _options = _stage getOrDefault ["options", []];
// Если нет диалоговых опций ответа, то берём следующую строку
if (count _options == 0) exitWith {
	private _callbackAfter = _stage getOrDefault ["callbackAfter", nil];

	if (!isNil "_callbackAfter") then {
		[_this#0, _this#1, _this#2] call _callbackAfter;
	};

	private _next = _stage getOrDefault ["next", -1];

	if (typeName _next == "CODE") then {
		_next = [_speaker, _hash, _stage] call _next;
	};

	private _nextStage = _hash getOrDefault [_next, nil];
	if (_next == -1 || isNil "_nextStage") exitWith {closeDialog 2;};

	private _nextSilent = _stage getOrDefault ["nextSilent", false];
	[_speaker, _hash, _nextStage, _nextSilent] spawn RT_Dialog_fnc_ShowStage;
};

_t ctrlSetPositionY ((ctrlPosition _g)#1 - _theight - _ControlsGap);
_t ctrlCommit 0;

private _notExistedButtonsCount = 0;

// Создаём опции
{
	private _condition = _x getOrDefault ["condition", {true}];

	if (!([_this#0, _this#1, _this#2, _x] call _condition)) then {
		_notExistedButtonsCount = _notExistedButtonsCount + 1;
		continue;
	};


	private _c = _d ctrlCreate ["DialogOptionButton", 100 + _forEachIndex, _g];

	private _text = _x getOrDefault ["text", "<ERROR: TEXT NOT FOUND>"];

	private _cHeight = (ctrlPosition _c)#3;

	_c ctrlSetPositionY ((_cHeight + _ControlsGap) * (_forEachIndex - _notExistedButtonsCount));
	_c ctrlSetText _text;
	_c ctrlCommit 0;

	private _condition = _x getOrDefault ["conditionDisabled", {false}];

	if (([_this#0, _this#1, _this#2, _x] call _condition)) then {
		_c ctrlSetText (_x getOrDefault ["textDisabled", _text]);
		_c ctrlEnable false;
		_c ctrlCommit 0;
		continue;
	};

	_c setVariable ["_hash", _hash];
	_c setVariable ["_speaker", _speaker];
	_c setVariable ["_stage", _stage];
	_c setVariable ["_option", _x];

	_c ctrlAddEventHandler ["ButtonClick", RT_Dialog_fnc_ButtonClick]
} forEach _options;


private _callbackAfter = _stage getOrDefault ["callbackAfter", nil];

if (!isNil "_callbackAfter") then {
	[_this#0, _this#1, _this#2] call _callbackAfter;
};
