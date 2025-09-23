class CfgWeapons {
    class GrenadeLauncher;
    class Throw: GrenadeLauncher {
        muzzles[] += {"RT_PotatoMuzzle", "RT_Af_PotatoMuzzle", "RT_HandGrenade_RubberMuzzle"};

		class ThrowMuzzle;
        class RT_PotatoMuzzle: ThrowMuzzle {
            magazines[] = {"RT_Potato"};
		};

        class RT_Af_PotatoMuzzle: ThrowMuzzle {
            magazines[] = {"RT_Af_Potato"};
		};

        class RT_HandGrenade_RubberMuzzle: ThrowMuzzle {
            magazines[] = {"RT_HandGrenade_Rubber"};
		};
	};


    class Rifle_Long_Base_F;
    class DMR_07_base_F: Rifle_Long_Base_F
    {
        magazineWell[] += {"CBA_65C_AR10"};
    };

    class Rifle_Short_Base_F;
    class pdw2000_base_F: Rifle_Short_Base_F
    {
        magazineWell[] += {"CBA_9x21_16", "CBA_9x21_30"};
    };
    

    class Pistol_Base_F;
    class hgun_Rook40_F: Pistol_Base_F
    {
        magazineWell[] += {"CBA_9x21_16", "CBA_9x21_30"};
    };

    // class Rifle_Short_Base_F;
    // class pdw2000_base_F: Rifle_Short_Base_F
    // {
    //     magazineWell[] += {"CBA_9x21_16", "CBA_9x21_30"};
    // }
};

class CfgAmmo {
    class SmokeShell;
	class RT_G_Potato: SmokeShell {
        model = "rt\ammo\assets\potato.p3d";
        dangerRadiusHit = -1;
        suppressionRadiusHit = 1;
        typicalSpeed = 22;
        cost = 40;
        explosive = 1E-7;
        deflecting = 1;
        explosionTime = 3;
        timeToLive = 300;
        grenadeFireSound[] = {};
        grenadeBurningSound[] = {};
        smokeColor[] = {0,0,0,0};
        effectsSmoke = "";
        whistleDist = 0;
    };

    class GrenadeHand;
	class RT_G_Af_Potato: GrenadeHand {
        model = "rt\ammo\assets\potata.p3d";
        hit = 4;
        indirectHit = 4;
        explosionTime = 3;
    };

	class RT_GrenadeHand_Rubber: GrenadeHand {
        ACE_damageType = "rubbergrenade";
    };

    // Оружие

    class ACE_12Gauge_Pellets_Submunition_No0_Buck;
    class RT_2Rnd_12Gauge_Pellets_No0_Rubber: ACE_12Gauge_Pellets_Submunition_No0_Buck {
        ACE_damageType = "rubberbullet";
    };

    class ACE_65x39_Caseless_Tracer_Dim;
    class RT_65x39_Caseless_Rubber_Tracer_Dim: ACE_65x39_Caseless_Tracer_Dim {
        ACE_damageType = "rubberbullet";
    };

    class ACE_65x39_Caseless_green_Tracer_Dim;
    class RT_65x39_Caseless_green_Rubber_Tracer_Dim: ACE_65x39_Caseless_green_Tracer_Dim {
        ACE_damageType = "rubberbullet";
    };

    class ACE_556x45_Ball_Mk262;
    class RT_556x45_Ball_Mk262_Rubber: ACE_556x45_Ball_Mk262 {
        ACE_damageType = "rubberbullet";
    };

    class ACE_762x51_Ball_Subsonic;
    class RT_762x51_Ball_Subsonic_Rubber: ACE_762x51_Ball_Subsonic {
        ACE_damageType = "rubberbullet";
    };

    class ACE_338_Ball;
    class RT_338_Ball_Rubber: ACE_338_Ball {
        ACE_damageType = "rubberbullet";
    };

    class ACE_762x67_Ball_Mk248_Mod_0;
    class RT_762x67_Ball_Rubber_Mk248_Mod_0: ACE_762x67_Ball_Mk248_Mod_0 {
        ACE_damageType = "rubberbullet";
    };

    class ACE_65x47_Ball_Scenar;
    class RT_65x47_Ball_Scenar_Rubber: ACE_65x47_Ball_Scenar {
        ACE_damageType = "rubberbullet";
    };

    class ACE_408_Ball;
    class RT_408_Ball_Rubber: ACE_408_Ball {
        ACE_damageType = "rubberbullet";
    };

    class B_127x99_Ball;
    class RT_127x99_Ball_Rubber: B_127x99_Ball {
        ACE_damageType = "rubberbullet";
    };

    class ACE_9x19_Ball;
    class RT_9x19_Ball_Rubber: ACE_9x19_Ball {
        ACE_damageType = "rubberbullet";
    };

    class ACE_762x54_Ball_7T2;
    class RT_762x54_Ball_Rubber_7T2: ACE_762x54_Ball_7T2 {
        ACE_damageType = "rubberbullet";
    };


    class B_762x39_Ball_F;
    class RT_B_762x39_Rubber_F: B_762x39_Ball_F {
        ACE_damageType = "rubberbullet";
    };

