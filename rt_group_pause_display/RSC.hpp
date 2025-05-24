#define RT_GUI_GRID_WAbs ((safezoneW / safezoneH) min 1.2)
#define RT_GUI_GRID_HAbs (((safezoneW / safezoneH) min 1.2)/ 1.2)
#define RT_GUI_GRID_W (((safezoneW / safezoneH) min 1.2)/ 40)
#define RT_GUI_GRID_H ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25)
#define RT_GUI_GRID_X (safezoneX)
#define RT_GUI_GRID_Y (safezoneY + safezoneH - (((safezoneW / safezoneH) min 1.2)/ 1.2))

class RscText;
class RscButton;
class RscButtonTextOnly;
class RscStructuredText;
class RscTitle;
class RscXSliderH;
class RscControlsGroup;
class RscCheckBox;

// Player Info
class RT_PauseDisplay_PlayerInfoBase: RscStructuredText
{
	idc=4242;
	colorBackground[]={0,0,0,0};
	x="((safezoneW) - 35 *  (((safezoneW / safezoneH) min 1.2) / 40))";
	y="((1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY)) + (1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)) + (0.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)))";
	w="(10 * (((safezoneW / safezoneH) min 1.2) / 40))";
	h="((2 * (1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))) / ((getResolution select 5)/0.55))";
	onLoad="_this call RT_PauseDisplay_fnc_setPlayerInfo"
};



// Admin tools Title
class RT_PauseDisplay_AdminToolsTitleBase: RscTitle
{
	idc=-1;
	style=0;
	text="Admin Tools";
	colorBackground[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"
	};
	x="safezoneW + safezoneX - (16 *  (((safezoneW / safezoneH) min 1.2)/ 40))";
	y="(1 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25) + (safezoneY))";
	w="(15 * (((safezoneW / safezoneH) min 1.2)/ 40))";
	h="(1 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25))";
	onLoad="_this call RT_PauseDisplay_fnc_hideControlIfNoZeus"
};

// Admin tools Background
class RT_PauseDisplay_AdminToolsBGBase: RscText
{
	idc=-1;
	style=0;
	colorBackground[]={0, 0, 0, 0.7};
	x="safezoneW + safezoneX - (16 *  (((safezoneW / safezoneH) min 1.2)/ 40))";
	y="(2 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25) + (safezoneY))";
	w="(15 * (((safezoneW / safezoneH) min 1.2)/ 40))";
	h="(6.1 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25) + 2 * 0.029412)";
	onLoad="_this call RT_PauseDisplay_fnc_hideControlIfNoZeus"
};

// Admin tools Ace Hearing
class RT_PauseDisplay_AdminToolsAceHearingGroupBase: RscControlsGroup
{
	idc=21430;
	x="safezoneW + safezoneX - (16 *  (((safezoneW / safezoneH) min 1.2)/ 40))";
	y="(2.1 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25) + (safezoneY))";
	w="(15 * (((safezoneW / safezoneH) min 1.2)/ 40))";
	h="(2 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25))";

	color[] = {1,1,1,1};

	onLoad="_this call RT_PauseDisplay_fnc_hideControlIfNoZeus"

	class ScrollBar;

	class VScrollbar : ScrollBar
	{
		color[] = {1,1,1,0};
		width = 0;
		autoScrollEnabled = 1;
	};
	class HScrollbar : ScrollBar
	{
		color[] = {1,1,1,0};
		height = 0;
	};

	class Controls
	{
		class DisableVolumeUpdateLabel: RscText 
		{
			idc=-1;
			text="ace_hearing_disableVolumeUpdate"
			x="1 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25))";
			y="0";
			h="(1 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25))";
			w="(14 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25))";
			colorText[] = {1,1,1,1};
			color[] = {1,1,1,1};
		};
		class DisableVolumeUpdateCheckbox: RscCheckBox 
		{
			idc=-1;
			x="0";
			y="(0.1 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25))";
			h="(0.9 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25))";
			w="(0.9 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25))";
			onLoad="_this#0 cbSetChecked ace_hearing_disableVolumeUpdate;"
			onCheckedChanged="missionNamespace setVariable ['ace_hearing_disableVolumeUpdate', _this#1 > 0, true]"
			colorText[] = {1,1,1,1};
			color[] = {1,1,1,1};
		};

		class EnableNoiseDuckingLabel: DisableVolumeUpdateLabel 
		{
			idc=-1;
			text="ace_hearing_enableNoiseDucking"
			y="(1 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25))";
		};

		class EnableNoiseDuckingCheckbox: DisableVolumeUpdateCheckbox 
		{
			idc=-1;
			y="(1.1 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25))";
			onLoad="_this#0 cbSetChecked ace_hearing_enableNoiseDucking;"
			onCheckedChanged="missionNamespace setVariable ['ace_hearing_enableNoiseDucking', _this#1 > 0, true]"
		};
	};
};

