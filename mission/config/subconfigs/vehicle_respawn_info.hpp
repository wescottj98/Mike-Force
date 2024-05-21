#include "..\ui\icons.inc"

#define RESPAWN_SHORT respawnType = "RESPAWN"; time = 10
#define RESPAWN_MEDIUM respawnType = "RESPAWN"; time = 30
#define RESPAWN_LONG respawnType = "RESPAWN"; time = 60
#define WRECK_SHORT respawnType = "WRECK"; time = 10
#define WRECK_MEDIUM respawnType = "WRECK"; time = 30
#define WRECK_LONG respawnType = "WRECK"; time = 60

class vehicles {

	//Helo Transport
	class vn_b_air_ch47_01_01 {
		tags[] = {"ch47","armed","transport","helicopter","army"};
	};
	class vn_b_air_ch47_01_02 {
		tags[] = {"ch47", "transport", "helicopter", "7th"};
	};
	class vn_b_air_ch47_02_01 {
		tags[] = {"ch47","armed","transport","helicopter","dustoff"};
	};
	class vn_b_air_ch47_03_01 {
		tags[] = {"ch47","armed","transport","helicopter","cargo","army"};
	};
	class vn_b_air_ch47_03_02 {
		tags[] = {"ch47", "transport", "helicopter", "7th"};
	};
	class vn_b_air_ch47_04_01 {
		tags[] = {"ch47","armed","transport","helicopter","army"};
	};
	class vn_b_air_oh6a_01 {
		tags[] = {"oh6a","transport","helicopter"};
	};
	class vn_b_air_uh1b_01_03 {
		tags[] = {"uh1","transport","medical", "helicopter", "dustoff"};
	};
	class vn_b_air_uh1d_01_03 {
		tags[] = {"uh1","transport","medical", "helicopter", "dustoff"};
	};
	class vn_b_air_uh1e_03_04 {
		tags[] = {"uh1","armed","transport","helicopter","usmc"};
	};
	class vn_i_air_ch34_01_02 {
		tags[] = {"ch34","armed","transport","helicopter","arvn"};
	};
	class vn_i_air_ch34_02_02 {
		tags[] = {"ch34","armed","transport","helicopter","arvn"};
	};
	class vn_b_air_ch34_01_01 {
		tags[] = {"ch34","armed","transport","helicopter","usmc"};
	};
	class vn_b_air_ch34_03_01 {
		tags[] = {"ch34","armed","transport","helicopter","usmc"};
	};
	class B_Heli_Light_01_F {
		tags[] = {"hummingbird", "transport", "helicopter", "cia"};
	};
	class vn_b_air_uh1b_01_09 {
		tags[] = {"uh1", "transport", "helicopter", "cia"};
	};
	class vn_b_air_uh1d_04_09 {
		tags[] = {"uh1", "transport", "helicopter", "cia"};
	};
	class vn_b_air_uh1c_07_01 {
		tags[] = {"uh1","armed","transport","helicopter","army"};
	};
	class vn_b_air_uh1c_07_02 {
		tags[] = {"uh1", "transport", "helicopter", "7th"};
	};
	class vn_b_air_uh1c_07_03 {
		tags[] = {"uh1", "transport", "helicopter", "usaf"};
	};
	class vn_b_air_uh1c_07_04 {
		tags[] = {"uh1", "transport", "helicopter", "usmc"};
	};
	class vn_b_air_uh1c_07_05 {
		tags[] = {"uh1", "transport", "helicopter", "frogmen"};
	};
	class vn_b_air_uh1c_07_06 {
		tags[] = {"uh1", "transport", "helicopter", "anzac"};
	};
	class vn_b_air_uh1c_07_07 {
		tags[] = {"uh1", "transport", "helicopter", "tf"};
	};
	class vn_b_air_uh1d_02_01 {
		tags[] = {"uh1","armed","transport","helicopter","army"};
	};
	class vn_b_air_uh1d_02_02 {
		tags[] = {"uh1", "transport", "helicopter", "7th"};
	};
	class vn_b_air_uh1d_02_03 {
		tags[] = {"uh1", "transport", "helicopter", "usaf"};
	};
	class vn_b_air_uh1d_02_04 {
		tags[] = {"uh1","transport","helicopter","usmc"};
	};
	class vn_b_air_uh1d_02_05 {
		tags[] = {"uh1", "transport", "helicopter", "frogmen"};
	};
	class vn_b_air_uh1d_02_06 {
		tags[] = {"uh1", "transport", "helicopter", "anzac"};
	};
	class vn_b_air_uh1d_02_07 {
		tags[] = {"uh1", "transport", "helicopter", "tf"};
	};
	class vn_b_air_uh1f_01_03 {
		tags[] = {"uh1", "transport", "helicopter", "usaf"};
	};
	class vn_i_air_uh1c_07_01{
		tags[] = {"uh1", "transport", "helicopter", "arvn"};
	};
	class vn_i_air_uh1d_02_01{
		tags[] = {"uh1", "transport", "helicopter", "arvn"};
	};

	//Helo CAS
	class vn_b_air_ach47_01_01 {
		tags[] = {"ch47","armed","firesupport","helicopter"};
	};
	class vn_b_air_ah1g_01 {
		tags[] = {"ah1g","armed","firesupport","helicopter"};
	};
	class vn_b_air_ah1g_06 {
		tags[] = {"ah1g","armed","firesupport","helicopter"};
	};
	class vn_b_air_oh6a_02 {
		tags[] = {"oh6a","armed","scout","helicopter","MG"};
	};
	class vn_b_air_oh6a_03 {
		tags[] = {"oh6a","armed","scout","helicopter","GL"};
	};
	class vn_b_air_oh6a_05 {
		tags[] = {"oh6a","armed","firesupport","helicopter"};
	};
	class vn_b_air_uh1c_01_01 {
		tags[] = {"uh1","armed","firesupport","helicopter"};
	};
	class vn_b_air_uh1c_02_01 {
		tags[] = {"uh1","armed","firesupport","helicopter"};
	};
	class vn_b_air_uh1c_03_01 {
		tags[] = {"uh1","armed","firesupport","helicopter"};
	};
	class vn_b_air_uh1c_04_01 {
		tags[] = {"uh1","armed","firesupport","helicopter"};
	};
	class vn_b_air_uh1c_05_01 {
		tags[] = {"uh1","armed","firesupport","helicopter"};
	};
	class vn_b_air_uh1c_06_01 {
		tags[] = {"uh1","armed","firesupport","helicopter"};
	};
	class vn_b_air_uh1d_03_06 {
		tags[] = {"uh1","armed","firesupport","helicopter"};
	};
	class vn_b_air_uh1e_01_04 {
		tags[] = {"uh1","armed","firesupport","helicopter"};
	};
	class vn_b_air_uh1e_02_04 {
		tags[] = {"uh1","armed","firesupport","helicopter"};
	};
	class vn_b_air_ch34_04_01 {
		tags[] = {"ch34","armed","firesupport","helicopter"};
	};