    class B_545x39_Ball_F;
    class RT_B_545x39_Rubber_F: B_545x39_Ball_F {
        ACE_damageType = "rubberbullet";
    };

    class B_580x42_Ball_F;
    class RT_B_580x42_Rubber_F: B_580x42_Ball_F {
        ACE_damageType = "rubberbullet";
    };

    class B_65x39_caseless;
    class RT_B_65x39_caseless_Rubber: B_65x39_caseless {
        ACE_damageType = "rubberbullet";
    };
    
    class B_127x54_Ball ;
    class RT_B_127x54_Rubber : B_127x54_Ball  {
        ACE_damageType = "rubberbullet";
    };

    class B_93x64_Ball ;
    class RT_B_93x64_Rubber : B_93x64_Ball  {
        ACE_damageType = "rubberbullet";
    };

    class B_65x39_Case_green ;
    class RT_B_65x39_Case_green_Rubber : B_65x39_Case_green  {
        ACE_damageType = "rubberbullet";
    };

    class B_9x21_Ball ;
    class RT_B_9x21_Rubber : B_9x21_Ball  {
        ACE_damageType = "rubberbullet";
    };

    class B_45ACP_Ball ;
    class RT_B_45ACP_Rubber : B_45ACP_Ball  {
        ACE_damageType = "rubberbullet";
    };

    class B_45ACP_Ball_Green ;
    class RT_B_45ACP_Rubber_Green : B_45ACP_Ball_Green  {
        ACE_damageType = "rubberbullet";
    };

    class B_93x64_Ball ;
    class RT_B_93x64_Rubber : B_93x64_Ball  {
        ACE_damageType = "rubberbullet";
    };

    class B_338_NM_Ball ;
    class RT_B_338_NM_Rubber : B_338_NM_Ball  {
        ACE_damageType = "rubberbullet";
    };

    class B_556x45_Ball_Tracer_Yellow ;
    class RT_B_556x45_Rubber_Tracer_Yellow : B_556x45_Ball_Tracer_Yellow  {
        ACE_damageType = "rubberbullet";
    };

    class B_762x54_Tracer_Green ;
    class RT_B_762x54_Rubber_Tracer_Green : B_762x54_Tracer_Green  {
        ACE_damageType = "rubberbullet";
    };

    class B_570x28_Ball ;
    class RT_B_570x28_Rubber : B_570x28_Ball  {
        ACE_damageType = "rubberbullet";
    };


    class R_PG7_F;
    class RT_R_PG7_Rubber_F: R_PG7_F {
        ACE_damageType = "rubberexplosion";
    };
};

class CfgMagazines {
    class HandGrenade;
	class RT_Potato: HandGrenade {
        author = "Kompoman32";
        displayname = "$STR_RT_AMMO_Potato_itemName";
        descriptionShort = "$STR_RT_AMMO_Potato_itemDescription";
        displayNameShort = "$STR_RT_AMMO_Potato_itemNameShort";
        model = "rt\ammo\assets\potato.p3d";
        picture = "\rt\ammo\assets\potato_icon_ca.paa";
        ammo = "RT_G_Potato";
        mass = 3;
    };

    class RT_Af_Potato: HandGrenade {
        author = "Kompoman32";
        ammo = "RT_G_Af_Potato";
        displayname = "$STR_RT_AMMO_AfghanPotato_itemName";
        descriptionShort = "$STR_RT_AMMO_AfghanPotato_itemDescription";
        displayNameShort = "$STR_RT_AMMO_AfghanPotato_itemNameShort";
        model = "rt\ammo\assets\potatA.p3d";
        picture = "\rt\ammo\assets\potato_icon_ca.paa";
        mass = 3;
    };

    class RT_HandGrenade_Rubber: HandGrenade {
        author = "Kompoman32";
        ammo = "RT_GrenadeHand_Rubber";
        picture = "\rt\ammo\assets\stinger_cs_icon_ca.paa"
        displayname = "$STR_RT_AMMO_Rubber_HandGrenade_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_HandGrenade_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_HandGrenade_Description";
    };

    class ACE_2Rnd_12Gauge_Pellets_No0_Buck;
    class RT_2Rnd_12Gauge_Pellets_No0_Rubber: ACE_2Rnd_12Gauge_Pellets_No0_Buck {
        author = "Kompoman32";
        ammo = "RT_2Rnd_12Gauge_Pellets_No0_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_2Rnd_12Gauge_Pellets_No0_Buck_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_12Gauge_Pellets_No0_Buck_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_12Gauge_Pellets_No0_Buck_Description";
    };

    class ACE_6Rnd_12Gauge_Pellets_No0_Buck;
    class RT_6Rnd_12Gauge_Pellets_No0_Rubber: ACE_6Rnd_12Gauge_Pellets_No0_Buck {
        author = "Kompoman32";
        ammo = "RT_6Rnd_12Gauge_Pellets_No0_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_6Rnd_12Gauge_Pellets_No4_Bird_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_12Gauge_Pellets_No4_Bird_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_12Gauge_Pellets_No4_Bird_Description";
    };

