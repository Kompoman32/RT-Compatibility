class CfgVehicles {
	class Items_base_F;
	class ace_advanced_throwing_pickUpHelper: Items_base_F {
		class ACE_Actions {
			class ace_advanced_throwing_pickUp {
				displayName = "$STR_ACE_Advanced_Throwing_PickUp";
				condition = "[_player, true] call ace_advanced_throwing_fnc_canPrepare";
				statement = "_this call RT_Ammo_fnc_grenadePickup";
				exceptions[] = {"isNotSwimming"};
				distance = 1.8; // Requires >1.7 to work when standing with weapon on back
				icon = "\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_takemine_ca.paa";
			};
		}
	}
};