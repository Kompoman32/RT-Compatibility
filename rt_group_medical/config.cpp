#include "CfgPatches.hpp"
#include "CfgFunctions.hpp"

class RscControlsGroup;
class RscButtonTextOnly;

class AMA_menu {
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
	  				idc=9571;
					x="0.23 * safezoneW";
					y="0.042 * safezoneH";
					w="0.0171 * safezoneW";
					h="0.0275 * safezoneH";
					text="";
					tooltip="Close"
					onButtonClick="(findDisplay 180025) closeDisplay 2"
				};
			};
		};
	};
};

class ace_medical_treatment_actions
{
	class BasicBandage
	{
		treatmentTime="call RT_Medical_fnc_getBandageTime";
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