    class ACE_30Rnd_65x39_caseless_mag_Tracer_Dim;
    class RT_30Rnd_65x39_caseless_mag_Rubber_Tracer_Dim: ACE_30Rnd_65x39_caseless_mag_Tracer_Dim {
        author = "Kompoman32";
        ammo = "RT_65x39_Caseless_Rubber_Tracer_Dim";
        displayName = "$STR_RT_AMMO_Rubber_30Rnd_65x39_caseless_mag_Tracer_Dim_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_30Rnd_65x39_caseless_mag_Tracer_Dim_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_30Rnd_65x39_caseless_mag_Tracer_Dim_Description";
    };

    class ACE_100Rnd_65x39_caseless_mag_Tracer_Dim;
    class RT_100Rnd_65x39_caseless_mag_Rubber_Tracer_Dim: ACE_100Rnd_65x39_caseless_mag_Tracer_Dim {
        author = "Kompoman32";
        ammo = "RT_65x39_Caseless_Rubber_Tracer_Dim";
        displayName = "$STR_RT_AMMO_Rubber_100Rnd_65x39_caseless_mag_Tracer_Dim_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_100Rnd_65x39_caseless_mag_Tracer_Dim_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_100Rnd_65x39_caseless_mag_Tracer_Dim_Description";
    };

    class ACE_30Rnd_65x39_caseless_green_mag_Tracer_Dim;
    class RT_30Rnd_65x39_caseless_green_mag_Rubber_Tracer_Dim: ACE_30Rnd_65x39_caseless_green_mag_Tracer_Dim {
        author = "Kompoman32";
        ammo = "RT_65x39_Caseless_green_Rubber_Tracer_Dim";
        displayName = "$STR_RT_AMMO_Rubber_30Rnd_65x39_caseless_green_mag_Tracer_Dim_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_30Rnd_65x39_caseless_green_mag_Tracer_Dim_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_30Rnd_65x39_caseless_green_mag_Tracer_Dim_Description";
    };

    class ACE_200Rnd_65x39_cased_Box_Tracer_Dim;
    class RT_200Rnd_65x39_cased_Box_Rubber_Tracer_Dim: ACE_200Rnd_65x39_cased_Box_Tracer_Dim {
        author = "Kompoman32";
        ammo = "RT_65x39_Caseless_Rubber_Tracer_Dim";
        displayName = "$STR_RT_AMMO_Rubber_200Rnd_65x39_cased_Box_Tracer_Dim_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_200Rnd_65x39_cased_Box_Tracer_Dim_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_200Rnd_65x39_cased_Box_Tracer_Dim_Description";
    };

    class ACE_30Rnd_556x45_Stanag_Mk262_mag;
    class RT_30Rnd_556x45_Stanag_Rubber: ACE_30Rnd_556x45_Stanag_Mk262_mag {
        author = "Kompoman32";
        ammo = "RT_556x45_Ball_Mk262_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_30Rnd_556x45_mag_Tracer_Dim_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_30Rnd_556x45_mag_Tracer_Dim_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_30Rnd_556x45_mag_Tracer_Dim_Description";
    };


    class ACE_10Rnd_762x51_Mag_SD;
    class RT_10Rnd_762x51_Mag_SD_Rubber: ACE_10Rnd_762x51_Mag_SD {
        author = "Kompoman32";
        ammo = "RT_762x51_Ball_Subsonic_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_10Rnd_762x51_mag_SD_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_10Rnd_762x51_mag_SD_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_10Rnd_762x51_mag_SD_Description";
    };

    class ACE_20Rnd_762x51_Mag_SD;
    class RT_20Rnd_762x51_Mag_SD_Rubber: ACE_20Rnd_762x51_Mag_SD {
        author = "Kompoman32";
        ammo = "RT_762x51_Ball_Subsonic_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_20Rnd_762x51_mag_SD_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_20Rnd_762x51_mag_SD_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_20Rnd_762x51_mag_SD_Description";
    };


    class ACE_10Rnd_338_300gr_HPBT_Mag;
    class RT_10Rnd_338_300gr_Rubber_Mag: ACE_10Rnd_338_300gr_HPBT_Mag {
        author = "Kompoman32";
        ammo = "RT_338_Ball_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_10Rnd_338_300gr_HPBT_Mag_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_10Rnd_338_300gr_HPBT_Mag_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_10Rnd_338_300gr_HPBT_Mag_Description";
    };

    class ACE_20Rnd_762x67_Mk248_Mod_0_Mag;
    class RT_20Rnd_762x67_Mk248_Mod_0_Rubber_Mag: ACE_20Rnd_762x67_Mk248_Mod_0_Mag {
        author = "Kompoman32";
        ammo = "RT_762x67_Ball_Rubber_Mk248_Mod_0";
        displayName = "$STR_RT_AMMO_Rubber_20Rnd_762x67_Mk248_Mod_0_Mag_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_20Rnd_762x67_Mk248_Mod_0_Mag_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_20Rnd_762x67_Mk248_Mod_0_Mag_Description";
    };

