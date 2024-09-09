// run on Server in Sheduled
if ([_this, true, true] call RT_Utils_fnc_callByScriptName) exitWith {};

params [["_hours", 0]];

private _currentMultiplier = timeMultiplier;
setTimeMultiplier 60;
sleep (_hours * 60);
setTimeMultiplier _currentMultiplier;