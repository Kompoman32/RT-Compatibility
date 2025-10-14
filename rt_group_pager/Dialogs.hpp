class RscControlsGroup;
class RscButtonTextOnly;
class RscText;
class RscStructuredText;
class ScrollBar;
class RscPicture;
class RscPictureKeepAspect;
class RscStructuredText;
class RscEdit;


class RscTitles {
    class RSC_RT_Pager {
        idd=-1;
        duration = 1e+011;
        fadein = 0.5;
        fadeout = 0.5;
        name="Pager";
        movingEnable=0;
        enableSimulation=1;
        onLoad = "uiNamespace setVariable [RT_PAGER_VAR_RSC,_this#0]";

        class controlsBackground
        {
            class Background_Image: RscPictureKeepAspect
            {
                idc=-1;
                colorBackground[] = {0,0,0,0};
                x="safeZoneX - 0.07";
                y="safezoneY + 0.05";
                w="0.5";
                h="0.25";
                text="rt\pager\pager.paa"
            };
        };
        class controls
        {
            class Text: RscText
            {
                idc=1;
                x="safezoneX + 0.09";
                y="safezoneY + 0.09";
                w="0.186";
                h="0.103";
                colorBackground[] = {0,0,0,0};
                colorText[] = {0,0,0,1};
                text="          ";
                fixedWidth = 1;
                font="LCD14";
            };
        };
    };
};


class RT_Pager {
    idd=786786;
    fadein = 0.5;
    fadeout = 0.5;
    name="Pager";
    movingEnable=1;
    enableSimulation=1;
    onLoad = "call RT_PAGER_fnc_pagerOnLoad";
    onKeyUp = "call RT_PAGER_fnc_pagerOnKeyUp";

    class controlsBackground
    {
        class Background_Image: RscPictureKeepAspect
        {
            idc=-1;
            colorBackground[] = {0,0,0,0};
            x="(safeZoneX +(safeZoneW) / 2 - 0.75/2)";
            y="(safeZoneY +(safeZoneH) / 2 - 0.375/2)";
            w="0.75";
            h="0.375";
            text="rt\pager\pager.paa"
        };
    };
    class controls
    {
        class Text: RscEdit
        {
            idc=1;
            x="(safeZoneX +(safeZoneW) / 2 - 0.293/2) + 0.004";
            y="((safeZoneY +(safeZoneH) / 2 - 0.103/2)) - 0.05";
            w="0.293";
            h="0.103";
            colorBackground[] = {0,0,0,0};
            colorText[] = {0,0,0,1};
            text="";
            autocomplete="";
            fixedWidth = 1;
            style="0x200+0xC0";
            font="LCD14";
            sizeEx="2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

            onLoad = "call RT_PAGER_fnc_pagerOnLoadEditControl";
            onDestroy = "if ((uiNameSpace getVariable [RT_PAGER_VAR_Pager_Page, 'message']) == 'message') then { uiNameSpace setVariable [RT_PAGER_VAR_Pager_Message, ctrlText (_this#0)] };";
            onEditChanged="(_this#0) ctrlSetText (toUpper (_this#1))";
        };

        class ButtonsGroup: RscControlsGroup
        {
            idc=-1;
            x="(safeZoneX + (safeZoneW) / 2 - 0.75/2) + 0.084 * safezoneW";
            y="(safeZoneY + (safeZoneH) / 2 - 0.375/2) + 0.141 * safezoneH";
            w="0.75";
            h="0.042 * safezoneH";

            colorBackground[] = {1,0,0,0.2};

            class Controls
            {
                class PrevButton: RscButtonTextOnly
                {
                    idc=-1;
                    x="0";
                    y="0";
                    w="0.027 * safezoneW";
                    h="0.042 * safezoneH";
                    text="";
                    tooltip="Previous Recipient"
                    colorBackground[] = {0,0,0,0};
                    onButtonClick="call RT_PAGER_fnc_pagerPrevRecipientClick"
                };

                class NextButton: RscButtonTextOnly
                {
                    idc=-1;
                    x="0.0345 * safezoneW";
                    y="0";
                    w="0.027 * safezoneW";
                    h="0.042 * safezoneH";
                    text="";
                    tooltip="Next Recipient"
                    colorBackground[] = {0,0,0,0};
                    onButtonClick="call RT_PAGER_fnc_pagerNextRecipientClick"
                };


                class SendButton: RscButtonTextOnly
                {
                    idc=-1;
                    x="0.0695 * safezoneW";
                    y="0";
                    w="0.027 * safezoneW";
                    h="0.042 * safezoneH";
                    text="";
                    tooltip="Send"
                    colorBackground[] = {0,0,0,0};
                    onButtonClick="call RT_PAGER_fnc_pagerSendClick"
                };

                class PowerButton: RscButtonTextOnly
                {
                    idc=-1;
                    x="0.105 * safezoneW";
                    y="0";
                    w="0.0385 * safezoneW";
                    h="0.042 * safezoneH";
                    text="";
                    colorBackground[] = {0,0,0,0};
                    tooltip="Close/Cancel"
                    onButtonClick="call RT_PAGER_fnc_pagerCloseClick"
                };
            };
        };
    };
};