    class ACE_20Rnd_65x47_Scenar_mag;
    class RT_20Rnd_65x47_Rubber_mag: ACE_20Rnd_65x47_Scenar_mag {
        author = "Kompoman32";
        ammo = "RT_65x47_Ball_Scenar_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_20Rnd_65x47_Scenar_mag_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_20Rnd_65x47_Scenar_mag_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_20Rnd_65x47_Scenar_mag_Description";
    };

    class ACE_7Rnd_408_305gr_Mag;
    class RT_7Rnd_408_Rubber_Mag: ACE_7Rnd_408_305gr_Mag {
        author = "Kompoman32";
        ammo = "RT_408_Ball_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_7Rnd_408_305gr_Mag_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_7Rnd_408_305gr_Mag_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_7Rnd_408_305gr_Mag_Description";
    };

    class ACE_5Rnd_127x99_Mag;
    class RT_5Rnd_127x99_Rubber_Mag: ACE_5Rnd_127x99_Mag {
        author = "Kompoman32";
        ammo = "RT_127x99_Ball_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_5Rnd_127x99_Mag_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_127x99_Mag_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_5Rnd_127x99_Mag_Description";
    };

    class RT_10Rnd_127x99_Rubber_Mag: RT_5Rnd_127x99_Rubber_Mag {
        displayName = "$STR_RT_AMMO_Rubber_10Rnd_127x99_AMAX_Mag_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_127x99_AMAX_Mag_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_10Rnd_127x99_AMAX_Mag_Description";

        count = 10;
        mass = 32; // 5Rnd_127x108_Mag mass * 2
    };

    class ACE_16Rnd_9x19_mag;
    class RT_16Rnd_9x19_Rubber_mag: ACE_16Rnd_9x19_mag {
        author = "Kompoman32";
        ammo = "RT_9x19_Ball_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_16Rnd_9x19_mag_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_16Rnd_9x19_mag_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_16Rnd_9x19_mag_Description";
    };

    class ACE_10Rnd_762x54_Tracer_mag;
    class RT_10Rnd_762x54_Tracer_Rubber_mag: ACE_10Rnd_762x54_Tracer_mag {
        author = "Kompoman32";
        ammo = "RT_762x54_Ball_Rubber_7T2";
        displayName = "$STR_RT_AMMO_Rubber_10Rnd_762x54_Tracer_mag_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_10Rnd_762x54_Tracer_mag_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_10Rnd_762x54_Tracer_mag_Description";
    };


    // Не из ACE

    class 30Rnd_762x39_AK12_Mag_F;
    class RT_30Rnd_762x39_AK12_Rubber_Mag_F: 30Rnd_762x39_AK12_Mag_F {
        author = "Kompoman32";
        ammo = "RT_B_762x39_Rubber_F";
        displayName = "$STR_RT_AMMO_Rubber_30Rnd_762x39_AK12_Mag_F_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_30Rnd_762x39_AK12_Mag_F_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_30Rnd_762x39_AK12_Mag_F_Description";
    };

    class 30Rnd_762x39_Mag_F;
    class RT_30Rnd_762x39_Rubber_Mag_F: 30Rnd_762x39_Mag_F {
        author = "Kompoman32";
        ammo = "RT_B_762x39_Rubber_F";
        displayName = "$STR_RT_AMMO_Rubber_30Rnd_762x39_Mag_F_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_30Rnd_762x39_Mag_F_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_30Rnd_762x39_Mag_F_Description";
    };

    class 75Rnd_762x39_AK12_Mag_F;
    class RT_75Rnd_762x39_AK12_Rubber_Mag_F: 75Rnd_762x39_AK12_Mag_F {
        author = "Kompoman32";
        ammo = "RT_B_762x39_Rubber_F";
        displayName = "$STR_RT_AMMO_Rubber_75Rnd_762x39_AK12_Mag_F_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_75Rnd_762x39_AK12_Mag_F_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_75Rnd_762x39_AK12_Mag_F_Description";
    };

    class 75Rnd_762x39_Mag_F;
    class RT_75Rnd_762x39_Rubber_Mag_F: 75Rnd_762x39_Mag_F {
        author = "Kompoman32";
        ammo = "RT_B_762x39_Rubber_F";
        displayName = "$STR_RT_AMMO_Rubber_75Rnd_762x39_Mag_F_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_75Rnd_762x39_Mag_F_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_75Rnd_762x39_Mag_F_Description";
    };

    class 30Rnd_545x39_Mag_F;
    class RT_30Rnd_545x39_Rubber_Mag_F: 30Rnd_545x39_Mag_F {
        author = "Kompoman32";
        ammo = "RT_B_545x39_Rubber_F";
        displayName = "$STR_RT_AMMO_Rubber_30Rnd_545x39_Mag_F_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_30Rnd_545x39_Mag_F_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_30Rnd_545x39_Mag_F_Description";
    };

