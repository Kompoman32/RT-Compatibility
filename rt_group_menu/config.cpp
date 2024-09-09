
class CfgPatches
{
	class RT_Menu
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Data_F_Enoch_Loadorder"};
	};
};
class Attributes;
class RscStandardDisplay;
class RscProgress;
class RscStructuredText;
class RscPicture;
class RscButton;
class RscShortcutButton;
class RscButtonMenu;
class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscText;
class RscVignette;
class RscDisplayGetReady;
class RscActiveText;
class RscListBox;
class RscListNBox;
class RscCombo;
class RscXListBox;
class RscHTML;
class RscPictureKeepAspect;
class RscActivePicture;
class RscMapControl;
class RscControlsGroupNoScrollbars;
class RscControlsGroupNoHScrollbars;
class RscFrame;
class RscTitle;
class CA_Title;
class RscDebugConsole;
class RscTrafficLight;
class RscFeedback;
class RscMessageBox;
class RscControlsGroup;
class RscTextCheckbox;
class RscDisplayInventory_DLCTemplate;
class RscEdit;
class RscCheckBox;
class RscIGProgress;
class RscHitZones;
class RscIGUIText;
class RscIGUIValue;
class RscOpticsValue;
class RscOpticsText;
class Scrollbar;
class RscIGUIShortcutButton;
class RscActivePictureKeepAspect;
class RscTree;
class RscXSliderH;
class RscObject;
class ctrlMenu;
class ctrlStaticPicture;
class RscButtonMenuSteam;
class RscButtonTextOnly;

// Main Menu
class RscMainMenuSpotlight: RscControlsGroupNoScrollbars
{
    fade=0;
	show = 1;
	onLoad = "";
    y="0.9 - (	10 / 2) * 	(pixelH * pixelGridNoUIScale * 2)";
};
class RscDisplayMain:RscStandardDisplay{
    class controls {
        class BackgroundSpotlight:Rscpicture {
            show=0;
            onload="";
        };
        class BackgroundSpotlightLeft:BackgroundSpotlight {
            show=0;
            onload="";
        };
        class BackgroundSpotlightRight:BackgroundSpotlightLeft {
            show=0;
            onload="";
        };
        class Spotlight1:RscMainMenuSpotlight {
            idc=1021;
            show=1;
            onload="";
        };
        class Spotlight2:Rsctext {
            idc=1020;
            show=1;
            onload="";
            y="0.9 - (	10 / 2) * 	(pixelH * pixelGridNoUIScale * 2)";
        };
        class Spotlight3:RscMainMenuSpotlight {
            idc=1022;
            show=1;
            onload="";
        };
        class SpotlightPrev:RscActivepictureKeepAspect {
            idc=1060;
            show=1;
            onload="";
			y="0.9 - (	10 / 2 + (	10 / 8)) * 	(pixelH * pixelGridNoUIScale * 2)";
        };
        class SpotlightNext:SpotlightPrev {
            show= 1;
            onload="";
			y="0.9 + (	10 / 2) * 	(pixelH * pixelGridNoUIScale * 2)";
        };
        class InfoMods:RscControlsgroupNoHScrollbars {
            show=0;
        };
        class InfoDLCsOwned:InfoMods {
            show=0;
        };
        class InfoDLCs:InfoDLCsOwned {
            show=0;
        };
        class InfoNews:InfoMods {
            show=0;
        };
        class InfoVersion:InfoNews {
            show=0;
        };
    };
};
class CfgWorlds {
	class CAWorld;

	class VR : CAWorld {
		cutscenes[] = {"mymainmenu"};
	};

	initWorld = "VR";
	demoWorld = "VR";
};

class CfgMissions
{
	class Cutscenes
	{
		class mymainmenu // Class referenced in 'cutscenes' property in CfgWorlds
		{
			directory = "rt\menu\mainmenu.vr"; // Path to scenario with the scene
		};
	};
};


class CfgMainMenuSpotlight 
{
    class JoinServer
	{
		text = "RT Group Server";
		picture = "rt\menu\assets\rt_group_logo_ca.paa";
		video = "rt\menu\assets\Logo_RT_Showcase.ogv";
		action = "connectToServer ['85.190.163.71', 19000, '']";
		actionText = "Join the RT Group Server";
		condition = "true";
	};
};
