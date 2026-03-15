params ["_grenade"];

if !(_grenade isKindOf "Grenade") exitWith {false};
if (ACE_player getVariable ["ACE_advanced_throwing_activeThrowable", objNull] == _grenade) exitWith {false};

if ((configfile >> "CfgAmmo" >> typeOf _grenade >> "ACE_grenades_incendiary") call BIS_fnc_getCfgDataBool) exitWith {true};
if ((configfile >> "CfgAmmo" >> typeOf _grenade >> "ACE_grenades_flashbang") call BIS_fnc_getCfgDataBool) exitWith {true};

if (_grenade isKindOf "SmokeShell") exitWith {false};

true