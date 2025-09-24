
class CfgVehicles
{
    class Man;
    class CAManBase: Man
    {
        class ACE_SelfActions
        {
            class ace_gestures {
                condition = "false";
            };

            class RT_Animations
            {
                displayName="$STR_RT_ANIMATIONS_Animatations_Category";
                icon="z\ace\addons\gestures\UI\gestures_ca.paa";
                condition = "RT_SETTINGS_ANIMATIONS_enable call CBA_settings_fnc_get";

                class Stop {
                    displayName="$STR_RT_ANIMATIONS_Stop_Category";
                    icon="rt\animations\gui\cancel.paa";
                    condition = "[player] call RT_Animations_fnc_isAnimating";
                    statement="[player] call RT_ANIMATIONS_fnc_stopAnimation"
                };

                class Dances 
                {
                    displayName="$STR_RT_ANIMATIONS_Dances_Category";
                    icon="rt\animations\gui\dances.paa";
                    condition = "RT_SETTINGS_ANIMATIONS_Dances_enable call CBA_settings_fnc_get && stance _player != 'PRONE'";

                    class A2_Dances {
                        displayName="Arma 2 Dances";
                        condition = "true";

                        class a2_duoivan {
                            displayName="Duo Ivan";
                            condition="!([_player, 'a2_duoivan'] call RT_ANIMATIONS_fnc_isDancing)";
                            statement="[player, 'a2_duoivan'] call RT_Animations_fnc_dance"
                        };
                        class a2_duostefan {
                            displayName="Duo Stefan";
                            condition="!([_player, 'a2_duostefan'] call RT_ANIMATIONS_fnc_isDancing)";
                            statement="[player, 'a2_duostefan'] call RT_Animations_fnc_dance"
                        };
                        class a2_stefan {
                            displayName="Stefan";
                            condition="!([_player, 'a2_stefan'] call RT_ANIMATIONS_fnc_isDancing)";
                            statement="[player, 'a2_stefan'] call RT_Animations_fnc_dance"
                        };
                        class a2_zozo {
                            displayName="Zozo";
                            condition="!([_player, 'a2_zozo'] call RT_ANIMATIONS_fnc_isDancing)";
                            statement="[player, 'a2_zozo'] call RT_Animations_fnc_dance"
                        };
                        class a2_metal {
                            displayName="Hard Metal";
                            condition="!([_player, 'a2_metal'] call RT_ANIMATIONS_fnc_isDancing)";
                            statement="[player, 'a2_metal'] call RT_Animations_fnc_dance"
                        };
                    };

                    class A3_Dances {
                        displayName="Arma 3 Dances";
                        condition = "true";

                        class A3_Dance1 {
                            displayName="Duo Ivan";
                            condition="!([_player, 'A3_Dance1'] call RT_ANIMATIONS_fnc_isDancing)";
                            statement="[player, 'A3_Dance1'] call RT_Animations_fnc_dance"
                        };
                        class A3_Dance2 {
                            displayName="Duo Stefan";
                            condition="!([_player, 'A3_Dance2'] call RT_ANIMATIONS_fnc_isDancing)";
                            statement="[player, 'A3_Dance2'] call RT_Animations_fnc_dance"
                        };
                    };

                    class WBK_Secretanim_Dance {
                        displayName="WBK Dance";
                        condition="!([_player, 'WBK_Secretanim_Dance'] call RT_ANIMATIONS_fnc_isDancing)";
                        statement="[player, 'WBK_Secretanim_Dance'] call RT_Animations_fnc_dance"
                    };

                    class KKA3_Dances {
                        displayName="KKA3 Dances";
                        condition = "true";