    class 30Rnd_580x42_Mag_F;
    class RT_30Rnd_580x42_Rubber_Mag_F: 30Rnd_580x42_Mag_F {
        author = "Kompoman32";
        ammo = "RT_B_580x42_Rubber_F";
        displayName = "$STR_RT_AMMO_Rubber_30Rnd_580x42_Mag_F_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_30Rnd_580x42_Mag_F_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_30Rnd_580x42_Mag_F_Description";
    };

    class 100Rnd_580x42_Mag_F;
    class RT_100Rnd_580x42_Rubber_Mag_F: 100Rnd_580x42_Mag_F {
        author = "Kompoman32";
        ammo = "RT_B_580x42_Rubber_F";
        displayName = "$STR_RT_AMMO_Rubber_100Rnd_580x42_Mag_F_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_100Rnd_580x42_Mag_F_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_100Rnd_580x42_Mag_F_Description";
    };

    class 30Rnd_65x39_caseless_msbs_mag;
    class RT_30Rnd_65x39_caseless_msbs_Rubber_mag: 30Rnd_65x39_caseless_msbs_mag {
        author = "Kompoman32";
        ammo = "RT_B_65x39_caseless_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_30Rnd_65x39_caseless_msbs_Mag_F_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_30Rnd_65x39_caseless_msbs_Mag_F_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_30Rnd_65x39_caseless_msbs_Mag_F_Description";
    };
    
    class 10Rnd_127x54_Mag;
    class RT_10Rnd_127x54_Rubber_Mag: 10Rnd_127x54_Mag {
        author = "Kompoman32";
        ammo = "RT_B_127x54_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_10Rnd_127x54_Mag_F_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_10Rnd_127x54_Mag_F_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_10Rnd_127x54_Mag_F_Description";
    };

    class 10Rnd_93x64_DMR_05_Mag;
    class RT_10Rnd_93x64_DMR_05_Rubber_Mag: 10Rnd_93x64_DMR_05_Mag {
        author = "Kompoman32";
        ammo = "RT_B_93x64_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_10Rnd_93x64_DMR_05_Mag_F_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_10Rnd_93x64_DMR_05_Mag_F_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_10Rnd_93x64_DMR_05_Mag_F_Description";
    };

    class 20Rnd_650x39_Cased_Mag_F;
    class RT_20Rnd_650x39_Cased_Rubber_Mag_F: 20Rnd_650x39_Cased_Mag_F {
        author = "Kompoman32";
        ammo = "RT_B_65x39_Case_green_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_20Rnd_650x39_Cased_Mag_F_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_20Rnd_650x39_Cased_Mag_F_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_20Rnd_650x39_Cased_Mag_F_Description";
    };

    class 16Rnd_9x21_Mag;
    class RT_16Rnd_9x21_Rubber_Mag: 16Rnd_9x21_Mag {
        author = "Kompoman32";
        ammo = "RT_B_9x21_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_16Rnd_9x21_Mag_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_16Rnd_9x21_Mag_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_16Rnd_9x21_Mag_Description";
    };

    class 30Rnd_9x21_Mag;
    class RT_30Rnd_9x21_Rubber_Mag: 30Rnd_9x21_Mag {
        author = "Kompoman32";
        ammo = "RT_B_9x21_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_30Rnd_9x21_Mag_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_30Rnd_9x21_Mag_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_30Rnd_9x21_Mag_Description";
    };

    class 10Rnd_9x21_Mag;
    class RT_10Rnd_9x21_Rubber_Mag: 10Rnd_9x21_Mag {
        author = "Kompoman32";
        ammo = "RT_B_9x21_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_10Rnd_9x21_Mag_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_10Rnd_9x21_Mag_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_10Rnd_9x21_Mag_Description";
    };

    class 11Rnd_45ACP_Mag;
    class RT_11Rnd_45ACP_Rubber_Mag: 11Rnd_45ACP_Mag {
        author = "Kompoman32";
        ammo = "RT_B_45ACP_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_11Rnd_45ACP_Mag_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_11Rnd_45ACP_Mag_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_11Rnd_45ACP_Mag_Description";
    };

    class 6Rnd_45ACP_Cylinder ;
    class RT_6Rnd_45ACP_Rubber_Cylinder : 6Rnd_45ACP_Cylinder  {
        author = "Kompoman32";
        ammo = "RT_B_45ACP_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_6Rnd_45ACP_Cylinder_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_6Rnd_45ACP_Cylinder_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_6Rnd_45ACP_Cylinder_Description";
    };

    class 9Rnd_45ACP_Mag ;
    class RT_9Rnd_45ACP_Rubber_Mag : 9Rnd_45ACP_Mag  {
        author = "Kompoman32";
        ammo = "RT_B_45ACP_Rubber_Green";
        displayName = "$STR_RT_AMMO_Rubber_9Rnd_45ACP_Mag_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_9Rnd_45ACP_Mag_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_9Rnd_45ACP_Mag_Description";
    };

    class 150RNd_93x64_Mag ;
    class RT_150Rnd_93x64_Rubber_Mag : 150RNd_93x64_Mag  {
        author = "Kompoman32";
        ammo = "RT_B_93x64_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_150RNd_93x64_Mag_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_150RNd_93x64_Mag_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_150RNd_93x64_Mag_Description";
    };

