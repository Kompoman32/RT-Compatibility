class CBA_Extended_EventHandlers_base;

class CfgVehicles {
    class B_Soldier_F;
    class B_Soldier_F_OCimport_01 : B_Soldier_F { scope = 0; class EventHandlers; };
    class B_Soldier_F_OCimport_02 : B_Soldier_F_OCimport_01 { class EventHandlers; };

    class O_NO_Operator : B_Soldier_F_OCimport_02 {
        author = "Voxtell";
        scope = 2;
        scopeCurator = 2;
        displayName = "Operator";
        side = 0;
        faction = "O_NO";
        editorPreview = "rt\factions\data\O_NO_Operator.jpg";

        identityTypes[] = {"Head_Euro","LanguageENG_F","G_NATO_default"};

        uniformClass = "U_O_R_Gorka_01_black_F";

        linkedItems[] = {"V_PlateCarrier1_blk","H_HelmetHeavy_Black_RF","ItemMap","ItemMotionSensor_lxWS","ItemRadio","ItemCompass","ItemWatch","ACE_NVG_Wide_Black_WP", "G_Balaclava_TI_blk_F"};
        respawnlinkedItems[] = {"V_PlateCarrier1_blk","H_HelmetHeavy_Black_RF","ItemMap","ItemMotionSensor_lxWS","ItemRadio","ItemCompass","ItemWatch","ACE_NVG_Wide_Black_WP", "G_Balaclava_TI_blk_F"};

        weapons[] = {"arifle_ash12_holo_RF","hgun_Glock19_RF","Rangefinder"};
        respawnWeapons[] = {"arifle_ash12_holo_RF","hgun_Glock19_RF","Rangefinder"};

        magazines[] = {"20Rnd_127x55_Mag_RF","17Rnd_9x19_Mag_RF","20Rnd_127x55_Mag_RF","17Rnd_9x19_Mag_RF"};
        respawnMagazines[] = {"20Rnd_127x55_Mag_RF","17Rnd_9x19_Mag_RF","20Rnd_127x55_Mag_RF","17Rnd_9x19_Mag_RF"};
    };
};