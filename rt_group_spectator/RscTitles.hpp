class RscStructuredText;

class RscTitles {
    class Rsc_RT_Spectator_UI {
        idd = 21430;
        movingEnable = 1;
        duration = 1e+011;
        fadein = 0.5;
        fadeout = 0;
        name = "Rsc_RT_Spectator_UI";
        onLoad = " call RT_Spectator_fnc_spectatorQuotesDisplayOnLoad";

        class controls {
            class RTSpecatorEnterMessage: RscStructuredText {
                idc = 1;
                text = "$STR_RT_SPECTATOR_Enter";
                colorText[] = {1, 1, 1, 1};
                colorBackground[] = {0.2, 0.2, 0.2, 0.1};
                x = "safeZoneW / 2 + safeZoneX - 0.25";
                y = "safeZoneH + safeZoneY - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * 2.5 * 2";
                w = "0.5";
                h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * 2.5";
            };

            class RTSpecatorQuoteMessage: RscStructuredText {
                idc = 2;
                text = "";
                fadein = 3;
                fadeout = 0;
                colorText[] = {1, 1, 1, 1};
                colorBackground[] = {0, 0, 0, 0};
                shadow = 1;
            };
        }
    };
};