	//Plane CAS
	class vn_b_air_f100d_at {
		tags[] = {"f100","armed","firesupport","jet"};
	};
	class vn_b_air_f4b_navy_at {
		tags[] = {"f4","armed","firesupport","jet","naval"};
	};
	class vn_b_air_f4c_at {
		tags[] = {"f4","armed","firesupport","jet"};
	};

	//APC
	class vn_b_armor_m113_01 {
		tags[] = {"m113","armed","transport","apc"};
	};
	class vn_b_armor_m113_acav_01 {
		tags[] = {"m113","armed","transport","apc"};
	};
	class vn_b_armor_m113_acav_02 {
		tags[] = {"m113","armed","transport","apc"};
	};
	class vn_b_armor_m113_acav_03 {
		tags[] = {"m113","armed","transport","apc"};
	};
	class vn_b_armor_m113_acav_04 {
		tags[] = {"m113","armed","transport","apc"};
	};
	class vn_b_armor_m113_acav_05 {
		tags[] = {"m113","armed","transport","apc"};
	};
	class vn_b_armor_m113_acav_06 {
		tags[] = {"m113","armed","firesupport","apc","antitank"};
	};
	class vn_b_armor_m125_01 {
		tags[] = {"m113","armed","firesupport","apc","artillery"};
	};
	class vn_b_armor_m132_01 {
		tags[] = {"m113","armed","firesupport","apc","flamethrower"};
	};
	class vn_b_armor_m577_01 {
		tags[] = {"m577","transport","apc"};
	};
	class vn_b_armor_m577_02 {
		tags[] = {"m577","medical","apc"};
	};	

	//Armor
	class vn_b_armor_m41_01_01 {
		tags[] = {"m41a3","armed","firesupport","tank","lighttank","antitank","army"};
	};
	class vn_b_armor_m48_01_01 {
		tags[] = {"m48a3","armed","firesupport","tank","heavytank","antitank","army"};
	};
	class vn_b_armor_m67_01_01 {
		tags[] = {"m67a2","armed","firesupport","tank","flamethrower","army"};
	};
	class vn_b_armor_m41_01_02 {
		tags[] = {"m41a3","armed","firesupport","tank","lighttank","antitank","usmc"};
	};
	class vn_b_armor_m48_01_02 {
		tags[] = {"m48a3","armed","firesupport","tank","heavytank","antitank","usmc"};
	};
	class vn_b_armor_m67_01_02 {
		tags[] = {"m67a2","armed","firesupport","tank","flamethrower","usmc"};
	};
	class vn_i_armor_type63_01 {
		tags[] = {"type63","armed","firesupport","tank","lighttank","arvn"};
	};

	//Car
	class vn_b_wheeled_lr2a_01_aus_army {
		tags[] = {"dirtranger","transport","car"};
	};
	class vn_b_wheeled_lr2a_02_aus_army {
		tags[] = {"dirtranger","transport","car"};
	};
	class vn_b_wheeled_lr2a_03_aus_army {
		tags[] = {"dirtranger","medical","car"};
	};
	class vn_b_wheeled_lr2a_mg_01_aus_army {
		tags[] = {"dirtranger","armed","firesupport","car"};
	};
	class vn_b_wheeled_lr2a_mg_02_aus_army {
		tags[] = {"dirtranger","armed","firesupport","car"};
	};
	class vn_b_wheeled_lr2a_mg_03_aus_army {
		tags[] = {"dirtranger","armed","firesupport","car","antitank"};
	};
	class vn_b_wheeled_m151_01 {
		tags[] = {"m151a1","transport","car","army"};
	};
	class vn_b_wheeled_m151_02 {
		tags[] = {"m151a1","transport","car","army"};
	};
	class vn_b_wheeled_m151_01_mp {
		tags[] = {"m151a1","transport","car","mp"};
	};
	class vn_b_wheeled_m151_02_mp {
		tags[] = {"m151a1","transport","car","mp"};
	};
	class vn_b_wheeled_m151_01_usmc {
		tags[] = {"m151a1","transport","car","usmc"};
	};
	class vn_b_wheeled_m151_02_usmc {
		tags[] = {"m151a1","transport","car","usmc"};
	};
	class vn_b_wheeled_m151_mg_02 {
		tags[] = {"m151a1","armed","firesupport","car","army"};
	};
	class vn_b_wheeled_m151_mg_02_mp {
		tags[] = {"m151a1","armed","firesupport","car","mp"};
	};
	class vn_b_wheeled_m151_mg_02_usmc {
		tags[] = {"m151a1","armed","firesupport","car","usmc"};
	};
	class vn_b_wheeled_m151_mg_03 {
		tags[] = {"m151a1","armed","firesupport","car","army"};
	};
	class vn_b_wheeled_m151_mg_03_mp {
		tags[] = {"m151a1","armed","firesupport","car","mp"};
	};
	class vn_b_wheeled_m151_mg_03_usmc {
		tags[] = {"m151a1","armed","firesupport","car","usmc"};
	};
	class vn_b_wheeled_m151_mg_04 {
		tags[] = {"m151a1","armed","firesupport","car","army"};
	};
	class vn_b_wheeled_m151_mg_04_mp {
		tags[] = {"m151a1","armed","firesupport","car","mp"};
	};
	class vn_b_wheeled_m151_mg_04_usmc {
		tags[] = {"m151a1","armed","firesupport","car","usmc"};
	};
	class vn_b_wheeled_m151_mg_05 {
		tags[] = {"m151a1","armed","firesupport","car","antitank"};
	};
	class vn_b_wheeled_m151_mg_06 {
		tags[] = {"m151a1","armed","firesupport","car","antitank"};
	};
	class vn_b_wheeled_m274_01_01 {
		tags[] = {"m274","transport","car"};
	};
	class vn_b_wheeled_m274_02_01 {
		tags[] = {"m274","transport","car"};
	};
	class vn_b_wheeled_m274_02_03 {
		tags[] = {"m274","transport","car","airport"};
	};
	class vn_b_wheeled_m274_mg_01_01 {
		tags[] = {"m274","armed","firesupport","car"};
	};
	class vn_b_wheeled_m274_mg_02_01 {
		tags[] = {"m274","armed","firesupport","car","antitank"};
	};
	class vn_b_wheeled_m274_mg_03_01 {
		tags[] = {"m274","armed","firesupport","car"};
	};
	class vn_b_wheeled_m54_01 {
		tags[] = {"m54","transport","truck"};
	};
	class vn_b_wheeled_m54_02 {
		tags[] = {"m54","transport","truck"};
	};
	class vn_b_wheeled_m54_03 {
		tags[] = {"m109","transport","truck"};
	};
	class vn_b_wheeled_m54_01_usmc {
		tags[] = {"m54","transport","truck","usmc"};
	};
	class vn_b_wheeled_m54_02_usmc {
		tags[] = {"m54","transport","truck","usmc"};
	};
	class vn_b_wheeled_m54_03_usmc {
		tags[] = {"m109","transport","truck","usmc"};
	};
	class vn_b_wheeled_m54_ammo_usmc {
		tags[] = {"m54","ammo","truck","usmc"};
	};
	class vn_b_wheeled_m54_fuel_usmc {
		tags[] = {"m49","fuel","truck","usmc"};
	};
	class vn_b_wheeled_m54_repair_usmc {
		tags[] = {"m54","repair","truck","usmc"};
	};
	class vn_b_wheeled_m54_ammo {
		tags[] = {"m54","ammo","truck"};
	};
	class vn_b_wheeled_m54_fuel {
		tags[] = {"m49","fuel","truck"};
	};
	class vn_b_wheeled_m54_mg_01 {
		tags[] = {"m54","armed","firesupport","truck"};
	};
	class vn_b_wheeled_m54_mg_02 {
		tags[] = {"m54","armed","firesupport","truck","antiair"};
	};
	class vn_b_wheeled_m54_mg_03 {
		tags[] = {"m54","armed","firesupport","truck"};
	};
	class vn_b_wheeled_m54_repair {
		tags[] = {"m54","repair","truck"};
	};

