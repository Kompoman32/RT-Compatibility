#define pixelScale  0.25

#define GRID_W (pixelW * pixelGridNoUIScale * pixelScale)
#define GRID_H (pixelH * pixelGridNoUIScale * pixelScale)

#define WIDTH_GAP (WIDTH_TOTAL / 100)
#define WIDTH_TOTAL (safeZoneW - 2 * (93 * GRID_W))
#define WIDTH_SINGLE ((WIDTH_TOTAL - 7 * WIDTH_GAP) / 6)

#define QUOTE(var1) #var1

class RscButtonArsenal;

class ace_arsenal_display {
    class controls {
		class musicButton: RscButtonArsenal {
			idc = 999;
			colorBackground[] = {0,0,0,0.8};
			x = QUOTE(0.5 - WIDTH_TOTAL / 2 + 6 * WIDTH_GAP + 6 * WIDTH_SINGLE - 12 * GRID_W);
            y = QUOTE(safeZoneH + safeZoneY - 17 * GRID_H);
			w = QUOTE(12 * GRID_W);
			h = QUOTE(7 * GRID_H);
			fade = 0;
			text = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_music_on_ca.paa";
			tooltip = "$STR_RT_FUN_disable_music";
			onButtonClick = "call RT_FUN_fnc_onDisableLocalArsenalMusic";
		};
	};
};