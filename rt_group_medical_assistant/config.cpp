#include "CfgPatches.hpp"
#include "CfgFunctions.hpp"
#include "CfgEventHandlers.hpp"

class RscControlsGroup;
class RscButtonTextOnly;
class RscText;
class RscStructuredText;
class ScrollBar;

class AMA_menu {
	onLoad = "[180025] spawn AMA_fnc_dialogFadeIn; 0 spawn RT_Medical_Assistant_fnc_onGroupButtonClick";

	class controls
	{
		class Additional_ControlGroup: RscControlsGroup
		{
			idc=957;
			x="0.298906 * safezoneW + safezoneX ";
			y="(0.236 + 0.528) * safezoneH + safezoneY";
			w="0.402187 * safezoneW";
			h="0.3 * safezoneH";
			class Controls
			{
				class ExitButton: RscButtonTextOnly
				{
					idc=-1;
					x="0.23 * safezoneW";
					y="0.042 * safezoneH";
					w="0.0171 * safezoneW";
					h="0.0275 * safezoneH";
					text="";
					tooltip="Close"
					onButtonClick="(findDisplay 180025) closeDisplay 2"
				};

				class Group1Button: RscButtonTextOnly
				{
	  				idc=-1;
					x="0.0733 * safezoneW";
					y="0.042 * safezoneH";
					w="0.016 * safezoneW";
					h="0.0275 * safezoneH";
					text="";
					tooltip="Group 1"
					onButtonClick="0 call RT_Medical_Assistant_fnc_onGroupButtonClick"
				};

				class Group2Button: RscButtonTextOnly
				{
	  				idc=-1;
					x="0.0925 * safezoneW";
					y="0.042 * safezoneH";
					w="0.016 * safezoneW";
					h="0.0275 * safezoneH";
					text="";
					tooltip="Group 2"
					onButtonClick="1 call RT_Medical_Assistant_fnc_onGroupButtonClick"
				};

				class Group3Button: RscButtonTextOnly
				{
	  				idc=-1;
					x="0.1117 * safezoneW";
					y="0.042 * safezoneH";
					w="0.016 * safezoneW";
					h="0.0275 * safezoneH";
					text="";
					tooltip="Group 3"
					onButtonClick="2 call RT_Medical_Assistant_fnc_onGroupButtonClick"
				};

				class Group4Button: RscButtonTextOnly
				{
	  				idc=-1;
					x="0.131 * safezoneW";
					y="0.042 * safezoneH";
					w="0.016 * safezoneW";
					h="0.0275 * safezoneH";
					text="";
					tooltip="Group 4"
					onButtonClick="3 call RT_Medical_Assistant_fnc_onGroupButtonClick"
				};

				class Group5Button: RscButtonTextOnly
				{
	  				idc=-1;
					x="0.1502 * safezoneW";
					y="0.042 * safezoneH";
					w="0.016 * safezoneW";
					h="0.0275 * safezoneH";
					text="";
					tooltip="Group 5"
					onButtonClick="4 call RT_Medical_Assistant_fnc_onGroupButtonClick"
				};

				class Group6Button: RscButtonTextOnly
				{
	  				idc=-1;
					x="0.1694 * safezoneW";
					y="0.042 * safezoneH";
					w="0.016 * safezoneW";
					h="0.0275 * safezoneH";
					text="";
					tooltip="Group 6"
					onButtonClick="5 call RT_Medical_Assistant_fnc_onGroupButtonClick"
				};

				class GroupAllButton: RscButtonTextOnly
				{
	  				idc=-1;
					x="0.191 * safezoneW";
					y="0.032 * safezoneH";
					w="0.017 * safezoneW";
					h="0.022 * safezoneH";
					text="";
					tooltip="All Units"
					onButtonClick="-1 call RT_Medical_Assistant_fnc_onGroupButtonClick"
				};
			};
		};

		class GroupTextBG: RscStructuredText
		{
			idc=9580;
			x="0.5 - (0.025 * safezoneW) / 2";
			y="1 - 0.02873333 * safezoneH";
			w="0.025 * safezoneW";
			h="0.01833333 * safezoneH";
			colorBackground[] = {0,0,0,1};
			text="";
			align = "center";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)/1.5";
		};
		class GroupText: GroupTextBG
		{
			idc=9581;
			colorBackground[] = {0,0.0941176,0.25098,0.8};
			text="Group 1";
		};
	};
};

class ace_medical_replacementItems {
    ItemType_401[] = {
		{"ACE_fieldDressing", 3},
		{"ACE_painkillers", 1},
		{"ACE_splint", 1},
		{"ACE_tourniquet", 1}
    };
    ItemType_619[] = {
		{"ACE_fieldDressing", 6},
		{"ACE_epinephrine", 2},
		{"ACE_morphine", 2},
		{"ACE_tourniquet", 1},
		{"ACE_splint", 1},
		{"ACE_suture", 1},
		{"ACE_painkillers", 1},
		{"ACE_adenosine", 1},
		{"ACE_salineIV_250", 1}
    };
};
