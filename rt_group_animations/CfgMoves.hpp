
class CfgMovesBasic {
    class default;
    class ManActions {
        tsp_common_stop="tsp_common_stop";
        tsp_common_stop_instant="tsp_common_stop_instant";
        tsp_common_stop_right="tsp_common_stop_right";
        tsp_common_stop_left="tsp_common_stop_left";

        tsp_animate_bird_in="tsp_animate_bird_in";
        tsp_animate_bird_loop="tsp_animate_bird_loop";
        tsp_animate_thumbsup_loop="tsp_animate_thumbsup_loop";
        tsp_animate_thumbsdown_loop="tsp_animate_thumbsdown_loop";
        tsp_animate_ok_loop="tsp_animate_ok_loop";
        tsp_animate_jackoff_out="tsp_animate_jackoff_out";
        tsp_animate_jackoff_loop="tsp_animate_jackoff_loop";
        tsp_animate_mahalo_loop="tsp_animate_mahalo_loop";
        tsp_animate_loser_loop="tsp_animate_loser_loop";
        tsp_animate_horns_loop="tsp_animate_horns_loop";
        tsp_animate_peace_loop="tsp_animate_peace_loop";
        tsp_animate_dab_loop="tsp_animate_dab_loop";
        tsp_animate_heart_loop="tsp_animate_heart_loop";
        tsp_animate_rockpaperscissors_in="tsp_animate_rockpaperscissors_in";
        tsp_animate_rockpaperscissors_rock_loop="tsp_animate_rockpaperscissors_rock_loop";
        tsp_animate_rockpaperscissors_paper_loop="tsp_animate_rockpaperscissors_paper_loop";
        tsp_animate_rockpaperscissors_scissors_loop="tsp_animate_rockpaperscissors_scissors_loop";
    };

    class Actions {
        class NoActions: ManActions {
            tsp_common_stop[]={"tsp_common_stop","Gesture"};
            tsp_common_stop_instant[]={"tsp_common_stop","Gesture"};
            tsp_common_stop_right[]={"tsp_common_stop_right","Gesture"};
            tsp_common_stop_left[]={"tsp_common_stop_left","Gesture"};

            tsp_animate_bird_in[]={"tsp_animate_bird_in","Gesture"};
            tsp_animate_bird_loop[]={"tsp_animate_bird_loop","Gesture"};

            tsp_animate_thumbsup_loop[]={"tsp_animate_thumbsup_loop","Gesture"};
            tsp_animate_thumbsdown_loop[]={"tsp_animate_thumbsdown_loop","Gesture"};

            tsp_animate_ok_loop[]={"tsp_animate_ok_loop","Gesture"};

            tsp_animate_jackoff_loop[]={"tsp_animate_jackoff_loop","Gesture"};
            tsp_animate_jackoff_out[]={"tsp_animate_jackoff_out","Gesture"};

            tsp_animate_mahalo_loop[]={"tsp_animate_mahalo_loop","Gesture"};
            tsp_animate_loser_loop[]={"tsp_animate_loser_loop","Gesture"};
            tsp_animate_horns_loop[]={"tsp_animate_horns_loop","Gesture"};
            tsp_animate_peace_loop[]={"tsp_animate_peace_loop","Gesture"};

            tsp_animate_heart_loop[]={"tsp_animate_heart_loop","Gesture"};
            tsp_animate_dab_loop[]={"tsp_animate_dab_loop","Gesture"};

