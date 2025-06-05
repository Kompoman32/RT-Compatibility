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
        displayname = "$STR_RT_AMMO_AfghanPotato_itemName";
        descriptionShort = "$STR_RT_AMMO_AfghanPotato_itemDescription";
        displayNameShort = "$STR_RT_AMMO_AfghanPotato_itemNameShort";
        model = "rt\ammo\assets\potatA.p3d";
        picture = "\rt\ammo\assets\potato_icon_ca.paa";
        ammo = "RT_G_Af_Potato";
        mass = 3;
    };
};

class CfgWeapons {
    class GrenadeLauncher;
    class Throw: GrenadeLauncher {
        muzzles[] += {"RT_PotatoMuzzle", "RT_Af_PotatoMuzzle"};

		class ThrowMuzzle;
        class RT_PotatoMuzzle: ThrowMuzzle {
            magazines[] = {"RT_Potato"};
		};

        class RT_Af_PotatoMuzzle: ThrowMuzzle {
            magazines[] = {"RT_Af_Potato"};
		};
	};
};