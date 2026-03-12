params ["_from", "_to", "_color", "_imageSize", "_textSize"];
// drawLine3D [_from, _to, _color, 10];

// _file = "z\ace\addons\tagging\ui\tags\white\square.paa"; 
_file = "a3\ui_f\data\igui\cfg\targeting\markedtarget_ca.paa"; 
drawIcon3D [_file,_color,_to, _imageSize select 0,_imageSize select 1, 0,(""), 2, _textSize, "RobotoCondensedBold","center",false]; 