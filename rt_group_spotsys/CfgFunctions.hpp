class CfgFunctions
{
	class RT_SpotSystem
	{
		class Main {
            file = "rt\spotsys\Functions\Main";
			class clientSpotTarget;
			class serverSpotTarget;
			class enable;
			class enableRemote;
			class enableRemoteServer;
			class disableRemote;
			class enableWallhack;
		};
		class Draw {
            file = "rt\spotsys\Functions\Draw";
			class drawEvent;
			class drawEventDrawIcon;
			class drawEventDrawSkeleton;
			class drawEventDraw;
			class drawEventGetCords;
			class drawMapEvent;
		};
		class Voice
		{
            file = "rt\spotsys\Functions\Voice";
			class spawnPlayMouthAnim;
			class spawnPlaySpotVoiceLine;
		};
		class Utils
		{
            file = "rt\spotsys\Functions\Utils";
			class getCursorTarget;
			class getCardinalDirectionName;
			class canSee;
			class canSeeBySide;
			class isWallhackEnabled;
			class isGrenade;
		}
	};
};
