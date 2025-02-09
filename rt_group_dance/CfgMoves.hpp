
class CfgMovesBasic;
class CfgMovesMaleSdr : CfgMovesBasic
{
    skeletonName = "OFP2_ManSkeleton";
    gestures = "CfgGesturesMale";

    class States
    {
        class CutSceneAnimationBase;
        class rt_dances : CutSceneAnimationBase
        {
            actions = "NoActions";
            looped = 1;
            showHandGun = 1;
            showItemInHand = 0;
            canPullTrigger = 1;
            showWeaponAim = 0;

            weaponLowered = 0;

            disableWeapons = 0;
            disableWeaponsLong = 0;
            head = "headNo";
            interpolationSpeed = 2;
            weaponIK = 0;

            aiming = "empty";
            leaning = "empty";
            aimingBody = "empty";
        };

        class A3_Dance1 : rt_dances
        {
            file = "\a3\Anims_F_Exp\Data\Anim\sdr\cts\civ\dancing\dance01.rtm";
            speed = 0.0399;
        };
        class A3_Dance2 : rt_dances
        {
            file = "\a3\Anims_F_Exp\Data\Anim\sdr\cts\civ\dancing\dance02.rtm";
            speed = 0.048;
        };
        class TPose : rt_dances
        {
            file = "rt\dance\dances\tpose.rtm";
            speed = -10000000000;
        };

        // WebKnight - Improved Melee System
        // src: https://steamcommunity.com/sharedfiles/filedetails/?id=2291129343
        class WBK_SecretAnim_Dance : rt_dances
        {
            file = "rt\dance\dances\wbk-ims\wbk_californiagirls.rtm";
            speed = -11;
        };

        // ASmallDinosaur - Animate
        // src: https://steamcommunity.com/sharedfiles/filedetails/?id=2819732932
        class a2_dances : rt_dances
        {
        };
        class a2_duoivan : a2_dances
        {
            file = "rt\dance\dances\tsp\ActsPercMstpSnonWnonDnon_DancingDuoIvan.rtm";
            speed = 0.025000;
        };
        class a2_duostefan : a2_dances
        {
            file = "rt\dance\dances\tsp\ActsPercMstpSnonWnonDnon_DancingDuoStefan.rtm";
            speed = 0.025000;
        };
        class a2_stefan : a2_dances
        {
            file = "rt\dance\dances\tsp\ActsPercMstpSnonWnonDnon_DancingStefan.rtm";
            speed = 0.010400;
        };
        class a2_zozo : a2_dances
        {
            file = "rt\dance\dances\tsp\ZozinoDancing.rtm";
            speed = 0.034130;
        };
        class a2_metal : a2_dances
        {
            file = "rt\dance\dances\tsp\MadMetalDancing.rtm";
            speed = 0.019036;
        };

        // KokaKolaA3 - ACE Extension (Animations)
        // src: https://steamcommunity.com/sharedfiles/filedetails/?id=766491311
        class kka3_dances : rt_dances
        {
        };
        class kka3_nightclubdance : kka3_dances
        {
            speed = -75.699997;
            file = "rt\dance\dances\kka3\nightclubdance.rtm";
        };
        class kka3_dubstepdance : kka3_dances
        {
            speed = -42.799999;
            file = "rt\dance\dances\kka3\dubstepdance.rtm";
        };
        class kka3_dubsteppop : kka3_dances
        {
            speed = -26.799999;
            file = "rt\dance\dances\kka3\dubstepPop.rtm";
        };

        class kka3_crazydrunkdance : kka3_dances
        {
            speed = -73.699997;
            file = "rt\dance\dances\kka3\crazydrunkdance.rtm";
        };
        class kka3_hiphopdance : kka3_dances
        {
            speed = -76;
            file = "rt\dance\dances\kka3\hiphopdance.rtm";
        };
        class kka3_robotdance : kka3_dances
        {
            speed = -134;
            file = "rt\dance\dances\kka3\robotdance.rtm";
        };
        class kka3_russiandance : kka3_dances
        {
            speed = -32.299999;
            file = "rt\dance\dances\kka3\russiandance.rtm";
        };

        class HubShootingRangeKneel_move1; 
		class WBK_Workout_Anim_Base: HubShootingRangeKneel_move1 {
			minPlayTime = 1;
			ignoreMinPlayTime[] = {"Unconscious"};
			actions = "NoActions";
		    file = "a3\anims_f_epa\data\anim\sdr\cts\hubcleaned\briefing\hubbriefing_loop.rtm";
			speed = 0.0306;
			looped = true;
			showHandGun=0;
			soundEnabled = 0;
            mask="BodyFull";
			interpolationSpeed = 3;
            leftHandIKBeg=0;
            leftHandIKCurve[]={};
            leftHandIKEnd=0;
            rightHandIKBeg=0;
            rightHandIKCurve[]={};
            rightHandIKEnd=0;
            weaponIK=0;
            enableOptics=0;
            showWeaponAim=0;
            disableWeapons=1;
            disableWeaponsLong=1;
            leaning="empty";
            aimingBody="empty";
            aiming="empty";
            forceAim=1;
            limitGunMovement=9.1000004;
			head = "headNo";
			headBobMode = 2;
			headBobStrength = 0;
            canPullTrigger=1;
            enableDirectControl=0;
            weaponLowered=0;
            variantsPlayer[]={};
            variantsAI[]={};
			ConnectTo[]=
			{
			};
			InterpolateTo[]=
			{
				"Unconscious",
				0.1
			};
		};
		class WBK_Workout_1: WBK_Workout_Anim_Base {
		    file = "rt\dance\dances\wbk-workout\meme_1.rtm";
			speed = -0.6;
		};
		class WBK_Workout_2: WBK_Workout_Anim_Base {
		    file = "rt\dance\dances\wbk-workout\meme_2.rtm";
			speed = -0.45;
		};
		class WBK_Workout_3: WBK_Workout_Anim_Base {
		    file = "rt\dance\dances\wbk-workout\meme_3.rtm";
			speed = -0.5;
		};
    };
};