            tsp_animate_rockpaperscissors_in[]={"tsp_animate_rockpaperscissors_in","Gesture"};
            tsp_animate_rockpaperscissors_rock_loop[]={"tsp_animate_rockpaperscissors_rock_loop","Gesture"};
            tsp_animate_rockpaperscissors_paper_loop[]={"tsp_animate_rockpaperscissors_paper_loop","Gesture"};
            tsp_animate_rockpaperscissors_scissors_loop[]={"tsp_animate_rockpaperscissors_scissors_loop","Gesture"};
        }
    };
};
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
            file = "rt\animations\actions\tpose.rtm";
            speed = -10000000000;
        };

        // WebKnight - Improved Melee System
        // src: https://steamcommunity.com/sharedfiles/filedetails/?id=2291129343
        class WBK_SecretAnim_Dance : rt_dances
        {
            file = "rt\animations\actions\wbk-ims\wbk_californiagirls.rtm";
            speed = -11;
        };

        // WebKnight - Helldivers Salute
        // src: https://steamcommunity.com/sharedfiles/filedetails/?id=3503413024
        class WBK_HellDivers_salute_in : rt_dances
        {
            file = "rt\animations\actions\wbk-helldivers-salute\Salute_In.rtm";
            InterpolateTo[] = {"WBK_HellDivers_SaluteLoop", 2};
            looped = 0;
            speed=1.5;
            showHandGun  = 0;
            disableWeapons = 1;
            disableWeaponsLong = 1;
        };
        class WBK_HellDivers_salute_loop : WBK_HellDivers_salute_in
        {
            file = "rt\animations\actions\wbk-helldivers-salute\Salute_Loop.rtm";
            looped = 1;
            InterpolateFrom[] = {"WBK_HellDivers_salute_in", 2};
            InterpolateTo[] = {"WBK_HellDivers_salute_out", 2};
            speed=1e+010;
        };
        class WBK_HellDivers_salute_out : WBK_HellDivers_salute_in
        {
            file = "rt\animations\actions\wbk-helldivers-salute\Salute_Out.rtm";
            // minPlayTime=0.69999999;
            speed=1.5;
            InterpolateTo[] = {"", 2};
        };

        // ASmallDinosaur - Animate
        // src: https://steamcommunity.com/sharedfiles/filedetails/?id=2819732932
        class a2_dances : rt_dances
        {
        };
        class a2_duoivan : a2_dances
        {
            file = "rt\animations\dances\tsp\ActsPercMstpSnonWnonDnon_DancingDuoIvan.rtm";
            speed = 0.025000;
        };
        class a2_duostefan : a2_dances
        {
            file = "rt\animations\dances\tsp\ActsPercMstpSnonWnonDnon_DancingDuoStefan.rtm";
            speed = 0.025000;
        };
        class a2_stefan : a2_dances
        {
            file = "rt\animations\dances\tsp\ActsPercMstpSnonWnonDnon_DancingStefan.rtm";
            speed = 0.010400;
        };
        class a2_zozo : a2_dances
        {
            file = "rt\animations\dances\tsp\ZozinoDancing.rtm";
            speed = 0.034130;
        };
        class a2_metal : a2_dances
        {
            file = "rt\animations\dances\tsp\MadMetalDancing.rtm";
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
            file = "rt\animations\dances\kka3\nightclubdance.rtm";
        };
        class kka3_dubstepdance : kka3_dances
        {
            speed = -42.799999;
            file = "rt\animations\dances\kka3\dubstepdance.rtm";
        };
        class kka3_dubsteppop : kka3_dances
        {
            speed = -26.799999;
            file = "rt\animations\dances\kka3\dubstepPop.rtm";
        };

        class kka3_crazydrunkdance : kka3_dances
        {
            speed = -73.699997;
            file = "rt\animations\dances\kka3\crazydrunkdance.rtm";
        };
        class kka3_hiphopdance : kka3_dances
        {
            speed = -76;
            file = "rt\animations\dances\kka3\hiphopdance.rtm";
        };
        class kka3_robotdance : kka3_dances
        {
            speed = -134;
            file = "rt\animations\dances\kka3\robotdance.rtm";
        };
        class kka3_russiandance : kka3_dances
        {
            speed = -32.299999;
            file = "rt\animations\dances\kka3\russiandance.rtm";
        };

        class HubShootingRangeKneel_move1; 
        class WBK_Workout_Anim_Base: HubShootingRangeKneel_move1 {
            minPlayTime = 1;
            ignoreMinPlayTime[] = {"Unconscious"};
            actions = "NoActions";
            file = "a3\anims_f_epa\data\anim\sdr\cts\hubcleaned\briefing\hubbriefing_loop.rtm";
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
            file = "rt\animations\actions\wbk-workout\meme_1.rtm";
            speed = -0.6;
        };
        class WBK_Workout_2: WBK_Workout_Anim_Base {
            file = "rt\animations\actions\wbk-workout\meme_2.rtm";
            speed = -0.45;
        };
        class WBK_Workout_3: WBK_Workout_Anim_Base {
            file = "rt\animations\actions\wbk-workout\meme_3.rtm";
            speed = -0.5;
        };


        class RT_Thriller: rt_dances {
            file = "rt\animations\dances\rtdances\thriller.rtm";
            speed = -20;
            
            showHandGun = 0;
            showItemInHand = 0;
            showItemInRightHand = 0;

            disableWeapons = 1;
            disableWeaponsLong = 1;
            canPullTrigger = 0;
        };
        
        class AmovPercMstpSnonWnonDnon_exercisePushup;
        class AmovPercMstpSnonWnonDnon_exercisekneeBendA;
        class AmovPercMstpSnonWnonDnon_exercisekneeBendB;
        class rt_exercisePushup: AmovPercMstpSnonWnonDnon_exercisePushup
        {
            looped = 1;
            ConnectTo[] = {"rt_exercisePushup",0.1};
            InterpolateTo[] = {"rt_exercisePushup",0.01};
        };
        class rt_exercisekneeBendA: AmovPercMstpSnonWnonDnon_exercisekneeBendA
        {
            looped = 1;
            ConnectTo[] = {"rt_exercisekneeBendA",0.1};
            InterpolateTo[] = {"rt_exercisekneeBendA",0.01};
        };
        class rt_exercisekneeBendB: AmovPercMstpSnonWnonDnon_exercisekneeBendB
        {
            looped = 1;
            ConnectTo[] = {"rt_exercisekneeBendB",0.1};
            InterpolateTo[] = {"rt_exercisekneeBendB",0.01};
        };
    };
};