	//Airport Car
	class vn_b_wheeled_m54_repair_airport {
		tags[] = {"m54","repair","truck","airport"};
	};
	class vn_b_wheeled_m54_fuel_airport {
		tags[] = {"m49","fuel","truck","airport"};
	};
	class vn_b_wheeled_m54_ammo_airport {
		tags[] = {"m54","ammo","truck","airport"};
	};
	class vn_b_wheeled_m54_01_airport {
		tags[] = {"m54","transport","truck","airport"};
	};
	class vn_b_wheeled_m274_01_03 {
		tags[] = {"m274","transport","car","airport"};
	};

	//Civilian
	class vn_c_bicycle_01 {
		tags[] = {"bicycle","civilian","transport","bicycle"};
	};
	class vn_c_bicycle_02 {
		tags[] = {"bicycle","civilian","transport","bicycle"};
	};
	class vn_c_car_01_01 {
		tags[] = {"boheme","civilian","transport","car"};
	};
	class vn_c_car_01_02 {
		tags[] = {"boheme","civilian","transport","car"};
	};
	class vn_c_car_02_01 {
		tags[] = {"boheme","civilian","transport","car"};
	};
	class vn_c_car_03_01 {
		tags[] = {"boheme","civilian","transport","car"};
	};
	class vn_c_car_04_01 {
		tags[] = {"boheme","civilian","transport","car"};
	};
	class vn_c_wheeled_m151_01 {
		tags[] = {"offroad","civilian","transport","car"};
	};
	class vn_c_wheeled_m151_02 {
		tags[] = {"offroad","civilian","transport","car"};
	};

	//Statics
	class vn_i_fank_70_static_sgm_high_01 {
		tags[] = {"sgm","static","machinegun"};
	};
	class vn_i_fank_70_static_sgm_low_01 {
		tags[] = {"sgm","static","machinegun"};
	};
	class vn_i_fank_70_static_sgm_low_02 {
		tags[] = {"sgm","static","machinegun"};
	};
	class vn_i_fank_70_static_zgu1_01 {
		tags[] = {"zgu1","static","antiair","nodisassemble"};
	};	
	class vn_b_army_static_tow {
		tags[] = {"bgm71","armed","firesupport","static","antitank"};
	};
	class vn_b_sf_static_tow {
		tags[] = {"bgm71","armed","firesupport","static","antitank"};
	};
	class vn_b_navy_static_l60mk3 {
		tags[] = {"l60","armed","firesupport","static","antiair","nodisassemble"};
	};
	class vn_b_navy_static_l70mk2 {
		tags[] = {"l70","armed","firesupport","static","antiair","nodisassemble"};
	};
	class vn_b_army_static_m101_01 {
		tags[] = {"m101","armed","firesupport","static","antitank","nodisassemble"};
	};
	class vn_b_army_static_m101_02 {
		tags[] = {"m101","armed","firesupport","static","artillery","nodisassemble"};
	};
	class vn_b_army_static_m1919a4_high {
		tags[] = {"m1919","armed","firesupport","static","machinegun"};
	};
	class vn_b_army_static_m1919a4_low {
		tags[] = {"m1919","armed","firesupport","static","machinegun"};
	};
	class vn_b_army_static_m1919a6 {
		tags[] = {"m1919","armed","firesupport","static","machinegun"};
	};
	class vn_b_army_static_mortar_m2 {
		tags[] = {"m2","armed","firesupport","static","artillery","mortar"};
	};
	class vn_b_army_static_mortar_m29 {
		tags[] = {"m29","armed","firesupport","static","artillery","mortar"};
	};
	class vn_b_army_static_m2_high {
		tags[] = {"m2hb","armed","firesupport","static","machinegun"};
	};
	class vn_b_army_static_m2_scoped_high {
		tags[] = {"m2hb","armed","firesupport","static","machinegun"};
	};
	class vn_b_army_static_m2_low {
		tags[] = {"m2hb","armed","firesupport","static","machinegun"};
	};
	class vn_b_army_static_m2_scoped_low {
		tags[] = {"m2hb","armed","firesupport","static","machinegun"};
	};
	class vn_b_army_static_m40a1rr {
		tags[] = {"m40","armed","firesupport","static","antitank","nodisassemble"};
	};
	class vn_b_army_static_m45 {
		tags[] = {"m45","armed","firesupport","static","antiair","nodisassemble"};
	};
	class vn_b_army_static_m60_high {
		tags[] = {"m60","armed","firesupport","static","machinegun"};
	};
	class vn_b_army_static_m60_low {
		tags[] = {"m60","armed","firesupport","static","machinegun"};
	};
	class vn_b_army_static_mk18 {
		tags[] = {"m60","armed","firesupport","static","machinegun"};
	};

