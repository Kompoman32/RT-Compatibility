params ["_id"];

if (isNil "_id") exitWith {};

if (_id == -1) exitWith {};

[_id] spawn {
	params ["_id"];

	while {!((soundParams _id) isEqualTo [])} do {stopSound _id}
}