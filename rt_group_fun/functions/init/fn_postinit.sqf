/** Only if real player */
if (!hasInterface) exitwith {};

params ["_event", "_JIP"];

["ace_glassesCracked", {
	params ["_unit"];

	if (!(isPlayer _unit)) exitWith {};
	if (goggles _unit !=  "G_Goggles_VR") exitWith {};
	
	playSoundUI ["RTBoom"];
}] call CBA_fnc_addEventHandler