params["_direction"]; 

private _cardinals = ["north","northeast","east","southeast","south","southwest","west","northwest","north"]; 

private _index = round (_direction * 8 / 360); 

_cardinals select _index 