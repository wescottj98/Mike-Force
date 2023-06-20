class respawn_short
{
	respawnType = "RESPAWN";
	time = 10;
};

class respawn_medium
{
	respawnType = "RESPAWN";
	time = 30;
};

class respawn_long
{
	respawnType = "RESPAWN";
	time = 60;
};

class respawn_extra_very_long
{
	respawnType = "RESPAWN";
	time = 1800;
};

class wreck_short
{
	respawnType = "WRECK";
	time = 10;
};

class wreck_medium
{
	respawnType = "WRECK";
	time = 30;
};

class wreck_long
{
	respawnType = "WRECK";
	time = 60;
};

//Jeeps + Small Cars
class vn_b_wheeled_m151_01 : respawn_short {};
class vn_b_wheeled_m151_02 : respawn_short {};
class vn_b_wheeled_m151_mg_01 : respawn_medium {};
class vn_b_wheeled_m151_mg_02 : respawn_medium {};
class vn_b_wheeled_m151_mg_03 : respawn_medium {};
class vn_b_wheeled_m151_mg_04 : respawn_medium {};
class vn_b_wheeled_m151_mg_05 : respawn_medium {};
class vn_b_wheeled_m151_mg_06 : respawn_medium {};
class vn_c_car_01_01 : respawn_short {};
class vn_c_car_02_01 : respawn_short {};
class vn_c_car_03_01 : respawn_short {};
class vn_c_car_04_01 : respawn_short {};

//Transport trucks
class vn_b_wheeled_m54_01 : respawn_medium {};
class vn_b_wheeled_m54_01_airport : respawn_medium {};
class vn_b_wheeled_m54_02 : respawn_medium {};
//M109 Command Truck
class vn_b_wheeled_m54_03 : respawn_medium {};
//Repair Truck
class vn_b_wheeled_m54_repair : wreck_short {};
class vn_b_wheeled_m54_repair_airport : respawn_short {};
//Fuel trucks
class vn_b_wheeled_m54_fuel : wreck_short {};
class vn_b_wheeled_m54_fuel_airport : respawn_short {};
//Ammo truck
class vn_b_wheeled_m54_ammo : wreck_short {};
class vn_b_wheeled_m54_ammo_airport : respawn_short {};
//Gun trucks
class vn_b_wheeled_m54_mg_01 : wreck_short {};
class vn_b_wheeled_m54_mg_02 : wreck_short {};
class vn_b_wheeled_m54_mg_03 : wreck_short {};

//Armoured Cars (Tank)
class vn_b_armor_m41_01_01 : wreck_long {};
class vn_b_armor_m41_01_02 : wreck_long {};

//APC
class vn_b_armor_m113_01 : respawn_medium {};
class vn_b_armor_m113_acav_01 : wreck_short {};
class vn_b_armor_m113_acav_02 : wreck_short {};
class vn_b_armor_m113_acav_03 : wreck_short {};
class vn_b_armor_m113_acav_04 : wreck_short {};
class vn_b_armor_m113_acav_05 : wreck_short {};
class vn_b_armor_m113_acav_06 : wreck_short {};

//Wooden boats
class vn_c_boat_01_01 : respawn_short {};
class vn_c_boat_02_01 : respawn_short {};

//US Boats
class vn_b_boat_05_01 : respawn_long {};
class vn_b_boat_06_01 : respawn_long {};
class vn_b_boat_06_02 : respawn_long {};
class vn_b_boat_09_01 : respawn_medium {};
class vn_b_boat_10_01 : respawn_medium {};
class vn_b_boat_11_01 : respawn_medium {};
class vn_b_boat_12_01 : respawn_medium {};
class vn_b_boat_12_02 : respawn_medium {};
class vn_b_boat_13_01 : respawn_medium {};
class vn_b_boat_13_02 : respawn_medium {};