// ace_hearing_enableNoiseDucking = true
// 
// missionNamespace getVariable ["ace_hearing_disableVolumeUpdate", false]

// Admin tools Sound group
class RT_PauseDisplay_AdminToolsSoundGroupBase: RscControlsGroup
{
	idc=21431;
	colorBackground[]={0, 0, 0, 0.7};
	x="safezoneW + safezoneX - (16 *  (((safezoneW / safezoneH) min 1.2)/ 40))";
	y="(4.1 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25) + (safezoneY))";
	w="(15 * (((safezoneW / safezoneH) min 1.2)/ 40))";
	h="(1 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25)) + 0.029412";

	onLoad="_this call RT_PauseDisplay_fnc_hideControlIfNoZeus"

	class ScrollBar;

	class VScrollbar : ScrollBar
	{
		color[] = {1,1,1,0};
		width = 0;
		autoScrollEnabled = 1;
	};
	class HScrollbar : ScrollBar
	{
		color[] = {1,1,1,0};
		height = 0;
	};

	class Controls
	{
		class SoundSliderLabel: RscText 
		{
			idc=-1;
			text="Sound Volume";
			h="(1 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25))";
		};

		class SoundSliderButton: RscButtonTextOnly 
		{
			idc=-1;
			text=">>";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
			y="0";
			x="(13 * (((safezoneW / safezoneH) min 1.2)/ 40))";
			h="(1 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25))";
			w="(1 * (((safezoneW / safezoneH) min 1.2)/ 40))";
			onButtonClick="_this call RT_PauseDisplay_fnc_setSound";
		};

		class SoundSlider: RscXSliderH 
		{
			idc=1;
			sliderRange[] = {0, 1};
			sliderStep = 0.1;
			color[] = {1,1,1,1};
			y="(1 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25))";
			x="(0.5 * (((safezoneW / safezoneH) min 1.2)/ 40))";
			w="(12.5 * (((safezoneW / safezoneH) min 1.2)/ 40))";
			onSliderPosChanged="_this call RT_PauseDisplay_fnc_setSoundSliderText";
		};

		class SoundSliderText: RscText 
		{
			idc=2;
			text="";
			y="(1 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25))";
			h = "0.029412";
			x="(13 * (((safezoneW / safezoneH) min 1.2)/ 40))";
			w="(1.5 * (((safezoneW / safezoneH) min 1.2)/ 40))";
			onLoad="[_this#0, soundVolume] call RT_PauseDisplay_fnc_setSoundSlider";
		};

	};
};

// Admin tools music group
class RT_PauseDisplay_AdminToolsMusicGroupBase: RT_PauseDisplay_AdminToolsSoundGroupBase
{
	idc=21432;
	y="(5.1 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25) + (safezoneY)) + 0.029412";

	onLoad="_this call RT_PauseDisplay_fnc_hideControlIfNoZeus"

	class Controls
	{
		class SoundSliderLabel: RscText 
		{
			idc=-1;
			text="Music Volume";
			text="Sound Volume";
			h="(1 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25))";
		};

		class SoundSliderButton: RscButtonTextOnly 
		{
			idc=-1;
			text=">>";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
			x="(13 * (((safezoneW / safezoneH) min 1.2)/ 40))";
			h="(1 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25))";
			w="(1 * (((safezoneW / safezoneH) min 1.2)/ 40))";
			onButtonClick="[_this#0, true] call RT_PauseDisplay_fnc_setSound";
		};

		class SoundSlider: RscXSliderH 
		{
			idc=1;
			sliderRange[] = {0, 1};
			sliderStep = 0.1;
			color[] = {1,1,1,1};
			y="(1 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25))";
			x="(0.5 * (((safezoneW / safezoneH) min 1.2)/ 40))";
			w="(12.5 * (((safezoneW / safezoneH) min 1.2)/ 40))";
			onSliderPosChanged="_this call RT_PauseDisplay_fnc_setSoundSliderText";
		};

		class SoundSliderText: RscText 
		{
			idc=2;
			text="";
			y="(1 * ((((safezoneW / safezoneH) min 1.2)/ 1.2)/ 25))";
			h = "0.029412";
			x="(13 * (((safezoneW / safezoneH) min 1.2)/ 40))";
			w="(1.5 * (((safezoneW / safezoneH) min 1.2)/ 40))";
			onLoad="[_this#0, musicVolume] call RT_PauseDisplay_fnc_setSoundSlider";
		};
	};
};




