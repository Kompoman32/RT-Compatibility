params [["_control", controlNull]];

if (isNull _control) exitWith {};

_control ctrlShow ([] call RT_Utils_fnc_isAdminOrZeus);