                        class kka3_nightclubdance {
                            displayName="NightClub";
                            condition="!([_player, 'kka3_nightclubdance'] call RT_ANIMATIONS_fnc_isDancing)";
                            statement="[player, 'kka3_nightclubdance'] call RT_Animations_fnc_dance"
                        };
                        class kka3_dubstepdance {
                            displayName="Dubstep";
                            condition="!([_player, 'kka3_dubstepdance'] call RT_ANIMATIONS_fnc_isDancing)";
                            statement="[player, 'kka3_dubstepdance'] call RT_Animations_fnc_dance"
                        };
                        class kka3_dubsteppop {
                            displayName="Dubstep Pop";
                            condition="!([_player, 'kka3_dubsteppop'] call RT_ANIMATIONS_fnc_isDancing)";
                            statement="[player, 'kka3_dubsteppop'] call RT_Animations_fnc_dance"
                        };
                        class kka3_crazydrunkdance {
                            displayName="Drunk";
                            condition="!([_player, 'kka3_crazydrunkdance'] call RT_ANIMATIONS_fnc_isDancing)";
                            statement="[player, 'kka3_crazydrunkdance'] call RT_Animations_fnc_dance"
                        };
                        class kka3_robotdance {
                            displayName="Robot";
                            condition="!([_player, 'kka3_robotdance'] call RT_ANIMATIONS_fnc_isDancing)";
                            statement="[player, 'kka3_robotdance'] call RT_Animations_fnc_dance"
                        };
                        class kka3_russiandance {
                            displayName="Russian Dance";
                            condition="!([_player, 'kka3_russiandance'] call RT_ANIMATIONS_fnc_isDancing)";
                            statement="[player, 'kka3_russiandance'] call RT_Animations_fnc_dance"
                        };
                        class kka3_hiphopdance {
                            displayName="Hiphop";
                            condition="!([_player, 'kka3_hiphopdance'] call RT_ANIMATIONS_fnc_isDancing)";
                            statement="[player, 'kka3_hiphopdance'] call RT_Animations_fnc_dance"
                        };
                    };
                };

                class Emotes
                {
                    displayName="$STR_RT_ANIMATIONS_Emotes_Category";
                    icon="rt\animations\gui\horns.paa";
                    condition = "RT_SETTINGS_ANIMATIONS_Emotes_enable call CBA_settings_fnc_get && stance _player != 'PRONE'";

                    class tsp_animate_bird_in {};
                    class tsp_animate_bird_loop
                    {
                        displayName="Fck U";
                        icon="rt\animations\gui\middleFinger.paa";

                        condition="!([_player, 'tsp_animate_bird_loop'] call RT_ANIMATIONS_fnc_isEmoting)";
                        statement="[player, 'tsp_animate_bird_loop'] call RT_Animations_fnc_emote";
                    };

                    class tsp_animate_thumbsup_loop
                    {
                        displayName="Thumbs Up";
                        icon="rt\animations\gui\thumbup.paa";

                        condition="!([_player, 'tsp_animate_thumbsup_loop'] call RT_ANIMATIONS_fnc_isEmoting)";
                        statement="[player, 'tsp_animate_thumbsup_loop'] call RT_Animations_fnc_emote";
                    };
                    class tsp_animate_thumbsdown_loop
                    {
                        displayName="Thumbs Down";
                        icon="rt\animations\gui\thumbdown.paa";

                        condition="!([_player, 'tsp_animate_thumbsdown_loop'] call RT_ANIMATIONS_fnc_isEmoting)";
                        statement="[player, 'tsp_animate_thumbsdown_loop'] call RT_Animations_fnc_emote";
                    };
                    class tsp_animate_ok_loop
                    {
                        displayName="Ok";
                        icon="rt\animations\gui\ok.paa";

                        condition="!([_player, 'tsp_animate_ok_loop'] call RT_ANIMATIONS_fnc_isEmoting)";
                        statement="[player, 'tsp_animate_ok_loop'] call RT_Animations_fnc_emote";
                    };
                    class tsp_animate_jackoff_out {};
                    class tsp_animate_jackoff_loop
                    {
                        displayName="Jack Off";

