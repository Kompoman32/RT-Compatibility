class RscText;
class RscStructuredText;
class RscTitle;
class RscEdit;
class RscButtonMenu;
class RscCombo;



// class RT_PauseDisplay_PlayerSquadInfo: RscText
// {
// 	idc=-1;
// 	colorBackground[]={0,0,0,0.69999999};
// 	x="(1 *  (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX))";
// 	y="((1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY)) + (1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)) + (0.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)))";
// 	w="(15 * (((safezoneW / safezoneH) min 1.2) / 40))";
// 	h="((8 * (1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))) / ((getResolution select 5)/0.55))";
// };

class RT_PauseDisplay_PlayerInfoBase: RscStructuredText
{
	idc=-1;
	colorBackground[]={0,0,0,0.4};
	x="((safezoneW) - 35 *  (((safezoneW / safezoneH) min 1.2) / 40))";
	y="((1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY)) + (1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)) + (0.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)))";
	w="(10 * (((safezoneW / safezoneH) min 1.2) / 40))";
	h="((2 * (1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))) / ((getResolution select 5)/0.55))";
	onLoad="_this call RT_PauseDisplay_fnc_setPlayerInfo"
};






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
	x="(1 *  (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX))";
	y="(1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY))";
	w="(15 * (((safezoneW / safezoneH) min 1.2) / 40))";
	h="(1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
};
class RT_PauseDisplay_AdminToolsBGBase: RscText
{
	idc=-1;
	colorBackground[]={0,0,0,0.69999999};
	x="(1 *  (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX))";
	y="((1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY)) + (1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)) + (0.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)))";
	w="(15 * (((safezoneW / safezoneH) min 1.2) / 40))";
	h="((8 * (1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))) / ((getResolution select 5)/0.55))";
};
// class RT_PauseDisplay_AdminToolsBase: RscEdit
// {
// 	idc=-1;
// 	style=16;
// 	autocomplete="";
// 	shadow=0;
// 	font="EtelkaMonospacePro";
// 	sizeEx="0.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
// 	x="((1 *  (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX)) + (0.5 * (((safezoneW / safezoneH) min 1.2) / 40)))";
// 	y="(((1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY)) + (1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)) + (0.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))) + ((0.5 * (1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))) / ((getResolution select 5)/0.55)))";
// 	w="((15 * (((safezoneW / safezoneH) min 1.2) / 40)) - 2 * (0.5 * (((safezoneW / safezoneH) min 1.2) / 40)))";
// 	h="(((8 * (1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))) / ((getResolution select 5)/0.55)) - 2 * ((0.5 * (1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))) / ((getResolution select 5)/0.55)))";
// };
class RT_PauseDisplay_AdminToolsButtonBase: RscButtonMenu
{
	idc=-1;
	text="Button";
	x="(1 *  (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX))";
	y="(((1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY)) + (1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)) + (0.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))) + ((8 * (1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))) / ((getResolution select 5)/0.55)) + (0.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)))";
	w="(15 * (((safezoneW / safezoneH) min 1.2) / 40))";
	h="(1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
};
// class RT_PauseDisplay_AdminToolsListboxBase: RscCombo
// {
// 	idc=-1;
// 	font="EtelkaMonospacePro";
// 	rowHeight=10;
// 	onLoad="_this call grad_adminMessages_adminMessages_fnc_initListbox";
// 	onUnLoad="uiNamespace setVariable [""grad_adminMessages_adminMessages_sendBoxListboxCtrl"", nil]";
// 	onLBSelChanged="_this call grad_adminMessages_adminMessages_fnc_onRecipientChanged";
// 	x="(1 *  (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX))";
// 	y="(((1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY)) + (1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)) + (0.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))) + ((8 * (1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))) / ((getResolution select 5)/0.55)) + (0.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)))";
// 	w="(15 * (((safezoneW / safezoneH) min 1.2) / 40))";
// 	h="(1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
// };
class RscStandardDisplay;
class RscDisplayMPInterrupt: RscStandardDisplay
{
	class controls
	{
		class RT_PauseDisplay_PlayerInfo: RT_PauseDisplay_PlayerInfoBase {};
		// class RT_PauseDisplay_AdminToolsTitle: RT_PauseDisplay_AdminToolsTitleBase
		// {
		// };
		// class RT_PauseDisplay_AdminToolsBG: RT_PauseDisplay_AdminToolsBGBase
		// {
		// };
		// class RT_PauseDisplay_AdminTools: RT_PauseDisplay_AdminToolsBase
		// {
		// };
		// class RT_PauseDisplay_AdminToolsButton: RT_PauseDisplay_AdminToolsButtonBase
		// {
		// };
		// class RT_PauseDisplay_AdminToolsListBox: RT_PauseDisplay_AdminToolsListboxBase
		// {
		// };
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
		// class RT_PauseDisplay_AdminToolsTitle: RT_PauseDisplay_AdminToolsTitleBase
		// {
		// };
		// class RT_PauseDisplay_AdminToolsBG: RT_PauseDisplay_AdminToolsBGBase
		// {
		// };
		// class RT_PauseDisplay_AdminTools: RT_PauseDisplay_AdminToolsBase
		// {
		// };
		// class RT_PauseDisplay_AdminToolsButton: RT_PauseDisplay_AdminToolsButtonBase
		// {
		// };
		// class RT_PauseDisplay_AdminToolsListBox: RT_PauseDisplay_AdminToolsListboxBase
		// {
		// };
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
		// class RT_PauseDisplay_AdminToolsTitle: RT_PauseDisplay_AdminToolsTitleBase
		// {
		// };
		// class RT_PauseDisplay_AdminToolsBG: RT_PauseDisplay_AdminToolsBGBase
		// {
		// };
		// class RT_PauseDisplay_AdminTools: RT_PauseDisplay_AdminToolsBase
		// {
		// };
		// class RT_PauseDisplay_AdminToolsButton: RT_PauseDisplay_AdminToolsButtonBase
		// {
		// };
		// class RT_PauseDisplay_AdminToolsListBox: RT_PauseDisplay_AdminToolsListboxBase
		// {
		// };
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
		// class RT_PauseDisplay_AdminToolsTitle: RT_PauseDisplay_AdminToolsTitleBase
		// {
		// };
		// class RT_PauseDisplay_AdminToolsBG: RT_PauseDisplay_AdminToolsBGBase
		// {
		// };
		// class RT_PauseDisplay_AdminTools: RT_PauseDisplay_AdminToolsBase
		// {
		// };
		// class RT_PauseDisplay_AdminToolsButton: RT_PauseDisplay_AdminToolsButtonBase
		// {
		// };
		// class RT_PauseDisplay_AdminToolsListBox: RT_PauseDisplay_AdminToolsListboxBase
		// {
		// };
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
		// class RT_PauseDisplay_AdminToolsTitle: RT_PauseDisplay_AdminToolsTitleBase
		// {
		// };
		// class RT_PauseDisplay_AdminToolsBG: RT_PauseDisplay_AdminToolsBGBase
		// {
		// };
		// class RT_PauseDisplay_AdminTools: RT_PauseDisplay_AdminToolsBase
		// {
		// };
		// class RT_PauseDisplay_AdminToolsButton: RT_PauseDisplay_AdminToolsButtonBase
		// {
		// };
		// class RT_PauseDisplay_AdminToolsListBox: RT_PauseDisplay_AdminToolsListboxBase
		// {
		// };
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