	//Boat
	class vn_b_boat_12_01 {
		tags[] = {"naval","pbr"};
	};	
	class vn_b_boat_12_02 {
		tags[] = {"naval","pbr"};
	};	
	class vn_b_boat_12_03 {
		tags[] = {"naval","pbr"};
	};	
	class vn_b_boat_12_04 {
		tags[] = {"naval","pbr"};
	};	
	class vn_b_boat_13_01 {
		tags[] = {"naval","pbr"};
	};
	class vn_b_boat_13_02 {
		tags[] = {"naval","pbr"};
	};
	class vn_b_boat_13_03 {
		tags[] = {"naval","pbr"};
	};	
	class vn_b_boat_13_04 {
		tags[] = {"naval","pbr"};
	};	
	class vn_b_boat_05_01 {
		tags[] = {"naval","nasty"};
	};	
	class vn_b_boat_05_02 {
		tags[] = {"naval","nasty"};
	};	
	class vn_b_boat_06_01 {
		tags[] = {"naval","nasty"};
	};
	class vn_b_boat_06_02 {
		tags[] = {"naval","nasty"};
	};
	class vn_b_boat_09_01 {
		tags[] = {"naval","stab"};
	};	
	class vn_b_boat_10_01 {
		tags[] = {"naval","stab"};
	};
	class vn_b_boat_11_01 {
		tags[] = {"naval","stab"};
	};
	class B_Boat_Transport_01_F {
		tags[] = {"naval","RHIB"};
	};

	//DAC CONG
	//Armor
	class vn_o_armor_type63_01 {
		tags[] = {"t63","pavn","armor"};
	};
	class vn_o_armor_m41_01 {
		tags[] = {"m41","pavn","armor"};
	};
	class vn_o_armor_pt76a_01 {
		tags[] = {"pt76","pavn","armor"};
	};
	class vn_o_armor_pt76b_01 {
		tags[] = {"pt76","pavn","armor"};
	};
	class vn_o_armor_t54b_01 {
		tags[] = {"t54","pavn","armor"};
	};
	class vn_o_armor_ot54_01 {
		tags[] = {"t54","pavn","armor"};
	};


	//Helicopters
	class vn_o_air_mi2_01_01 {
		tags[] = {"mi2","pavn","helo","transport"};
	};
	class vn_o_air_mi2_01_02 {
		tags[] = {"mi2","pavn","helo","transport"};
	};
	class vn_o_air_mi2_01_03 {
		tags[] = {"mi2","pavn","helo","transport"};
	};
	class vn_o_air_mi2_02_01 {
		tags[] = {"mi2","pavn","helo","medical"};
	};
	class vn_o_air_mi2_02_02 {
		tags[] = {"mi2","pavn","helo","medical"};
	};
	class vn_o_air_mi2_03_01 {
		tags[] = {"mi2","pavn","helo","transport","armed"};
	};
	class vn_o_air_mi2_03_02 {
		tags[] = {"mi2","pavn","helo","transport","armed"};
	};
	class vn_o_air_mi2_03_03 {
		tags[] = {"mi2","pavn","helo","transport","armed"};
	};
	class vn_o_air_mi2_03_04 {
		tags[] = {"mi2","pavn","helo","transport","armed"};
	};
	class vn_o_air_mi2_03_05 {
		tags[] = {"mi2","pavn","helo","transport","armed"};
	};
	class vn_o_air_mi2_03_06 {
		tags[] = {"mi2","pavn","helo","transport","armed"};
	};
	class vn_o_air_mi2_04_01 {
		tags[] = {"mi2","pavn","helo","viper"};
	};
	class vn_o_air_mi2_04_02 {
		tags[] = {"mi2","pavn","helo","viper"};
	};
	class vn_o_air_mi2_04_03 {
		tags[] = {"mi2","pavn","helo","viper"};
	};
	class vn_o_air_mi2_04_04 {
		tags[] = {"mi2","pavn","helo","viper"};
	};
	class vn_o_air_mi2_04_05 {
		tags[] = {"mi2","pavn","helo","viper"};
	};
	class vn_o_air_mi2_04_06 {
		tags[] = {"mi2","pavn","helo","viper"};
	};
	class vn_o_air_mi2_05_01 {
		tags[] = {"mi2","pavn","helo","salamander"};
	};
	class vn_o_air_mi2_05_02 {
		tags[] = {"mi2","pavn","helo","salamander"};
	};
	class vn_o_air_mi2_05_03 {
		tags[] = {"mi2","pavn","helo","salamander"};
	};
	class vn_o_air_mi2_05_04 {
		tags[] = {"mi2","pavn","helo","salamander"};
	};
	class vn_o_air_mi2_05_05 {
		tags[] = {"mi2","pavn","helo","salamander"};
	};
	class vn_o_air_mi2_05_06 {
		tags[] = {"mi2","pavn","helo","salamander"};
	};

	//APC
	class vn_o_armor_btr50pk_01 {
		tags[] = {"btr50","pavn","apc"};
	};
	class vn_o_armor_btr50pk_02 {
		tags[] = {"btr50","pavn","apc"};
	};
	class vn_o_armor_btr50pk_03 {
		tags[] = {"btr50","pavn","apc"};
	};
	class vn_o_armor_m113_01 {
		tags[] = {"m113","pavn","apc"};
	};

	//Cars
	class vn_o_wheeled_btr40_mg_01 {
		tags[] = {"btr40","pavn","car"};
	};
	class vn_o_wheeled_btr40_mg_02 {
		tags[] = {"btr40","pavn","car"};
	};
	class vn_o_wheeled_btr40_mg_03 {
		tags[] = {"btr40","pavn","car"};
	};
	class vn_o_wheeled_btr40_mg_04 {
		tags[] = {"btr40","pavn","car"};
	};
	class vn_o_wheeled_btr40_mg_05 {
		tags[] = {"btr40","pavn","car"};
	};
	class vn_o_wheeled_btr40_mg_06 {
		tags[] = {"btr40","pavn","car"};
	};
	class vn_o_wheeled_btr40_01 {
		tags[] = {"btr40","pavn","car"};
	};
	class vn_o_wheeled_btr40_02 {
		tags[] = {"btr40","pavn","car"};
	};
	class vn_o_wheeled_z157_01 {
		tags[] = {"z157","pavn","car"};
	};
	class vn_o_wheeled_z157_02 {
		tags[] = {"z157","pavn","car"};
	};
	class vn_o_wheeled_z157_03 {
		tags[] = {"z157","pavn","car"};
	};
	class vn_o_wheeled_z157_04 {
		tags[] = {"z157","pavn","car"};
	};
	class vn_o_wheeled_z157_ammo {
		tags[] = {"z157","pavn","car","utility"};
	};
	class vn_o_wheeled_z157_fuel {
		tags[] = {"z157","pavn","car","utility"};
	};
	class vn_o_wheeled_z157_repair {
		tags[] = {"z157","pavn","car","utility"};
	};

