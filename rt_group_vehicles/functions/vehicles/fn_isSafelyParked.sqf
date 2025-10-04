// get if a vehicle is properly parked - covers e.g helicopter landed on a building, boat (beached or not) and underwater or not submarine
// return false on null, disabled or destroyed vehicle

params [
    ["_vehicle", objNull, [objNull]],                // 0: OBJECT - vehicle - a null object returns false
    ["_altitudeTolerance", 0.1, [0]],                // 1: NUMBER - altitude tolerance - in metre
    ["_velocityTolerance", 0.1, [0]]                 // 2: NUMBER - velocity tolerance - in km/h
];

if (not canMove _vehicle) exitWith { false };        // returns false for null as well

if (_vehicle isKindOf "Ship") then
{
    // surfaceIsWater getPosASL _vehicle                        // a beached boat is fine
    velocity _vehicle params ["_velX", "_velY"];
    sqrt (_velX * _velX + _velY * _velY) < _velocityTolerance    // only 2D speed matters (think waves)
    && {
        getPosASLW _vehicle < _altitudeTolerance                // underwater submarines are OK
        || { getPos _vehicle select 2 < _altitudeTolerance }    // beached boat
    };
}
else
{
    // over -a- ground and not over ocean
    (isTouchingGround _vehicle || {
        getPosASLW _vehicle select 2 >= _altitudeTolerance        // not in water
        && { getPos _vehicle select 2 < _altitudeTolerance }
    })
    && { vectorMagnitude velocity _vehicle * 3.6 < _velocityTolerance }
}