    class 130Rnd_338_Mag ;
    class RT_130Rnd_338_Rubber_Mag : 130Rnd_338_Mag  {
        author = "Kompoman32";
        ammo = "RT_B_338_NM_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_130Rnd_338_Mag_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_130Rnd_338_Mag_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_130Rnd_338_Mag_Description";
    };
    
    class 200Rnd_556x45_Box_F ;
    class RT_200Rnd_556x45_Rubber_Box_F : 200Rnd_556x45_Box_F  {
        author = "Kompoman32";
        ammo = "RT_B_556x45_Rubber_Tracer_Yellow";
        displayName = "$STR_RT_AMMO_Rubber_200Rnd_556x45_Box_F_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_200Rnd_556x45_Box_F_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_200Rnd_556x45_Box_F_Description";
    };
    
    class 150Rnd_762x51_Box ;
    class RT_150Rnd_762x51_Rubber_Box : 150Rnd_762x51_Box  {
        author = "Kompoman32";
        ammo = "RT_B_762x54_Rubber_Tracer_Green";
        displayName = "$STR_RT_AMMO_Rubber_150Rnd_762x51_Box_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_150Rnd_762x51_Box_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_150Rnd_762x51_Box_Description";
    };

    class 150Rnd_762x54_Box ;
    class RT_150Rnd_762x54_Rubber_Box : 150Rnd_762x54_Box  {
        author = "Kompoman32";
        ammo = "RT_B_762x54_Rubber_Tracer_Green";
        displayName = "$STR_RT_AMMO_Rubber_150Rnd_762x54_Box_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_150Rnd_762x54_Box_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_150Rnd_762x54_Box_Description";
    };

    class 30Rnd_45ACP_Mag_SMG_01 ;
    class RT_30Rnd_45ACP_Rubber_Mag_SMG_01 : 30Rnd_45ACP_Mag_SMG_01  {
        author = "Kompoman32";
        ammo = "RT_B_45ACP_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_30Rnd_45ACP_Mag_SMG_01_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_30Rnd_45ACP_Mag_SMG_01_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_30Rnd_45ACP_Mag_SMG_01_Description";
    };

    class 30Rnd_9x21_Mag_SMG_02 ;
    class RT_30Rnd_9x21_Rubber_Mag_SMG_02 : 30Rnd_9x21_Mag_SMG_02  {
        author = "Kompoman32";
        ammo = "RT_B_9x21_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_30Rnd_9x21_Mag_SMG_02_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_30Rnd_9x21_Mag_SMG_02_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_30Rnd_9x21_Mag_SMG_02_Description";
    };

    class 50Rnd_570x28_SMG_03 ;
    class RT_50Rnd_570x28_Rubber_SMG_03 : 50Rnd_570x28_SMG_03  {
        author = "Kompoman32";
        ammo = "RT_B_570x28_Rubber";
        displayName = "$STR_RT_AMMO_Rubber_50Rnd_570x28_SMG_03_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_50Rnd_570x28_SMG_03_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_50Rnd_570x28_SMG_03_Description";
    };

    // class 30Rnd_9x21_Mag_SMG_02 ;
    // class RT_30Rnd_9x21_Rubber_Mag_SMG_02 : 30Rnd_9x21_Mag_SMG_02  {
    //     author = "Kompoman32";
    //     ammo = "RT_B_9x21_Rubber";
    //     displayName = "$STR_RT_AMMO_Rubber_30Rnd_9x21_Mag_SMG_02_Name";
    //     displayNameShort = "$STR_RT_AMMO_Rubber_30Rnd_9x21_Mag_SMG_02_NameShort";
    //     descriptionShort = "$STR_RT_AMMO_Rubber_30Rnd_9x21_Mag_SMG_02_Description";
    // };

    class RPG7_F;
    class RT_RPG7_Rubber_F: RPG7_F {
        author = "Kompoman32";
        ammo = "RT_R_PG7_Rubber_F";
        displayName = "$STR_RT_AMMO_Rubber_RPG7_F_Name";
        displayNameShort = "$STR_RT_AMMO_Rubber_RPG7_F_NameShort";
        descriptionShort = "$STR_RT_AMMO_Rubber_RPG7_F_Description";
    };

};

class CfgMagazineWells {
    class CBA_12g_2rnds {
        RT_AMMO[] = {
            "RT_2Rnd_12Gauge_Pellets_No0_Rubber"
        };
    };

    class HunterShotgun_01_12GA { //Vanilla magwell
        RT_AMMO[] = {
            "RT_2Rnd_12Gauge_Pellets_No0_Rubber"
        };
    };

    class UBS_12GA { //Vanilla magwell
        RT_AMMO[] = {
            "RT_6Rnd_12Gauge_Pellets_No0_Rubber"
        };
    };

    class MX_65x39 { //Vanilla magwell
        RT_AMMO[] = {
            "RT_30Rnd_65x39_caseless_mag_Rubber_Tracer_Dim"
        };
    };

    class CBA_65x39_MX {
        RT_AMMO[] = {
            "RT_30Rnd_65x39_caseless_mag_Rubber_Tracer_Dim"
        };
    };