	//Planes
	class vn_o_air_mig19_at {
		tags[] = {"mig19","pavn","jet"};
	};
	class vn_o_air_mig19_bmb {
		tags[] = {"mig19","pavn","jet"};
	};
	class vn_o_air_mig19_cas {
		tags[] = {"mig19","pavn","jet"};
	};
	class vn_o_air_mig19_cap {
		tags[] = {"mig19","pavn","jet"};
	};
	class vn_o_air_mig19_gun {
		tags[] = {"mig19","pavn","jet"};
	};
	class vn_o_air_mig19_hbmb {
		tags[] = {"mig19","pavn","jet"};
	};
	class vn_o_air_mig19_mr {
		tags[] = {"mig19","pavn","jet"};
	};
	class vn_o_air_mig21_at {
		tags[] = {"mig21","pavn","jet"};
	};
	class vn_o_air_mig21_atgm {
		tags[] = {"mig21","pavn","jet"};
	};
	class vn_o_air_mig21_bmb {
		tags[] = {"mig21","pavn","jet"};
	};
	class vn_o_air_mig21_cas {
		tags[] = {"mig21","pavn","jet"};
	};
	class vn_o_air_mig21_cap {
		tags[] = {"mig21","pavn","jet"};
	};
	class vn_o_air_mig21_gun {
		tags[] = {"mig21","pavn","jet"};
	};
	class vn_o_air_mig21_hbmb {
		tags[] = {"mig21","pavn","jet"};
	};
	class vn_o_air_mig21_hcas {
		tags[] = {"mig21","pavn","jet"};
	};
	class vn_o_air_mig21_mr {
		tags[] = {"mig21","pavn","jet"};
	};

	//Statics
	class vn_sa2 {
		tags[] = {"pavn","static"};
	};
	class vn_o_nva_static_zgu1_01 {
		tags[] = {"pavn","static"};
	};
	class vn_o_nva_static_zpu4 {
		tags[] = {"pavn","static"};
	};
	class vn_o_nva_static_d44_01 {
		tags[] = {"pavn","static"};
	};
	class vn_o_nva_static_h12 {
		tags[] = {"pavn","static"};
	};
};

class spawn_point_types {
	class light_transport {
		name = "Light transport";
		RESPAWN_SHORT;
		class categories {
			class m151 {
				name = "M151A1";
				icon = VEHICLE_ICON_CAR;
				include[] = { { "m151a1","transport","army" } };
				exclude[] = { { "armed" } };
			};

			class mule {
				name = "M274 Mule";
				icon = VEHICLE_ICON_CAR;
				include[] = { { "m274","transport" } };
				exclude[] = { { "airport" } };
			};
		};
	};

	class transport_airport {
		name = "Light airport transport";
		RESPAWN_SHORT;

		class categories {
			class mule {
				name = "M274 Mule";
				icon = VEHICLE_ICON_CAR;
				include[] = { { "m274","airport" } };
				exclude[] = { { "armed" } };
			};
			class truck {
				name = "Truck";
				icon = VEHICLE_ICON_TRUCK;
				include[] = { { "truck", "airport" } };
				exclude[] = { { "armed" } };
			};
		};
	};

	class patrol {
		name = "Patrol";
		RESPAWN_MEDIUM;
		class categories {
			class m151 {
				name = "M151A1";
				icon = VEHICLE_ICON_CAR;
				include[] = { { "m151a1","armed","army" } };
				exclude[] = { { "transport" } };
			};

			class mule {
				name = "M274 Mule";
				icon = VEHICLE_ICON_CAR;
				include[] = { { "m274", "armed" } };
				exclude[] = { { "transport" } };
			};
		};
	};

	class transport_heavy {
		name = "Heavy transport";
		RESPAWN_LONG;

		class categories {
			class m113 {
				name = "M113";
				icon = VEHICLE_ICON_ARMOUR;
				include[] = { { "m113", "transport" } };
				exclude[] = { { "firesupport" } };
			};

			class trucks {
				name = "Trucks";
				icon = VEHICLE_ICON_TRUCK;
				include[] = { { "truck", "transport" } };
				exclude[] = { { "airport" } };
			};
		};
	};

	class transport_trucks {
		name = "Trucks";
		RESPAWN_LONG;

		class categories {
			class trucks {
				name = "Trucks";
				icon = VEHICLE_ICON_TRUCK;
				include[] = { { "truck", "transport" } };
				exclude[] = { {"airport"} };
			};
		};
	};

	class ambulance {
		name = "Ambulance";
		RESPAWN_LONG;

		class categories {
			class car {
				name = "Cars";
				icon = VEHICLE_ICON_CAR;
				include[] = { { "car", "medical" } };
				exclude[] = { { "pavn" } };
			};
			class truck {
				name = "Trucks";
				icon = VEHICLE_ICON_TRUCK;
				include[] = { { "truck", "medical" } };
				exclude[] = { { "pavn" } };
			};
		};
	};

	class light_fire_support {
		name = "Light fire support";
		WRECK_SHORT;

		class categories {
			class m151 {
				name = "M151A1";
				icon = VEHICLE_ICON_CAR;
				include[] = { { "m151a1", "armed", "antitank" } };
				exclude[] = { { "transport","usmc","mp","army"} };
			};
			class trucks {
				name = "Trucks";
				icon = VEHICLE_ICON_TRUCK;
				include[] = { {"truck", "firesupport" } };
				exclude[] = { { "pavn" } };
			};
			class armor {
				name = "Armor";
				icon = VEHICLE_ICON_ARMOUR;
				include[] = { { "apc", "firesupport" } };
				exclude[] = { { "pavn" } };
			};
		};
	};

	class heavy_fire_support {
		name = "Heavy fire support";
		WRECK_LONG;

		class categories {
			class tanks {
				name = "Tanks";
				icon = VEHICLE_ICON_ARMOUR;
				include[] = { { "tank","army" } };
				exclude[] = { { "arvn","usmc","pavn" } };
			};
		};
	};