                        icon="rt\animations\gui\jackoff.paa";
                        condition="!([_player, 'tsp_animate_jackoff_loop'] call RT_ANIMATIONS_fnc_isEmoting)";
                        statement="[player, 'tsp_animate_jackoff_loop'] call RT_Animations_fnc_emote";
                    };
                    class tsp_animate_mahalo_loop
                    {
                        displayName="Mahalo";

                        icon="rt\animations\gui\mahalo.paa";
                        condition="!([_player, 'tsp_animate_mahalo_loop'] call RT_ANIMATIONS_fnc_isEmoting)";
                        statement="[player, 'tsp_animate_mahalo_loop'] call RT_Animations_fnc_emote";
                    };
                    class tsp_animate_loser_loop
                    {
                        displayName="Loser";

                        icon="rt\animations\gui\loser.paa";
                        condition="!([_player, 'tsp_animate_loser_loop'] call RT_ANIMATIONS_fnc_isEmoting)";
                        statement="[player, 'tsp_animate_loser_loop'] call RT_Animations_fnc_emote";
                    };
                    class tsp_animate_horns_loop
                    {
                        displayName="Eee Rock!";
                        icon="rt\animations\gui\horns.paa";

                        condition="!([_player, 'tsp_animate_horns_loop'] call RT_ANIMATIONS_fnc_isEmoting)";
                        statement="[player, 'tsp_animate_horns_loop'] call RT_Animations_fnc_emote";
                    };
                    class tsp_animate_peace_loop
                    {
                        displayName="Peace";

                        icon="rt\animations\gui\peace.paa";
                        condition="!([_player, 'tsp_animate_peace_loop'] call RT_ANIMATIONS_fnc_isEmoting)";
                        statement="[player, 'tsp_animate_peace_loop'] call RT_Animations_fnc_emote";
                    };
                    class tsp_animate_dab_loop
                    {
                        displayName="Dab";

                        icon="rt\animations\gui\dab.paa";
                        condition="currentWeapon _player == '' && !([_player, 'tsp_animate_dab_loop'] call RT_ANIMATIONS_fnc_isEmoting)";
                        statement="[player, 'tsp_animate_dab_loop'] call RT_Animations_fnc_emote";
                    };
                    class tsp_animate_heart_loop
                    {
                        displayName="Heart";

                        icon="rt\animations\gui\heart.paa";
                        condition="currentWeapon _player == '' && !([_player, 'tsp_animate_heart_loop'] call RT_ANIMATIONS_fnc_isEmoting)";
                        statement="[player, 'tsp_animate_heart_loop'] call RT_Animations_fnc_emote";
                    };

                    class rockpaperscissors
                    {
                        displayName="Rock Paper Scissors";
                        condition="true";
                        icon="rt\animations\gui\rps.paa";

                        class tsp_animate_rockpaperscissors_in {};
                        class tsp_animate_rockpaperscissors_rock_loop
                        {
                            displayName="Rock";

                            icon="rt\animations\gui\rock.paa";
                            condition="currentWeapon _player == '' && !([_player, 'tsp_animate_rockpaperscissors_in'] call RT_ANIMATIONS_fnc_isEmoting)";
                            statement="[player, 'tsp_animate_rockpaperscissors_rock_loop'] call RT_Animations_fnc_emote";
                        };
                        class tsp_animate_rockpaperscissors_paper_loop
                        {
                            displayName="Paper";

                            icon="rt\animations\gui\paper.paa";
                            condition="currentWeapon _player == '' && !([_player, 'tsp_animate_rockpaperscissors_in'] call RT_ANIMATIONS_fnc_isEmoting)";
                            statement="[player, 'tsp_animate_rockpaperscissors_paper_loop'] call RT_Animations_fnc_emote";
                        };
                        class tsp_animate_rockpaperscissors_scissors_loop
                        {
                            displayName="Scissors";