//Air assets
//Cobra Helicopter
class vn_b_air_ah1g_01 : wreck_long {};
class vn_b_air_ah1g_02 : wreck_long {};
class vn_b_air_ah1g_03 : wreck_long {};
class vn_b_air_ah1g_04 : wreck_long {};
class vn_b_air_ah1g_05 : wreck_long {};
class vn_b_air_ah1g_06 : wreck_long {};
class vn_b_air_ah1g_07 : wreck_long {};
class vn_b_air_ah1g_08 : wreck_long {};
class vn_b_air_ah1g_09 : wreck_long {};
class vn_b_air_ah1g_10 : wreck_long {};

class vn_b_air_ah1g_01_usmc : wreck_long {};
class vn_b_air_ah1g_02_usmc : wreck_long {};
class vn_b_air_ah1g_03_usmc : wreck_long {};
class vn_b_air_ah1g_04_usmc : wreck_long {};
class vn_b_air_ah1g_05_usmc : wreck_long {};
class vn_b_air_ah1g_06_usmc : wreck_long {};
class vn_b_air_ah1g_07_usmc : wreck_long {};
class vn_b_air_ah1g_08_usmc : wreck_long {};
class vn_b_air_ah1g_09_usmc : wreck_long {};
class vn_b_air_ah1g_10_usmc : wreck_long {};

//Choctaw
class vn_b_air_ch34_01_01 : respawn_medium {};
class vn_b_air_ch34_03_01 : respawn_medium {};
//Choctaw gunships
class vn_b_air_ch34_04_01 : wreck_medium {};
class vn_b_air_ch34_04_02 : wreck_medium {};
class vn_b_air_ch34_04_03 : wreck_medium {};
class vn_b_air_ch34_04_04 : wreck_medium {};

//Littlebird
class B_Heli_Light_01_F : respawn_short {};
class B_Heli_Light_01_dynamicLoadout_F : respawn_short {};
class vn_b_air_oh6a_01 : respawn_short {};
class vn_b_air_oh6a_02 : wreck_medium {};
class vn_b_air_oh6a_03 : wreck_medium {};
class vn_b_air_oh6a_04 : wreck_medium {};
class vn_b_air_oh6a_05 : wreck_medium {};
class vn_b_air_oh6a_06 : wreck_medium {};
class vn_b_air_oh6a_07 : wreck_medium {};

//UH1D - Dustoff
class vn_b_air_uh1d_01_01 : respawn_medium {};
class vn_b_air_uh1d_01_02 : respawn_medium {};
class vn_b_air_uh1d_01_03 : respawn_medium {};
class vn_b_air_uh1d_01_04 : respawn_medium {};
class vn_b_air_uh1d_01_05 : respawn_medium {};
class vn_b_air_uh1d_01_06 : respawn_medium {};
class vn_b_air_uh1d_01_07 : respawn_medium {};

//UH1D - Slick
class vn_b_air_uh1d_02_01 : respawn_medium {};
class vn_b_air_uh1d_02_02 : respawn_medium {};
class vn_b_air_uh1d_02_03 : respawn_medium {};
class vn_b_air_uh1d_02_04 : respawn_medium {};
class vn_b_air_uh1d_02_05 : respawn_medium {};
class vn_b_air_uh1d_02_06 : respawn_medium {};
class vn_b_air_uh1d_02_07 : respawn_medium {};

//UH-1D Bushranger
class vn_b_air_uh1d_03_06 : wreck_medium {};

//UH1C - Hog
class vn_b_air_uh1c_01_01 : wreck_medium {};
class vn_b_air_uh1c_01_02 : wreck_medium {};
class vn_b_air_uh1c_01_03 : wreck_medium {};
class vn_b_air_uh1c_01_04 : wreck_medium {};
class vn_b_air_uh1c_01_05 : wreck_medium {};
class vn_b_air_uh1c_01_06 : wreck_medium {};
class vn_b_air_uh1c_01_07 : wreck_medium {};

//UH1C - Gunship
class vn_b_air_uh1c_02_01 : wreck_medium {};
class vn_b_air_uh1c_02_02 : wreck_medium {};
class vn_b_air_uh1c_02_03 : wreck_medium {};
class vn_b_air_uh1c_02_04 : wreck_medium {};
class vn_b_air_uh1c_02_05 : wreck_medium {};
class vn_b_air_uh1c_02_06 : wreck_medium {};
class vn_b_air_uh1c_02_07 : wreck_medium {};

