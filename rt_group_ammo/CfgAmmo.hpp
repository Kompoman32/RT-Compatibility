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
        timeToLive = 1000;
        grenadeFireSound[] = {};
        grenadeBurningSound[] = {};
        smokeColor[] = {0,0,0,0};
        effectsSmoke = "";
        whistleDist = 0;
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
};

class CfgWeapons {
    class GrenadeLauncher;
    class Throw: GrenadeLauncher {
        muzzles[] += {"RT_PotatoMuzzle"};

		class ThrowMuzzle;
        class RT_PotatoMuzzle: ThrowMuzzle {
            magazines[] = {"RT_Potato"};
		};
	};
};