    class MX_65x39_Large { //Vanilla magwell
        RT_AMMO[] = {
            "RT_100Rnd_65x39_caseless_mag_Rubber_Tracer_Dim"
        };
    };

    class CBA_65x39_MX_XL {
        RT_AMMO[] = {
            "RT_100Rnd_65x39_caseless_mag_Rubber_Tracer_Dim"
        };
    };

    class Katiba_65x39 {
        RT_AMMO[] = {
            "RT_30Rnd_65x39_caseless_green_mag_Rubber_Tracer_Dim"
        };
    };

    class CBA_65x39_Katiba {
        RT_AMMO[] = {
            "RT_30Rnd_65x39_caseless_green_mag_Rubber_Tracer_Dim"
        };
    };

    class Mk200_65x39 {
        RT_AMMO[] = {
            "RT_200Rnd_65x39_cased_Box_Rubber_Tracer_Dim"
        };
    };

    class CBA_65x39_Mk200 {
        RT_AMMO[] = {
            "RT_200Rnd_65x39_cased_Box_Rubber_Tracer_Dim"
        };
    };

    class MX_65x39_MSBS {
        RT_AMMO[] = {
            "RT_30Rnd_65x39_caseless_msbs_Rubber_mag"
        };
    };

    class CBA_556x45_STANAG {
        RT_AMMO[] = {
            "RT_30Rnd_556x45_Stanag_Rubber"
        };
    };

    class CBA_556x45_SCAR_EGLM {
        RT_AMMO[] = {
            "RT_30Rnd_556x45_Stanag_Rubber"
        };
    };

    class STANAG_556x45 { //Vanilla magwell
        RT_AMMO[] = {
            "RT_30Rnd_556x45_Stanag_Rubber"
        };
    };

    class CBA_762x51_M14 {
        RT_AMMO[] = {
            "RT_10Rnd_762x51_Mag_SD_Rubber",
            "RT_20Rnd_762x51_Mag_SD_Rubber"
        };
    };

    class CBA_762x51_HK417 {
        RT_AMMO[] = {
            "RT_10Rnd_762x51_Mag_SD_Rubber",
            "RT_20Rnd_762x51_Mag_SD_Rubber"
        };
    };

    class CBA_762x51_SR25 {
        RT_AMMO[] = {
            "RT_10Rnd_762x51_Mag_SD_Rubber",
            "RT_20Rnd_762x51_Mag_SD_Rubber"
        };
    };

    class CBA_762x51_G3 {
        RT_AMMO[] = {
            "RT_10Rnd_762x51_Mag_SD_Rubber",
            "RT_20Rnd_762x51_Mag_SD_Rubber"
        };
    };

    class CBA_65C_AR10 {
        RT_AMMO[] = {
            "RT_20Rnd_65x47_Rubber_mag"
        };
    };

    class M320_408 {
        RT_AMMO[] = {
            "RT_7Rnd_408_Rubber_Mag"
        };
    };

    class CBA_408CT_Inter {
        RT_AMMO[] = {
            "RT_7Rnd_408_Rubber_Mag"
        };
    };

    class CBA_50BMG_AS50 {
        RT_AMMO[] = {
            "RT_5Rnd_127x99_Rubber_Mag"
        };
    };

    class CBA_50BMG_M107 {
        RT_AMMO[] = {
            "RT_10Rnd_127x99_Rubber_Mag"
        };
    };

    class CBA_9x19_P226 { // SIG P226
        RT_AMMO[] = {
            "RT_16Rnd_9x19_Rubber_mag"
        };
    };

    class CBA_9x19_P228 { // SIG P228
        RT_AMMO[] = {
            "RT_16Rnd_9x19_Rubber_mag"
        };
    };

    class CBA_9x19_P239 { // SIG P239
        RT_AMMO[] = {
            "RT_16Rnd_9x19_Rubber_mag"
        };
    };

    class CBA_9x19_HiPower {
        RT_AMMO[] = {
            "RT_16Rnd_9x19_Rubber_mag"
        };
    };

    class SVD_762x54R { //Vanilla
        RT_AMMO[] = {
            "RT_10Rnd_762x54_Tracer_Rubber_mag"
        };
    };

    class Rahim_762x54 {
        RT_AMMO[] = {
            "RT_10Rnd_762x54_Tracer_Rubber_mag"
        };
    };

    class CBA_762x54R_SVD {
        RT_AMMO[] = {
            "RT_10Rnd_762x54_Tracer_Rubber_mag"
        };
    };    
    
    class CBA_762x54R_LINKS {
        RT_AMMO[] = {
            "RT_150Rnd_762x54_Rubber_Box"
        };
    };


    class AK_762x39 { // Vanilla
        RT_AMMO[] = {
            "RT_30Rnd_762x39_AK12_Rubber_Mag_F",
            "RT_75Rnd_762x39_AK12_Rubber_Mag_F"
        };
    };

    class CBA_762x39_AK {
        RT_AMMO[] = {
            "RT_30Rnd_762x39_AK12_Rubber_Mag_F",
            "RT_75Rnd_762x39_AK12_Rubber_Mag_F"
        };
    };