//UH1C - Hornet
class vn_b_air_uh1c_03_01 : wreck_medium {};
class vn_b_air_uh1c_03_02 : wreck_medium {};
class vn_b_air_uh1c_03_03 : wreck_medium {};
class vn_b_air_uh1c_03_04 : wreck_medium {};
class vn_b_air_uh1c_03_05 : wreck_medium {};
class vn_b_air_uh1c_03_06 : wreck_medium {};
class vn_b_air_uh1c_03_07 : wreck_medium {};

//UH1C - Frog
class vn_b_air_uh1c_04_01 : wreck_medium {};
class vn_b_air_uh1c_04_02 : wreck_medium {};
class vn_b_air_uh1c_04_03 : wreck_medium {};
class vn_b_air_uh1c_04_04 : wreck_medium {};
class vn_b_air_uh1c_04_05 : wreck_medium {};
class vn_b_air_uh1c_04_06 : wreck_medium {};
class vn_b_air_uh1c_04_07 : wreck_medium {};

//UH1C - Heavy Hog
class vn_b_air_uh1c_05_01 : wreck_medium {};
class vn_b_air_uh1c_05_02 : wreck_medium {};
class vn_b_air_uh1c_05_03 : wreck_medium {};
class vn_b_air_uh1c_05_04 : wreck_medium {};
class vn_b_air_uh1c_05_05 : wreck_medium {};
class vn_b_air_uh1c_05_06 : wreck_medium {};
class vn_b_air_uh1c_05_07 : wreck_medium {};

//UH1C - ARA
class vn_b_air_uh1c_06_01 : wreck_medium {};
class vn_b_air_uh1c_06_02 : wreck_medium {};

//UH1B - Slick
class vn_b_air_uh1c_07_01 : respawn_medium {};
class vn_b_air_uh1c_07_02 : respawn_medium {};

//UH1E - Heavy Gunship
class vn_b_air_uh1e_02_04 : wreck_medium {};
class vn_b_air_uh1e_01_04 : wreck_medium {};

//UH1E - Slick
class vn_b_air_uh1e_03_04 : respawn_medium {};

//UH1F - Slick
class vn_b_air_uh1f_01_03 : respawn_medium {};

//CH43 - Heavy Transport
class vn_i_air_ch34_01_02 : respawn_medium {};
class vn_i_air_ch34_02_01 : respawn_medium {};
class vn_i_air_ch34_02_02 : respawn_medium {};

// SOG PF 1.3
class vn_b_air_ch47_04_01 : respawn_medium {};
class vn_b_air_ch47_03_01 : respawn_medium {};
class vn_b_air_ch47_04_02 : respawn_medium {};
class vn_b_air_ch47_03_02 : respawn_medium {};
class vn_b_air_ch47_02_01 : respawn_medium {};
class vn_i_air_ch47_02_01 : respawn_medium {};
class vn_b_air_ach47_04_01 : wreck_medium {};

class vn_b_wheeled_m274_02_03 : respawn_medium {};
class vn_b_wheeled_m274_01_01 : respawn_medium {};
class vn_b_wheeled_m274_02_01 : respawn_medium {};
class vn_b_wheeled_m274_mg_01_01 : respawn_medium {};
class vn_b_wheeled_m274_mg_02_01 : respawn_medium {};
class vn_b_wheeled_m274_mg_03_01 : respawn_medium {};

class vn_b_wheeled_lr2a_mg_02_nz_army : respawn_medium {};
class vn_b_wheeled_lr2a_mg_01_nz_army : respawn_medium {};
class vn_b_wheeled_lr2a_mg_03_nz_army : respawn_medium {};

class vn_b_wheeled_lr2a_01_nz_army : respawn_medium {};
class vn_b_wheeled_lr2a_02_nz_army : respawn_medium {};
class vn_b_wheeled_lr2a_03_nz_army : respawn_medium {};

