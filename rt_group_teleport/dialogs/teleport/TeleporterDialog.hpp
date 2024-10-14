//Exported via Arma Dialog Creator (https://github.com/kayler-renslow/arma-dialog-creator)

#include "CustomControlClasses.hpp"
class RT_Teleport_Button
{
	idc = -1;
	x = 0;
	y = 0;
	w = safeZoneW * 0.3;
	h = safeZoneH * 0.05;
	style = 2;
	text = "Position";
	borderSize = 0;
	colorBackground[] = {0.2,0.2,0.2,1};
	colorBackgroundActive[] = {0.4,0.4,0.4,1};
	colorBackgroundDisabled[] = {0,0,0,0};
	colorBorder[] = {0,0,0,0};
	colorDisabled[] = {0.6,0.6,0.6,1};
	colorFocused[] = {0.302,0.302,0.302,1};
	colorShadow[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	font = "PuristaMedium";
	offsetPressedX = 0.01;
	offsetPressedY = 0.01;
	offsetX = 0.01;
	offsetY = 0.01;
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
	soundEnter[] = {"""",0.09,1.0};
	soundEscape[] = {"""",0.09,1.0};
	soundPush[] = {"""",0.09,1.0};
	access = 0;
	shadow = 1;
	
};
class RT_Teleport_Text
{
	idc = -1;
	x = 0;
	y = 0;
	w = 1;
	h = safeZoneH * 0.05;
	style = 2;
	text = "";
	colorBackground[] = {0,0,0,0.15};
	colorText[] = {1,1,1,1};
	font = "PuristaMedium";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	access = 0;
	shadow = 1;
	
};
class TeleporterDialog
{
	idd = -1;
	movingEnable = false;
	enableSimulation = true;
	onUnload="[] call RT_Teleport_fnc_teleportDialogOnUnload"
	
	class ControlsBackground
	{
		class Title : RT_Teleport_Text 
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.35;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.3;
			text = "Where to?";
			
		};
		class PageTitle : RT_Teleport_Text 
		{
			type = 0;
			idc = 21438;
			x = safeZoneX + safeZoneW * 0.425;
			y = safeZoneY + safeZoneH * 0.7;
			w = safeZoneW * 0.15;
			
		};
	};
	class Controls
	{
		class TeleportButton0 : RT_Teleport_Button 
		{
			type = 1;
			idc = 21430;
			x = safeZoneX + safeZoneW * 0.35;
			y = safeZoneY + safeZoneH * 0.325;
			onButtonClick="[0] spawn RT_Teleport_fnc_teleportDialogTeleport;"
		};
		class TeleportButton1 : RT_Teleport_Button 
		{
			type = 1;
			idc = 21431;
			x = safeZoneX + safeZoneW * 0.35;
			y = safeZoneY + safeZoneH * 0.4;
			onButtonClick="[1] spawn RT_Teleport_fnc_teleportDialogTeleport;"
		};
		class TeleportButton2 : RT_Teleport_Button 
		{
			type = 1;
			idc = 21432;
			x = safeZoneX + safeZoneW * 0.35;
			y = safeZoneY + safeZoneH * 0.475;
			onButtonClick="[2] spawn RT_Teleport_fnc_teleportDialogTeleport;"
		};
		class TeleportButton3 : RT_Teleport_Button 
		{
			type = 1;
			idc = 21433;
			x = safeZoneX + safeZoneW * 0.35;
			y = safeZoneY + safeZoneH * 0.55;
			onButtonClick="[3] spawn RT_Teleport_fnc_teleportDialogTeleport;"
		};
		class TeleportButton4 : RT_Teleport_Button 
		{
			type = 1;
			idc = 21434;
			x = safeZoneX + safeZoneW * 0.35;
			y = safeZoneY + safeZoneH * 0.625;
			onButtonClick="[4] spawn RT_Teleport_fnc_teleportDialogTeleport;"
		};
		class LeftPage : RT_Teleport_Button 
		{
			type = 1;
			idc = 21437;
			x = safeZoneX + safeZoneW * 0.35;
			y = safeZoneY + safeZoneH * 0.7;
			w = safeZoneW * 0.05;
			text = "<";
			onButtonClick="[-1] call RT_Teleport_fnc_teleportDialogSetValues;"
		};
		class RightPage : RT_Teleport_Button 
		{
			type = 1;
			idc = 21439;
			x = safeZoneX + safeZoneW * 0.6;
			y = safeZoneY + safeZoneH * 0.7;
			w = safeZoneW * 0.05;
			text = ">";
			onButtonClick="[1] call RT_Teleport_fnc_teleportDialogSetValues;"
			
		};
		class Close : RT_Teleport_Button 
		{
			type = 1;
			idc = 2;
			x = safeZoneX + safeZoneW * 0.675;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.025;
			text = "X";
			colorBackground[] = {0.702,0.102,0.102,1};
			colorBackgroundActive[] = {0.6,0,0,1};
			onLoad="[] call RT_Teleport_fnc_teleportDialogOnLoad"

		};
		
	};
	
};