    class CBA_762x39_RPK {
        RT_AMMO[] = {
            "RT_30Rnd_762x39_Rubber_Mag_F",
            "RT_75Rnd_762x39_Rubber_Mag_F"
        };
    };

    class AK_545x39 { // Vanilla
        RT_AMMO[] = {
            "RT_30Rnd_545x39_Rubber_Mag_F"
        };
    };

    class CBA_545x39_AK {
        RT_AMMO[] = {
            "RT_30Rnd_545x39_Rubber_Mag_F"
        };
    };

    class CBA_545x39_RPK {
        RT_AMMO[] = {
            "RT_30Rnd_545x39_Rubber_Mag_F"
        };
    };


    class CTAR_580x42 {
        RT_AMMO[] = {
            "RT_30Rnd_580x42_Rubber_Mag_F"
        };
    };

    class CTAR_580x42_Large {
        RT_AMMO[] = {
            "RT_100Rnd_580x42_Rubber_Mag_F"
        };
    };

    class CBA_580x42_TYPE95 {
        RT_AMMO[] = {
            "RT_30Rnd_580x42_Rubber_Mag_F"
        };
    };

    class CBA_580x42_TYPE95_XL {
        RT_AMMO[] = {
            "RT_100Rnd_580x42_Rubber_Mag_F"
        };
    };


    class ASP1_127x54 {
        RT_AMMO[] = {
            "RT_10Rnd_127x54_Rubber_Mag"
        };
    };

    class Cyrus_93 {
        RT_AMMO[] = {
            "RT_10Rnd_93x64_DMR_05_Rubber_Mag"
        };
    };

    class CBA_93x64_LINKS {
        RT_AMMO[] = {
            "RT_10Rnd_93x64_DMR_05_Rubber_Mag"
        };
    };

    class CBA_65C_AR10 {
        RT_AMMO[] = {
            "RT_20Rnd_650x39_Cased_Rubber_Mag_F"
        };
    };

    class CBA_9x21_16 {
        RT_AMMO[] = {
            "RT_16Rnd_9x21_Rubber_Mag"
        };
    };

    class CBA_9x21_30 {
        RT_AMMO[] = {
            "RT_30Rnd_9x21_Rubber_Mag"
        };
    };

    class Pistol_9x21_10 {
        RT_AMMO[] = {
            "RT_10Rnd_9x21_Rubber_Mag"
        };
    };

    // class Pistol_9x21 {
    //     RT_AMMO[] = {
    //         "RT_10Rnd_9x21_Rubber_Mag"
    //     };
    // };

    class ACPC2_45ACP {
        RT_AMMO[] = {
            "RT_11Rnd_45ACP_Rubber_Mag"
        };
    };

    class PistolHeavy_01_45ACP {
        RT_AMMO[] = {
            "RT_11Rnd_45ACP_Rubber_Mag"
        };
    };

    class Cylinder_45ACP {
        RT_AMMO[] = {
            "RT_6Rnd_45ACP_Rubber_Cylinder"
        };
    };

    class CBA_45ACP_Clip_6rnds {
        RT_AMMO[] = {
            "RT_6Rnd_45ACP_Rubber_Cylinder"
        };
    };

    class CBA_45ACP_1911 {
        RT_AMMO[] = {
            "RT_9Rnd_45ACP_Rubber_Mag"
        };
    };

    class CBA_93x64_LINKS {
        RT_AMMO[] = {
            "RT_150Rnd_93x64_Rubber_Mag"
        };
    };

    class SPMG_338 {
        RT_AMMO[] = {
            "RT_130Rnd_338_Rubber_Mag"
        };
    };

    class CBA_338NM_LINKS {
        RT_AMMO[] = {
            "RT_130Rnd_338_Rubber_Mag"
        };
    };

    class CBA_556x45_MINIMI {
        RT_AMMO[] = {
            "RT_200Rnd_556x45_Rubber_Box_F"
        };
    };

    class MAR10_338 { //Vanilla magwell
        RT_AMMO[] = {
            "RT_10Rnd_338_300gr_Rubber_Mag",
            "RT_20Rnd_762x67_Mk248_Mod_0_Rubber_Mag"
        };
    };



    class CBA_45ACP_Glock_Full {
        RT_AMMO[] = {
            "RT_30Rnd_45ACP_Rubber_Mag_SMG_01"
        };
    };

    class CBA_9x19_ScorpionEvo3 {
        RT_AMMO[] = {
            "RT_30Rnd_9x21_Rubber_Mag_SMG_02"
        };
    };

    class CBA_57x28_P90 {
        RT_AMMO[] = {
            "RT_50Rnd_570x28_Rubber_SMG_03"
        };
    };

    class CBA_9x19_MP5 {
        RT_AMMO[] = {
            "RT_30Rnd_9x21_Rubber_Mag_SMG_02"
        };
    };


    // launchers 

    class CBA_RPG7 {
        RT_AMMO[] = {
            "RT_RPG7_Rubber_F"
        };
    };

    

};