class vn_b_usmc_static_m2_scoped_low : respawn_medium {};
class vn_b_usmc_static_m2_scoped_high : respawn_medium {};

class vn_b_armor_m48_01_01 : wreck_long {};
class vn_b_armor_m67_01_01 : wreck_long {};
class vn_i_armor_m48_01_01 : wreck_long {};
class vn_i_armor_m67_01_01 : wreck_long {};

class vn_b_armor_m125_01 : respawn_medium {};
class vn_i_armor_m125_01 : respawn_medium {};
class vn_b_armor_m132_01 : respawn_medium {};
class vn_b_armor_m577_02 : respawn_medium {};
class vn_b_armor_m577_01 : respawn_medium {};

//// ARVN VEHICLES 
//UH1D - Slick - Independent
class vn_i_air_uh1d_02_01 : respawn_medium {};

//M113
class vn_i_armor_m113_acav_05 : wreck_short {};
class vn_i_armor_m113_acav_06 : wreck_short {};
//Bulldog
class vn_i_armor_m41_01 : wreck_long {};
//105 at gun
class vn_i_static_m101_01 : respawn_medium {};
//m45 quadmount
class vn_i_statis_m54 : respawn_medium {};

// Monty Car
class vn_o_car_04_mg_01 : respawn_short {};

class vn_b_air_f100d_cap : wreck_long {};
class vn_b_air_f100d_cas : wreck_long {};
class vn_b_air_f100d_hcas : wreck_long {};
class vn_b_air_f100d_ehcas : wreck_long {};
class vn_b_air_f100d_at : wreck_long {};
class vn_b_air_f100d_mr : wreck_long {};
class vn_b_air_f100d_cbu : wreck_long {};
class vn_b_air_f100d_bmb : wreck_long {};
class vn_b_air_f100d_lbmb : wreck_long {};
class vn_b_air_f100d_mbmb : wreck_long {};
class vn_b_air_f100d_hbmb : wreck_long {}; 
class vn_b_air_f100d_sead : wreck_long {};

//F4 aircraft
class vn_b_air_f4c_cap : wreck_long {};
class vn_b_air_f4c_cas : wreck_long {};
class vn_b_air_f4c_hcas : wreck_long {};
class vn_b_air_f4c_ehcas : wreck_long {};
class vn_b_air_f4c_ucas : wreck_long {};
class vn_b_air_f4c_at : wreck_long {};
class vn_b_air_f4c_mr : wreck_long {};
class vn_b_air_f4c_lrbmb : wreck_long {};
class vn_b_air_f4c_lbmb : wreck_long {};
class vn_b_air_f4c_bmb : wreck_long {};
class vn_b_air_f4c_mbmb : wreck_long {};
class vn_b_air_f4c_hbmb : wreck_long {};
class vn_b_air_f4c_gbu : wreck_long {};
class vn_b_air_f4c_cbu : wreck_long {};
class vn_b_air_f4c_sead : wreck_long {};
class vn_b_air_f4c_chico : wreck_long {};
class vn_b_air_f4b_usmc_cap : wreck_long {};
class vn_b_air_f4b_usmc_cas : wreck_long {};
class vn_b_air_f4b_usmc_hcas : wreck_long {};
class vn_b_air_f4b_usmc_ehcas : wreck_long {};
class vn_b_air_f4b_usmc_ucas : wreck_long {};
class vn_b_air_f4b_usmc_at : wreck_long {};
class vn_b_air_f4b_usmc_mr : wreck_long {};
class vn_b_air_f4b_usmc_lrbmb : wreck_long {};
class vn_b_air_f4b_usmc_lbmb : wreck_long {};
class vn_b_air_f4b_usmc_bmb : wreck_long {};
class vn_b_air_f4b_usmc_mbmb : wreck_long {};
class vn_b_air_f4b_usmc_hbmb : wreck_long {};
class vn_b_air_f4b_usmc_gbu : wreck_long {};
class vn_b_air_f4b_usmc_cbu : wreck_long {};
class vn_b_air_f4b_usmc_sead : wreck_long {};
class vn_b_air_f4b_navy_cap : wreck_long {};
class vn_b_air_f4b_navy_cas : wreck_long {};
class vn_b_air_f4b_navy_hcas : wreck_long {};
class vn_b_air_f4b_navy_ehcas : wreck_long {};
class vn_b_air_f4b_navy_ucas : wreck_long {};
class vn_b_air_f4b_navy_at : wreck_long {};
class vn_b_air_f4b_navy_mr : wreck_long {};
class vn_b_air_f4b_navy_lrbmb : wreck_long {};
class vn_b_air_f4b_navy_lbmb : wreck_long {};
class vn_b_air_f4b_navy_bmb : wreck_long {};
class vn_b_air_f4b_navy_mbmb : wreck_long {};
class vn_b_air_f4b_navy_hbmb : wreck_long {};
class vn_b_air_f4b_navy_gbu : wreck_long {};
class vn_b_air_f4b_navy_cbu : wreck_long {};
class vn_b_air_f4b_navy_sead : wreck_long {};