class CfgGesturesMale
{
    class Default;

    class BlendAnims {

    };

    class States {
        class rt_gesture_base: Default
        {
            canPullTrigger = 0;
            cancel=1;
            looped = 0;
            disableWeapons=1;
        };


        class rt_gesture_right_hand: rt_gesture_base
        {
            mask="rightHand";

            rightHandIKCurve[]={0};
            leftHandIKCurve[]={1};
        };

        class rt_gesture_right_hand_looped: rt_gesture_right_hand
        {
            looped=1;
            speed = 0.3;
        };

        class rt_gesture_left_hand: rt_gesture_base
        {
            mask="leftHand";

            leftHandIKCurve[] = {0};
            rightHandIKCurve[]={1};
        };

        class rt_gesture_left_hand_looped: rt_gesture_left_hand
        {
            looped=1;
            speed = 0.3;
        };

        class rt_gesture_both_hands: rt_gesture_base
        {
            mask = "handsWeapon_pst_context";
            rightHandIKCurve[]={1};
            leftHandIKCurve[]={1};
        };

        class rt_gesture_both_hands_looped: rt_gesture_both_hands
        {
            looped=1;
            speed = 0.3;
        };

        class GestureNod;
        class tsp_common_stop: GestureNod
        {
            mask="empty";
            interpolationSpeed=5;
            showHandGun=0;
            rightHandIKCurve[]={1};
            leftHandIKCurve[]={1};
            canPullTrigger=1;
            enableBinocular=1;
            enableMissile=1;
            enableOptics=1;
            disableWeapons=0;
            disableWeaponsLong=0;
        };
        class tsp_common_stop_instant: tsp_common_stop
        {
            interpolationSpeed=99999;
            speed=99999;
            showHandGun=1;
        };
        class tsp_common_stop_right: tsp_common_stop
        {
            rightHandIKCurve[]={0,0,0.5,1};
            leftHandIKCurve[]={1};
        };
        class tsp_common_stop_left: tsp_common_stop
        {
            rightHandIKCurve[]={1};
            leftHandIKCurve[]={0,0,0.5,1};
        };

        class tsp_animate_bird_in: rt_gesture_right_hand
        {
            file="\rt\animations\emotes\bird_in.rtm";
            speed = 2;
        };
        class tsp_animate_bird_loop: rt_gesture_right_hand_looped
        {
            file="\rt\animations\emotes\bird_loop.rtm";
        };

        class tsp_animate_thumbsup_loop: rt_gesture_right_hand_looped
        {
            file="\rt\animations\emotes\thumbsup_loop.rtm";
        };

        class tsp_animate_thumbsdown_loop: rt_gesture_right_hand_looped
        {
            file="\rt\animations\emotes\thumbsdown_loop.rtm";
        };

        class tsp_animate_ok_loop: rt_gesture_right_hand_looped
        {
            file="\rt\animations\emotes\ok_loop.rtm";
        };

        class tsp_animate_jackoff_loop: rt_gesture_right_hand_looped
        {
            file="\rt\animations\emotes\jackoff_loop.rtm";
            speed=2;
        };

        class tsp_animate_jackoff_out: rt_gesture_right_hand
        {
            file="\rt\animations\emotes\jackoff_out.rtm";
            speed=2;
        };

        class tsp_animate_mahalo_loop: rt_gesture_right_hand_looped
        {
            file="\rt\animations\emotes\mahalo_loop.rtm";
            speed = 1.2;
        };

        class tsp_animate_loser_loop: rt_gesture_right_hand_looped
        {
            file="\rt\animations\emotes\loser_loop.rtm";
        };

        class tsp_animate_horns_loop: rt_gesture_left_hand_looped
        {
            file="\rt\animations\emotes\horns_loop.rtm";
        };

        class tsp_animate_peace_loop: rt_gesture_left_hand_looped
        {
            file="\rt\animations\emotes\peace_loop.rtm";
        };

        class tsp_animate_dab_loop: rt_gesture_both_hands_looped
        {
            file="\rt\animations\emotes\dab_loop.rtm";
        };

        class tsp_animate_heart_loop: rt_gesture_both_hands_looped
        {
            file="\rt\animations\emotes\heart_loop.rtm";
        };

        class tsp_animate_rockpaperscissors_in: rt_gesture_both_hands_looped
        {
            file="\rt\animations\emotes\rockpaperscissors_in.rtm";
        };
        class tsp_animate_rockpaperscissors_rock_loop: rt_gesture_both_hands_looped
        {
            file="\rt\animations\emotes\rockpaperscissors_rock_loop.rtm";
        };
        class tsp_animate_rockpaperscissors_paper_loop: tsp_animate_rockpaperscissors_rock_loop
        {
            file="\rt\animations\emotes\rockpaperscissors_paper_loop.rtm";
        };
        class tsp_animate_rockpaperscissors_scissors_loop: tsp_animate_rockpaperscissors_rock_loop
        {
            file="\rt\animations\emotes\rockpaperscissors_scissors_loop.rtm";
        };
    };
};