	class utility {
		name = "Utility";
		RESPAWN_SHORT;

		class categories {
			class fuel {
				name = "Fuel";
				icon = VEHICLE_ICON_TRUCK;
				include[] = { {"fuel" }};
				exclude[] = { {"airport" }};
			};
			class ammo {
				name = "Ammo";
				icon = VEHICLE_ICON_TRUCK;
				include[] = { {"ammo" }};
				exclude[] = { {"airport" }};
			};
			class repair {
				name = "Repair";
				icon = VEHICLE_ICON_TRUCK;
				include[] = { {"repair" }};
				exclude[] = { {"airport" }};
			};
		};
	};

	class utility_airport {
		name = "Airport Utility";
		RESPAWN_SHORT;

		class categories {
			class fuel {
				name = "Fuel";
				icon = VEHICLE_ICON_TRUCK;
				include[] = { { "fuel", "airport" } };
				exclude[] = { { "pavn" } };
			};
			class ammo {
				name = "Ammo";
				icon = VEHICLE_ICON_TRUCK;
				include[] = { { "ammo", "airport" } };
				exclude[] = { { "pavn" } };
			};
			class repair {
				name = "Repair";
				icon = VEHICLE_ICON_TRUCK;
				include[] = { { "repair", "airport" } };
				exclude[] = { { "pavn" } };
			};
		};
	};

	class mp {
		name = "MP Patrol";
		RESPAWN_MEDIUM;
		class categories {
			class patrol {
				name = "M151A1 Patrol";
				icon = VEHICLE_ICON_CAR;
				include[] = { { "m151a1", "armed","mp" } };
				exclude[] = { { "transport","usmc","antitank","army" } };
			};
			class transport {
				name = "M151A1 Transport";
				icon = VEHICLE_ICON_CAR;
				include[] = { { "m151a1", "transport","mp" } };
				exclude[] = { { "armed","usmc","antitank","army" } };
			};
		};
	};	

	class acr {
		name = "11th ACR Vehicles";
		RESPAWN_SHORT;
		class categories {
			class tanks {
				name = "Tanks";
				icon = VEHICLE_ICON_ARMOUR;
				include[] = { { "tank","army" } };
				exclude[] = { { "arvn","usmc","pavn"} };
			};
			class m113 {
				name = "M113";
				icon = VEHICLE_ICON_ARMOUR;
				include[] = { { "m113","firesupport" } };
				exclude[] = { { "Transport", "pavn" } };
			};
			class trucks {
				name = "Trucks";
				icon = VEHICLE_ICON_TRUCK;
				include[] = { { "truck","firesupport" } };
				exclude[] = { { "pavn" } };
			};
		};
	};

	class anzac {
		name = "ANZAC Vehicles";
		RESPAWN_SHORT;
		class categories {
			class dirtranger_t {
				name = "Dirt Ranger";
				icon = VEHICLE_ICON_CAR;
				include[] = { { "dirtranger", "transport" } };
				exclude[] = { {"armed" } };
			};
			class dirtranger_p {
				name = "Armed Dirt Ranger";
				icon = VEHICLE_ICON_CAR;
				include[] = { { "dirtranger", "armed" } };
				exclude[] = { {"transport" } };
			};
		};
	};

	class usmc_light {
		name = "USMC Wheeled Vehicles";
		RESPAWN_SHORT;
		class categories {
			class m54_t {
				name = "M54";
				icon = VEHICLE_ICON_TRUCK;
				include[] = { { "m54","usmc" } };
				exclude[] = { { "pavn" } };
			};
			class m151a {
				name = "M151A1";
				icon = VEHICLE_ICON_CAR;
				include[] = { { "m151a", "usmc" } };
				exclude[] = { { "pavn" } };
			};
		};
	};

	class usmc_heavy {
		name = "USMC Armor Vehicles";
		RESPAWN_SHORT;
		class categories {
			class m113 {
				name = "APC";
				icon = VEHICLE_ICON_ARMOUR;
				include[] = { { "m113", "transport", "firesupport" } };
				exclude[] = { { "artillery","pavn" } };
			}
			class usmctank {
				name = "Tanks";
				icon = VEHICLE_ICON_TANK;
				include[] = { { "tank","usmc" } };
				exclude[] = { { "pavn","arvn" } };				
			};
		};
	};


	class air_scout {
		name = "Scout air";
		RESPAWN_SHORT;

		class categories {
			class cayuse {
				name = "OH-6A";
				icon = VEHICLE_ICON_HELO;
				include[] = { {"oh6a","transport" } };
				exclude[] = { {"firesupport","scout" } };
			};
		};
	};

	class air_macv {
		name = "The Company Helicopters";
		RESPAWN_SHORT;

		class categories {
			class hummingbird {
				name = "Hummingbird";
				icon = VEHICLE_ICON_HELO;
				include[] = { {"hummingbird"} };
			}
			class cia {
				name = "Air America";
				icon = VEHICLE_ICON_HELO;
				include[] = { {"uh1", "transport", "cia"} };
				exclude[] = { {"firesupport","usmc","medical","cia","arvn","usaf","army","pavn","frogmen","anzac","7th"} };
			}
		};
	};

	class air_7th {
		name = "7th Cavalry Helicopters";
		RESPAWN_SHORT;

		class categories {
			class cayuse {
				name = "OH-6A";
				icon = VEHICLE_ICON_HELO;
				include[] = { {"oh6a","transport","scout"} };
				exclude[] = { {"firesupport","GL","pavn"} };
			};
			class uh1 {
				name = "UH-1";
				icon = VEHICLE_ICON_HELO;
				include[] = { {"uh1","7th"} };
				exclude[] = { {"firesupport","usmc","medical","cia","arvn","usaf","army","pavn","frogmen","anzac"} };
			}
			class ch47 {
				name = "CH-47A";
				icon = VEHICLE_ICON_HELO;
				include[] = { {"ch47","7th"} };
				exclude[] = { {"firesupport","medical","army","pavn"} };
			}
		};
	};

	class air_udt {
		name = "Frogmen Helicopters";
		RESPAWN_SHORT;

		class categories {
			class cayuse {
				name = "OH-6A";
				icon = VEHICLE_ICON_HELO;
				include[] = { {"oh6a","transport"} };
				exclude[] = { {"firesupport","pavn"} };
			};
			class uh1 {
				name = "UH-1";
				icon = VEHICLE_ICON_HELO;
				include[] = { {"uh1","frogmen"} };
				exclude[] = { {"firesupport","usmc","medical","cia","arvn","usaf","army","pavn","7th","anzac"} };
			}
			class ch47 {
				name = "CH-47A";
				icon = VEHICLE_ICON_HELO;
				include[] = { {"ch47","army"} };
				exclude[] = { {"firesupport","medical","army","pavn","7th"} };
			}
		};
	};