//Howitzer
class vn_b_army_static_m101_02 : respawn_short {};
class vn_b_sf_static_m101_02 : respawn_short {};

//Unsung
//Unsung Huey
class uns_UH1D_raaf_m60 : respawn_medium {};
class uns_UH1C_M21_M200 : wreck_medium {};

//Chinook
class uns_ch47_m60_army : respawn_medium {};

//US Boats
class uns_pbr : respawn_long {};
class uns_pbr_m10 : respawn_long {};
class uns_pbr_mk18 : respawn_long {};

//Armoured Cars
class uns_xm706e1 : wreck_short {};
class uns_xm706e2 : wreck_short {};

//Trucks
class uns_m37b1 : respawn_medium {};
class uns_m37b1_m1919 : respawn_medium {};
class uns_M35A2 : respawn_medium {};
class uns_M35A2_Open : respawn_medium {};

//Jeeps + Small Cars
class uns_willys : respawn_short {};
class uns_willys_2 : respawn_short {};
class uns_willysmg50 : respawn_short {};
class uns_willysm40 : respawn_short {};
class uns_willysmg : respawn_short {};
class uns_willys_2_usmp : respawn_short {};
class uns_willys_2_usmc : respawn_short {};
class uns_willys_2_m60 : respawn_short {};
class uns_willys_2_m1919 : respawn_short {};

//Stuff forgotten
class vn_b_air_uh1c_07_07 : respawn_short {};
class vn_b_air_uh1b_01_03 : respawn_short {};
class B_Boat_Transport_01_F: respawn_short {};