                            icon="rt\animations\gui\scissors.paa";
                            condition="currentWeapon _player == '' && !([_player, 'tsp_animate_rockpaperscissors_in'] call RT_ANIMATIONS_fnc_isEmoting)";
                            statement="[player, 'tsp_animate_rockpaperscissors_scissors_loop'] call RT_Animations_fnc_emote";
                        };
                    };

                };

                class Actions 
                {
                    displayName="$STR_RT_ANIMATIONS_Actions_Category";
                    icon="a3\ui_f\data\igui\cfg\simpletasks\types\run_ca.paa";
                    condition = "RT_SETTINGS_ANIMATIONS_Actions_enable call CBA_settings_fnc_get";

                    class WBK_HellDivers_salute_loop {
                        displayName="Helldivers Salute";
                        icon="rt\animations\gui\helldiver.paa";
                        condition="!([_player, 'WBK_HellDivers_salute_loop'] call RT_ANIMATIONS_fnc_isActing) && stance _player != 'PRONE'";
                        statement="[player, 'WBK_HellDivers_salute_loop'] call RT_Animations_fnc_act"
                    };

                    class WBK_Workout {
                        displayName="Workout";
                        condition = "true";
                        icon = "\a3\UI_F_Curator\Data\RscCommon\RscAttributePunishmentAnimation\PushupsLegs.paa";

                        class WBK_Workout_1 {
                            displayName="Waist Drop Plank";

                            icon = "\a3\UI_F_Curator\Data\RscCommon\RscAttributePunishmentAnimation\Pushups.paa";
                            condition="!([_player, 'WBK_Workout_1'] call RT_ANIMATIONS_fnc_isActing)";
                            statement="[player, 'WBK_Workout_1'] call RT_Animations_fnc_act"
                        };
                        class WBK_Workout_2 {
                            displayName="Kneeling Plank Thrusts";

                            icon = "\a3\UI_F_Curator\Data\RscCommon\RscAttributePunishmentAnimation\Pushups.paa";
                            condition="!([_player, 'WBK_Workout_2'] call RT_ANIMATIONS_fnc_isActing)";
                            statement="[player, 'WBK_Workout_2'] call RT_Animations_fnc_act"
                        };
                        class WBK_Workout_3 {
                            displayName="Kneeling Hip Thrusts";
          
                            icon="rt\animations\gui\hipThrusts.paa";
                            condition="!([_player, 'WBK_Workout_3'] call RT_ANIMATIONS_fnc_isActing)";
                            statement="[player, 'WBK_Workout_3'] call RT_Animations_fnc_act"
                        };

                        class rt_exercisePushup {
                            displayName="Push-Ups";

                            icon = "\a3\UI_F_Curator\Data\RscCommon\RscAttributePunishmentAnimation\Pushups.paa";
                            condition="!([_player, 'rt_exercisePushup'] call RT_ANIMATIONS_fnc_isActing)";
                            statement="[player, 'rt_exercisePushup'] call RT_Animations_fnc_act"
                        };

                        class rt_exercisekneeBendA {
                            displayName="Squats Exercise";

                            icon = "\a3\UI_F_Curator\Data\RscCommon\RscAttributePunishmentAnimation\PushupsLegs.paa";
                            condition="!([_player, 'rt_exercisekneeBendA'] call RT_ANIMATIONS_fnc_isActing)";
                            statement="[player, 'rt_exercisekneeBendA'] call RT_Animations_fnc_act"
                        };

                        class rt_exercisekneeBendB {
                            displayName="Squats Exercise (Fast)";

                            icon = "\a3\UI_F_Curator\Data\RscCommon\RscAttributePunishmentAnimation\PushupsLegs.paa";
                            condition="!([_player, 'rt_exercisekneeBendB'] call RT_ANIMATIONS_fnc_isActing)";
                            statement="[player, 'rt_exercisekneeBendB'] call RT_Animations_fnc_act"
                        };
                    };
                };
            };
        };
    };
};