	class air_anzac {
		name = "ANZAC Helicopters";
		RESPAWN_SHORT;

		class categories {
			class cayuse {
				name = "OH-6A";
				icon = VEHICLE_ICON_HELO;
				include[] = { {"oh6a","transport"} };
				exclude[] = { {"firesupport","pavn"} };
			};
			class uh1 {
				name = "UH-1";
				icon = VEHICLE_ICON_HELO;
				include[] = { {"uh1","anzac"} };
				exclude[] = { {"firesupport","usmc","medical","cia","arvn","usaf","army","pavn","7th","frogmen"} };
			}
		};
	};

	class air_arvn {
		name = "ARVN Helicopters";
		WRECK_MEDIUM;

		class categories {
			class uh1 {
				name = "UH-1";
				icon = VEHICLE_ICON_HELO;
				include[] = { { "uh1","arvn" } };
				exclude[] = { {"firesupport","usmc","medical","cia","7th","usaf","army","pavn","frogmen","anzac"} };
			};
			class ch34 {
				name = "CH-34";
				icon = VEHICLE_ICON_HELO;
				include[] = { { "ch34","arvn" } };
			};
		};
	};

	class air_usaf {
		name = "USAF air";
		RESPAWN_SHORT;

		class categories {
			class uh1 {
				name = "UH-1";
				icon = VEHICLE_ICON_HELO;
				include[] = { {"uh1","transport","usaf" } };
				exclude[] = { {"firesupport", "7thcav","usmc","arvn","army"} };
			};
		};
	};

	class air_usmc {
		name = "USMC Helicopters";
		RESPAWN_SHORT;
		class categories {
			class ch34_t {
				name = "CH-34";
				icon = VEHICLE_ICON_HELO;
				include[] = { { "ch34","usmc" } };
				exclude[] = { { "pavn" } };
			};
			class uh1 {
				name = "UH-1";
				icon = VEHICLE_ICON_HELO;
				include[] = { { "uh1", "usmc" } };
				exclude[] = { { "pavn" } };
			};
		};
	};

	class air_tf {
		name = "SOG Helicopters";
		RESPAWN_SHORT;
		class categories {
			class cayuse {
				name = "OH-6A";
				icon = VEHICLE_ICON_HELO;
				include[] = { {"oh6a","transport"}};
				exclude[] = { {"firesupport","scout"} };			
			};
			class uh1 {
				name = "UH-1";
				icon = VEHICLE_ICON_HELO;
				include[] = { { "uh1", "tf" } };
				exclude[] = { { "pavn" } };
			};
			class ch47 {
				name = "CH-47";
				icon = VEHICLE_ICON_HELO;
				include[] = { {"ch47","transport","army"} };
				exclude[] = { {"firesupport","7th"} };
			};
		};
	};

	class air_dustoff {
		name = "Dust-off and Medevac";
		RESPAWN_MEDIUM;
		class categories {
			class uh1 {
				name = "UH-1 Medical";
				icon = VEHICLE_ICON_HELO;
				include[] = { { "uh1", "medical", "dustoff" } };
				exclude[] = { { "pavn" } };
			};
			class ch47 {
				name = "Ch-47 Medical";
				icon = VEHICLE_ICON_HELO;
				include[] = { { "ch47", "medical", "dustoff" } };
				exclude[] = { { "pavn" } };
			};
		};
	};

	class air_transport_light {
		name = "Light air";
		RESPAWN_SHORT;

		class categories {
			class cayuse {
				name = "OH-6A";
				icon = VEHICLE_ICON_HELO;
				include[] = { {"oh6a", "transport" } };
				exclude[] = { {"firesupport" } };
			};/*
			class hummingbird {
				name = "Hummingbird";
				icon = VEHICLE_ICON_HELO;
				include[] = {"hummingbird"};
			}*/
		};
	};

	class air_transport_medium {
		name = "Medium Lift";
		RESPAWN_SHORT;

		class categories {
			class uh1 {
				name = "UH-1";
				icon = VEHICLE_ICON_HELO;
				include[] = { {"uh1","transport","army" } };
				exclude[] = { {"firesupport", "7thcav","usmc","arvn"} };
			};
		};
	};

	class air_transport_heavy {
		name = "Heavy Lift";
		RESPAWN_MEDIUM;

		class categories {
			class ch47 {
				name = "CH-47";
				icon = VEHICLE_ICON_HELO;
				include[] = { {"ch47","army" }};
				exclude[] = { {"firesupport", "7th" } };
			};
		};
	};

	class air_transport_all {
		name = "Air Transport";
		RESPAWN_MEDIUM;

		class categories {
			
			class cayuse {
				name = "OH-6A";
				icon = VEHICLE_ICON_HELO;
				include[] = { {"oh6a","transport"}};
				exclude[] = { {"firesupport","scout"} };			
			};
			class uh1 {
				name = "UH-1";
				icon = VEHICLE_ICON_HELO;
				include[] = { {"uh1","transport","army"} };
				exclude[] = { {"firesupport","usmc","medical","cia","arvn","usaf","army","pavn","7th","frogmen","anzac"} };
			};
			class ch47 {
				name = "CH-47";
				icon = VEHICLE_ICON_HELO;
				include[] = { {"ch47","transport","army"} };
				exclude[] = { {"firesupport","7th"} };
			};
		};
	};



	class air_fire_support {
		name = "Close Air Support";
		WRECK_LONG;

		class categories {
			class cayuse {
				name = "OH-6A";
				icon = VEHICLE_ICON_HELO;
				include[] = { { "oh6a", "armed", :"firesupport" } };
				exclude[] = { { "pavn" } };
			};
			class ah1g {
				name = "AH-1G";
				icon = VEHICLE_ICON_HELO;
				include[] = { { "ah1g", "firesupport" } };
				exclude[] = { { "pavn" } };
			};
			class uh1 {
				name = "UH-1";
				icon = VEHICLE_ICON_HELO;
				include[] = { { "uh1", "firesupport" } };
				exclude[] = { { "pavn" } };
			};
			class ch34 {
				name = "CH-34";
				icon = VEHICLE_ICON_HELO;
				include[] = { { "ch34", "firesupport" } };
				exclude[] = { { "pavn" } };
			};
			class ch47 {
				name = "CH-47";
				icon = VEHICLE_ICON_HELO;
				include[] = { { "ch47", "firesupport" } };
				exclude[] = { { "pavn" } };
			};

		};
	};