//Dac Cong
class vn_o_air_mig19_cap : respawn_short {};
class vn_o_air_mig21_cap : respawn_short {};
class vn_o_air_mi2_01_03 : respawn_short {};
class vn_o_armor_type63_01 : respawn_short {};
class vn_o_wheeled_btr40_mg_03 : respawn_short {};
class vn_o_nva_static_d44 : respawn_short {};
class vn_o_wheeled_btr40_mg_02 : respawn_short {};
class vn_o_wheeled_btr40_mg_01 : respawn_short {};
class vn_o_wheeled_z157_ammo : respawn_short {};
class vn_o_air_mi2_01_02 : respawn_short {};
class vn_o_air_mi2_01_01 : respawn_short {};
class vn_o_nva_65_static_zpu4 : respawn_short {};
class vn_o_nva_65_static_sgm_high_01 : respawn_short {};
class vn_o_nva_static_rpd_high : respawn_short {};
class vn_o_nva_65_static_pk_high : respawn_short {};
class vn_o_pl_static_dshkm_high_02 : respawn_short {};
class vn_o_nva_65_static_dshkm_high_01 : respawn_short {};
class vn_o_pl_static_mg42_high : respawn_short {};
class vn_o_nva_65_static_dshkm_low_01 : respawn_short {};
class vn_o_nva_65_static_dshkm_low_02 : respawn_short {};
class vn_o_pl_static_mg42_low : respawn_short {};
class vn_o_nva_static_pk_low : respawn_short {};
class vn_o_nva_static_sgm_low_02 : respawn_short {};
class vn_o_nva_static_sgm_low_01 : respawn_short {};
class vn_o_wheeled_btr40_mg_03_nva65 : respawn_short {};
class vn_o_wheeled_btr40_01_nva65 : respawn_short {};
class vn_o_wheeled_btr40_02_nva65 : respawn_short {};
class vn_o_nva_static_h12 : respawn_short {};
class vn_o_nva_static_mortar_type63 : respawn_short {};
class vn_o_nva_65_static_d44 : respawn_short {};
class vn_o_wheeled_z157_mg_01_nva65 : respawn_short {};
class vn_o_wheeled_btr40_mg_02_nva65 : respawn_short {};
class vn_o_wheeled_btr40_mg_01_nva65 : respawn_short {};
class vn_o_wheeled_z157_03_nva65 : respawn_short {};
class vn_o_wheeled_z157_mg_02_nva65 : respawn_short {};
class vn_o_wheeled_z157_01_nva65 : respawn_short {};
class vn_o_wheeled_z157_02_nva65 : respawn_short {};
class vn_o_armor_m113_acav_03 : respawn_short {};
class vn_o_armor_m113_acav_01 : respawn_short {};
class vn_o_armor_m113_01 : respawn_short {};
class vn_o_wheeled_z157_ammo_nva65 : respawn_short {};
class vn_o_wheeled_z157_fuel_nva65 : respawn_short {};
class vn_o_wheeled_z157_repair_nva65 : respawn_short {};
class vn_o_armor_m41_01 : respawn_short {};
class vn_o_armor_pt76a_01 : respawn_short {};
class vn_o_armor_pt76b_01 : respawn_short {};
class vn_o_boat_03_02 : respawn_short {};
class vn_o_boat_04_02 : respawn_short {};
class vn_o_nva_navy_static_d44 : respawn_short {};
class vn_o_nva_static_zpu4 : respawn_short {};
class vn_o_wheeled_z157_mg_02_vcmf : respawn_short {};
class vn_o_armor_pt76a_01_pl : respawn_short {};
class vn_o_wheeled_z157_03_vcmf : respawn_short {};
class vn_c_wheeled_m151_01 : respawn_short {};
class vn_c_wheeled_m151_02 : respawn_short {};
class vn_o_armor_m41_02_vcmf : respawn_short {};
class vn_o_nva_navy_static_rpd_high : respawn_short {};
class vn_o_nva_navy_static_dshkm_high_01 : respawn_short {};
class vn_o_pl_static_mortar_type53 : respawn_short {};
class vn_o_nva_navy_static_pk_high : respawn_short {};
class vn_o_nva_navy_static_pk_low : respawn_short {};
class vn_o_nva_navy_static_dshkm_low_01 : respawn_short {};
class vn_o_nva_static_type56rr : respawn_short {};
class vn_o_nva_navy_static_dshkm_low_02 : respawn_short {};
class vn_o_nva_navy_static_at3 : respawn_short {};
class vn_o_air_mi2_03_03 : respawn_short {};
class vn_o_air_mi2_03_05 : respawn_short {};
class vn_o_air_mi2_03_04 : respawn_short {};
class vn_o_air_mi2_04_03 : respawn_short {};
class vn_o_air_mi2_05_05 : respawn_short {};
class vn_o_air_mi2_04_06 : respawn_short {};
class vn_o_air_mi2_04_05 : respawn_short {};
class vn_o_air_mi2_04_04 : respawn_short {};
class vn_o_air_mi2_05_02 : respawn_short {};
class vn_o_air_mi2_05_01 : respawn_short {};
class vn_o_air_mi2_05_06 : respawn_short {};

//SAMS
class vn_o_static_rsna75 : respawn_extra_very_long {};
class vn_o_wheeled_z157_04 : respawn_extra_very_long {};
class vn_sa2 : respawn_extra_very_long {};