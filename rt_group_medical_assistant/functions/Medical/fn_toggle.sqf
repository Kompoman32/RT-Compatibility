params [["_enable", true]];

player setVariable ["AMA_Medical_Device", _enable ,true];

if (player getVariable ["AMA_Medical_Device",true]) then
{
	hint parseText "<t color='#00ff00' font='PuristaBold'>MEDICAL ASSISTANT ENABLED</t>";
}
else
{
	hint parseText "<t color='#ff0000' font='PuristaBold'>MEDICAL ASSISTANT DISABLED</t>";
}