	class jets {
		name = "Jets";
		WRECK_LONG;

		class categories {
			class f100 {
				name = "F100";
				icon = VEHICLE_ICON_PLANE;
				include[] = { { "jet", "f100" } };
				exclude[] = { { "pavn" } };
			};
			class f4 {
				name = "F4 Phantom II";
				icon = VEHICLE_ICON_PLANE;
				include[] = { { "jet", "f4" } };
				exclude[] = { { "pavn" } };
			};
		};
	};

	class seajets {
		name = "Naval Jets";
		WRECK_LONG;

		class categories {
			class f4 {
				name = "F4B Phantom II";
				icon = VEHICLE_ICON_PLANE;
				include[] = { { "jet", "f4", "naval" } };
				exclude[] = { { "pavn" } };
			};
		};
	};

	class large_statics {
		name = "Large static weapons";
		RESPAWN_SHORT;
		class categories {
			class anti_air {
				name = "Anti-air";
				icon = VEHICLE_ICON_STATIC;
				include[] = { { "static", "antiair", "nodisassemble" } };
				exclude[] = { {"artillery" } };
			};
			class anti_tank {
				name = "Anti-tank";
				icon = VEHICLE_ICON_STATIC;
				include[] = { { "static", "antitank", "nodisassemble" } };
				exclude[] = { {"artillery" } };
			};
		};
	};

	class artillery {
		name = "Artillery";
		WRECK_LONG;
		class categories {
			class m101 {
				name = "M101";
				icon = VEHICLE_ICON_STATIC;
				include[] = { { "static", "artillery" } };
				exclude[] = { {"mortar" } };
			};
		};
	};
	
	class naval {
		name = "Small Boats";
		RESPAWN_SHORT;
		class categories {
			class pbr {
				name = "PBR";
				icon = VEHICLE_ICON_BOAT;
				include[] = { { "naval", "pbr" } };
				exclude[] = { { "pavn" } };
			};
			class boat {
				name = "Stab";
				icon = VEHICLE_ICON_BOAT;
				include[] = { { "naval", "stab" } };
				exclude[] = { { "pavn" } };
			};
			class RHIB {
				name = "RHIB";
				icon = VEHICLE_ICON_BOAT;
				include[] = { { "naval" , "RHIB"} };
				exclude[] = { { "pavn" } };
			};
		};
	};

	class nasty {
		name = "Nasty Boats";
		RESPAWN_LONG;
		class categories {
			class nasty {
				name = "Nasty";
				icon = VEHICLE_ICON_BOAT;
				include[] = { { "naval" , "nasty" } };
				exclude[] = { { "pavn" } };
			};
		};
	};

	

//DAC
	class dac_car {
		name = "Wheeled Vehicle";
		RESPAWN_MEDIUM;
		class categories {
			class btr40 {
				name = "BTR-40";
				icon = VEHICLE_ICON_CAR;
				include[] = { { "btr40" } };
			};
			class z157 {
				name = "Z-157";
				icon = VEHICLE_ICON_TRUCK;
				include[] = { { "z157" } };
			};
		};
	};
	class dac_apc {
		name = "APC";
		RESPAWN_MEDIUM;
		class categories {
			class btr50 {
				name = "BTR-50";
				icon = VEHICLE_ICON_ARMOUR;
				include[] = { { "btr50" } };
			};
			class m113 {
				name = "M113";
				icon = VEHICLE_ICON_ARMOUR;
				include[] = { { "m113","pavn" } };
			};
		};
	};
	class dac_armor {
		name = "Armor";
		RESPAWN_MEDIUM;
		class categories {
			class t54 {
				name = "T-54";
				icon = VEHICLE_ICON_TANK;
				include[] = { { "t54" } };
			};
			class type63 {
				name = "Type 63";
				icon = VEHICLE_ICON_ARMOUR;
				include[] = { { "t63" } };
			};
			class m41 {
				name = "M41";
				icon = VEHICLE_ICON_TANK;
				include[] = { { "m41","pavn" } };
			};
			class pt76 {
				name = "PT-76";
				icon = VEHICLE_ICON_ARMOUR;
				include[] = { { "pt76" } };
			};
		};
	};
	class dac_jet {
		name = "Jets";
		RESPAWN_MEDIUM;
		class categories {
			class mig19 {
				name = "MiG-19";
				icon = VEHICLE_ICON_PLANE;
				include[] = { { "mig19" } };
			};
			class mig21 {
				name = "MiG-21";
				icon = VEHICLE_ICON_PLANE;
				include[] = { { "mig21" } };
			};
		};
	};
	class dac_helo {
		name = "Helicopter";
		RESPAWN_MEDIUM;
		class categories {
			class mi2p {
				name = "Mi-2P";
				icon = VEHICLE_ICON_HELO;
				include[] = { { "mi2","transport" } };
				exclude[] = { { "armed" }};
			};
			class mi2urn {
				name = "Mi-2URN";
				icon = VEHICLE_ICON_HELO;
				include[] = { { "mi2","viper" } };
			};
			class mi2urp {
				name = "Mi-2URP";
				icon = VEHICLE_ICON_HELO;
				include[] = { { "mi2","salamander" } };
			};
			class mi2us {
				name = "Mi-2US";
				icon = VEHICLE_ICON_HELO;
				include[] = { { "mi2","transport","armed" } };
			};
		};
	};
	class dac_static {
		name = "Static Emplacements";
		RESPAWN_MEDIUM;
		class categories {
			class rsna_75 {
				name = "RSNA-75";
				icon = VEHICLE_ICON_STATIC;
				include[] = { { "pavn","static" } };
			};
			class vn_sa2 {
				name = "SA-2";
				icon = VEHICLE_ICON_STATIC;
				include[] = { { "pavn","static" } };
			};
			class zgu1 {
				name = "ZGU-1";
				icon = VEHICLE_ICON_STATIC;
				include[] = { { "pavn","static" } };
			};
			class zpu4 {
				name = "ZPU-4";
				icon = VEHICLE_ICON_STATIC;
				include[] = { { "pavn","static" } };
			};
			class d44 {
				name = "D-44";
				icon = VEHICLE_ICON_STATIC;
				include[] = { { "pavn","static" } };
			};
			class h12 {
				name = "H-12";
				icon = VEHICLE_ICON_STATIC;
				include[] = { { "pavn","static" } };
			};
		};
	};
};