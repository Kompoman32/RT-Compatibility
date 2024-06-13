params [["_width", 2], ["_height", 2], ["_rotation", 0]];

_width = _width / 2;
_height = _height / 2;

private _x = 0;
private _y = 0;

private _w = _width ^ 2; // 2
private _h = _height ^ 2; // 1
private _wh = _w * _h;

while {true} do {
	_x = random [-_width, 0 , _width];
	_y = random[-_height, 0 , _height];
	if (_x ^ 2 * _h  + _y ^ 2 * _w < _wh) then {
		_result = [_x, _y];
		break;
	}
};

private _result = [_x,_y];



if (_rotation != 0) then {
	_result = [cos _rotation * _result#0 - sin _rotation * _result#1, sin _rotation * _result#0 + cos _rotation * _result#1];
};

_result