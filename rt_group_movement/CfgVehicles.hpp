class CfgVehicles
{
    class B_Carryall_oli;
    class FTAC_Invisi_bp: B_Carryall_oli
    {
        scope=1;
        scopeCurator=0;
        scopeArsenal=0;
        displayName="";
        picture="";
        model="\a3\weapons_f\empty.p3d";
        author="GNZ";
        class TransportWeapons;
        class TransportMagazines;
        class TransportItems;
    };
    class FTAC_Inv_bp: FTAC_Invisi_bp
    {
        scopeCurator=2;
        displayName="Invisible Backpack";
    };
};
