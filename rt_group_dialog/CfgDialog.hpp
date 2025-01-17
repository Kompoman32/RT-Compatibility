class DialogOptionButton
{
	idc = -1;
	type = 1;
	x = 0;
	y = 0;
	w = safeZoneW * 0.92083334 - 0.021;
	h = safeZoneH * 0.05370371;
	style = ST_MULTI;
	text = "Option";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorBackgroundActive[] = {0,0,0,1};
	colorBackgroundDisabled[] = {0,0,0,0.5};
	colorBorder[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorFocused[] = {0,0,0,1};
	colorShadow[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "RobotoCondensed";
	offsetPressedX = 0;
	offsetPressedY = 0;
	offsetX = 0;
	offsetY = 0;
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1.0};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1.0};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1.0};
	soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1.0};
	blinkingPeriod = 0;
	period = 0;
	
};

class DialogSystem
{
	idd = 2143;
	
	class ControlsBackground
	{
		class SpeakerSpeach
		{
			type = 13;
			idc = 999;
			x = safeZoneX + safeZoneW * 0.01979167;
			y = safeZoneY + safeZoneH * 0.55833334;
			w = safeZoneW * 0.96041667;
			h = 0; //safeZoneH * 0.1;
			style = ST_MULTI;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {0,0,0,0.5};

			class Attributes{};
		};
		
	};
	class Controls
	{
		class DialogOptionsGroup
		{
			type = 15;
			idc = 10;
			style = ST_MULTI;
			x = safeZoneX + safeZoneW * 0.03958334;
			y = safeZoneY + safeZoneH * 0.67870371;
			w = safeZoneW * 0.92083334;
			h = safeZoneH * 0.31388889;
			shadow = 0;

			class ScrollBar
			{
				color[] = {1,1,1,1};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";

			};
			class VScrollbar : ScrollBar
			{
				width = 0.021;
				shadow = 0;
				scrollSpeed = 0.08;
			};
			class HScrollbar : ScrollBar
			{
				height = 0.028;
				shadow = 0;
			};
			class Controls
			{}
		}
	};
};