class RscStandardDisplay;
class RscDisplayMPInterrupt: RscStandardDisplay
{
	class controls
	{
		class RT_PauseDisplay_PlayerInfo: RT_PauseDisplay_PlayerInfoBase {};
		class RT_PauseDisplay_AdminToolsAceHearingGroup: RT_PauseDisplay_AdminToolsAceHearingGroupBase {};
		class RT_PauseDisplay_AdminToolsTitle: RT_PauseDisplay_AdminToolsTitleBase {};
		class RT_PauseDisplay_AdminToolsBG: RT_PauseDisplay_AdminToolsBGBase {};
		class RT_PauseDisplay_AdminToolsSoundGroup: RT_PauseDisplay_AdminToolsSoundGroupBase {};
		class RT_PauseDisplay_AdminToolsMusicGroup: RT_PauseDisplay_AdminToolsMusicGroupBase {};
	};
	class controlsBackground
	{
		class Pause1: RscText {
			y="safezoneY - 1";
		};
		class Pause2: Pause1 {
			y="safezoneY - 1";
		};
	};
};
class RscDisplayInterruptEditorPreview: RscStandardDisplay
{
	class controls
	{
		class RT_PauseDisplay_PlayerInfo: RT_PauseDisplay_PlayerInfoBase {};
		class RT_PauseDisplay_AdminToolsAceHearingGroup: RT_PauseDisplay_AdminToolsAceHearingGroupBase {};
		class RT_PauseDisplay_AdminToolsTitle: RT_PauseDisplay_AdminToolsTitleBase {};
		class RT_PauseDisplay_AdminToolsBG: RT_PauseDisplay_AdminToolsBGBase {};
		class RT_PauseDisplay_AdminToolsSoundGroup: RT_PauseDisplay_AdminToolsSoundGroupBase {};
		class RT_PauseDisplay_AdminToolsMusicGroup: RT_PauseDisplay_AdminToolsMusicGroupBase {};
	};
	class controlsBackground
	{
		class Pause1: RscText {
			y="safezoneY - 1";
		};
		class Pause2: Pause1 {
			y="safezoneY - 1";
		};
	};
};
class RscDisplayInterrupt: RscStandardDisplay
{
	class controls
	{
		class RT_PauseDisplay_PlayerInfo: RT_PauseDisplay_PlayerInfoBase {};
		class RT_PauseDisplay_AdminToolsAceHearingGroup: RT_PauseDisplay_AdminToolsAceHearingGroupBase {};
		class RT_PauseDisplay_AdminToolsTitle: RT_PauseDisplay_AdminToolsTitleBase {};
		class RT_PauseDisplay_AdminToolsBG: RT_PauseDisplay_AdminToolsBGBase {};
		class RT_PauseDisplay_AdminToolsSoundGroup: RT_PauseDisplay_AdminToolsSoundGroupBase {};
		class RT_PauseDisplay_AdminToolsMusicGroup: RT_PauseDisplay_AdminToolsMusicGroupBase {};
	};
	class controlsBackground
	{
		class Pause1: RscText {
			y="safezoneY - 1";
		};
		class Pause2: Pause1 {
			y="safezoneY - 1";
		};
	};
};
class RscDisplayInterruptEditor3D: RscStandardDisplay
{
	class controls
	{
		class RT_PauseDisplay_PlayerInfo: RT_PauseDisplay_PlayerInfoBase {};
		class RT_PauseDisplay_AdminToolsAceHearingGroup: RT_PauseDisplay_AdminToolsAceHearingGroupBase {};
		class RT_PauseDisplay_AdminToolsTitle: RT_PauseDisplay_AdminToolsTitleBase {};
		class RT_PauseDisplay_AdminToolsBG: RT_PauseDisplay_AdminToolsBGBase {};
		class RT_PauseDisplay_AdminToolsSoundGroup: RT_PauseDisplay_AdminToolsSoundGroupBase {};
		class RT_PauseDisplay_AdminToolsMusicGroup: RT_PauseDisplay_AdminToolsMusicGroupBase {};
	};
	class controlsBackground
	{
		class Pause1: RscText {
			y="safezoneY - 1";
		};
		class Pause2: Pause1 {
			y="safezoneY - 1";
		};
	};
};
class RscDisplayMovieInterrupt: RscStandardDisplay
{
	class controls
	{
		class RT_PauseDisplay_PlayerInfo: RT_PauseDisplay_PlayerInfoBase {};
		class RT_PauseDisplay_AdminToolsAceHearingGroup: RT_PauseDisplay_AdminToolsAceHearingGroupBase {};
		class RT_PauseDisplay_AdminToolsTitle: RT_PauseDisplay_AdminToolsTitleBase {};
		class RT_PauseDisplay_AdminToolsBG: RT_PauseDisplay_AdminToolsBGBase {};
		class RT_PauseDisplay_AdminToolsSoundGroup: RT_PauseDisplay_AdminToolsSoundGroupBase {};
		class RT_PauseDisplay_AdminToolsMusicGroup: RT_PauseDisplay_AdminToolsMusicGroupBase {};
	};
	class controlsBackground
	{
		class Pause1: RscText {
			y="safezoneY - 1";
		};
		class Pause2: Pause1 {
			y="safezoneY - 1";
		};
	};
};

