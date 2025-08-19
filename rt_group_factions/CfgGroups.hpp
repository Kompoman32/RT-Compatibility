
class CfgGroups {
    class EAST {
        class O_NO {
            name = "The New Order";

            class Infantry {
                name = "Infantry";

            };

            class SpecOps {
                name = "Special Forces";

                class O_NO_InsertionTeam {
                    name = "Insertion Team";
                    side = 0;
                    faction = "O_NO";
                    icon = "\A3\ui_f\data\map\markers\nato\o_inf.paa";
                    rarityGroup = 0.5;

                    class Unit0 {
                        position[] = {0,0,0};
                        rank = "SERGEANT";
                        side = 0;
                        vehicle = "O_NO_Operator";
                    };
                    class Unit1 {
                        position[] = {5,-5,0};
                        rank = "CORPORAL";
                        side = 0;
                        vehicle = "O_NO_Operator";
                    };
                    class Unit2 {
                        position[] = {-5,-5,0};
                        rank = "PRIVATE";
                        side = 0;
                        vehicle = "O_NO_Operator";
                    };
                    class Unit3 {
                        position[] = {10,-10,0};
                        rank = "PRIVATE";
                        side = 0;
                        vehicle = "O_NO_Operator";
                    };
                };
            };

            class Motorized {
                name = "Motorized Infantry";
            };

            class Motorized_MTP {
                name = "Motorized Infantry (MTP)";
            };

            class Support {
                name = "Support Infantry";
            };

            class Mechanized {
                name = "Mechanized Infantry";
            };

            class Armored {
                name = "Armor";
            };

            class Artillery {
                name = "Artillery";
            };

            class Naval {
                name = "Naval";
            };

            class Air {
                name = "Air";
            };
        };
    };
};