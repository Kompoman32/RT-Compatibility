class CfgPatches
{
    class RT_Factions
    {
        name = "RT Compatibility - Factions";
        requiredAddons[] = {
            "RT_Main", 
            "RT_Utils",
            "A3_Characters_F",
            "A3_Sounds_F",
            "A3_Sounds_F_Exp",
            "ace_gforces",
            "ace_goggles",
            "ace_interaction",
            "ace_movement",
            "ace_medical_feedback",
            "A3_Data_F",
            "A3_Data_F_Curator",
            "A3_Air_F_Heli",
            "ace_thermals",
            "ace_refuel",
            "cba_xeh"
        };
        
        units[] = {
            "O_NO_Operator"
        };
        weapons[] = {};

        author = "Kompoman32 & Voxtell";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 0;
    };
};