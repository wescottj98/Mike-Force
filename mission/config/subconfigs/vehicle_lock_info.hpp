//TEAMCLASS "MACV","DacCong","MikeForce","SpikeTeam","ACAV","GreenHornets","3rdMEU","MilitaryPolice","QuarterHorse","Frogmen","Muskets","SatansAngels","633rdCSG","7thCAV","TigerForce","SASR","ARVN"

class unlocked 
{
	lockTeam[] = {};
};

//PUBLIC AIRCRAFT
class green_hornet
{
	lockTeam[] = {"MACV","DacCong","GreenHornets","3rdMEU","MilitaryPolice","QuarterHorse","Frogmen","Muskets","SatansAngels","633rdCSG","7thCAV","TigerForce","SASR","ARVN"};
};

//PUBLIC ARMOR 
class acav
{
	lockTeam[] = {"MACV","DacCong","ACAV","3rdMEU","MilitaryPolice","QuarterHorse","Frogmen","Muskets","SatansAngels","633rdCSG","7thCAV","TigerForce","SASR","ARVN"};
};

//PUBLIC VEHICLES -ACAV, -MF
class mike_force
{
	lockTeam[] = {"MACV","DacCong","MikeForce","3rdMEU","MilitaryPolice","QuarterHorse","Frogmen","Muskets","SatansAngels","633rdCSG","7thCAV","TigerForce","SASR","ARVN"};
};

// PUBLIC VEHICLES -ACAV, -MF
class spike_team
{
	lockTeam[] = {"MACV","DacCong","SpikeTeam","3rdMEU","MilitaryPolice","QuarterHorse","Frogmen","Muskets","SatansAngels","633rdCSG","7thCAV","TigerForce","SASR","ARVN"};
};

// WL ROTARY CAS
class musket
{
	lockTeam[] = {"MACV","DacCong","Muskets"};
};

// WL ARTY
class QuarterHorse
{
	lockTeam[] = {"MACV","DacCong","QuarterHorse"};
};

// WL FIXED WING CAS
class sa
{
	lockTeam[] = {"MACV","DacCong","SatansAngels"};
};

// WL Independent VEH
class arvn
{
	lockTeam[] = {"MACV","DacCong","ARVN"};
};

// WL USMC ASSETS
class usmc
{
	lockTeam[] = {"MACV","DacCong","3rdMEU"};
};

// WL ARMOR
class armor
{
	lockTeam[] = {"MACV","DacCong","3rdMEU","ACAV","QuarterHorse"};
};

// WL Boat
class frogmen
{
	lockTeam[] = {"MACV","DacCong","Frogmen"};
};

// WL 7th Cav
class aircav
{
	lockTeam[] = {"MACV","DacCong","7thCAV"};
};

// WL SCOUT MG
class scoutmg
{
	lockTeam[] = {"MACV","DacCong","7thCAV", "Muskets"};
};

// WL ANZAC
class anzac
{
	lockTeam[] = {"MACV","DacCong","SASR"};
};

// WL 633rd
class usaf
{
	lockTeam[] = {"MACV","DacCong","633rdCSG"};
};

// WL Tiger Force
class tf
{
	lockTeam[] = {"MACV","DacCong","TigerForce"};
};

// WL OPFOR
class dac_cong
{
	lockTeam[] = {"MACV","DacCong"};
};

//Jeeps + Small Cars
class vn_b_wheeled_m151_01 : unlocked {};
class vn_b_wheeled_m151_02 : unlocked {};
class vn_b_wheeled_m151_mg_01 : unlocked {};
class vn_b_wheeled_m151_mg_02 : unlocked {};
class vn_b_wheeled_m151_mg_03 : unlocked {};
class vn_b_wheeled_m151_mg_04 : unlocked {};
class vn_b_wheeled_m151_mg_05 : unlocked {};
class vn_b_wheeled_m151_mg_06 : unlocked {};
class vn_c_car_01_01 : unlocked {};
class vn_c_car_02_01 : unlocked {};
class vn_c_car_03_01 : unlocked {};
class vn_c_car_04_01 : unlocked {};
class vn_i_wheeled_m151_01 : arvn {};
class vn_i_wheeled_m151_02 : arvn {};
class vn_i_wheeled_m151_mg_01 : arvn {};
class vn_i_wheeled_m151_mg_06 : arvn {};
class vn_i_wheeled_m54_01 : arvn {};
class vn_i_wheeled_m54_02 : arvn {};
class vn_i_wheeled_m54_03 : arvn {};
class vn_i_wheeled_m54_ammo : arvn {};
class vn_i_wheeled_m54_fuel : arvn {};
class vn_i_wheeled_m54_repair : arvn {};

//APC
class vn_b_armor_m113_01 : acav {};
class vn_b_armor_m113_acav_01 : acav {};
class vn_b_armor_m113_acav_02 : acav {};
class vn_b_armor_m113_acav_03 : acav {};
class vn_b_armor_m113_acav_04 : acav {};
class vn_b_armor_m113_acav_05 : acav {};
class vn_b_armor_m113_acav_06 : acav {};
class vn_i_armor_m113_01 : arvn {};
class vn_i_armor_m113_acav_01 : arvn {};
class vn_i_armor_m113_acav_02 : arvn {};
class vn_i_armor_m113_acav_03 : arvn {};
class vn_i_armor_m113_acav_04 : arvn {};
class vn_i_armor_m113_acav_05 : arvn {};
class vn_i_armor_m113_acav_06 : arvn {};

// M113 command and ambulance variants
class vn_b_armor_m577_01 : acav {};
class vn_b_armor_m577_02 : acav {};
class vn_i_armor_m577_01 : arvn {};
class vn_i_armor_m577_02 : arvn {};

// M113 mortar and flamethrower
class vn_b_armor_m125_01 : armor {};
class vn_b_armor_m132_01 : armor {};
class vn_i_armor_m125_01 : arvn {};
class vn_i_armor_m132_01 : arvn {};

//M41 Walker bulldog
class vn_b_armor_m41_01_01 : armor {};
class vn_b_armor_m41_01_02 : usmc {};
class vn_i_armor_m41_01 : arvn {};
//Type 63 tank
class vn_i_armor_type63_01 : arvn {};

// M48 Patton
class vn_b_armor_m48_01_01 : armor {};
class vn_b_armor_m48_01_02 : usmc {};
class vn_i_armor_m48_01_01 : arvn {};
// M67 flame tank
class vn_b_armor_m67_01_01 : armor {};
class vn_b_armor_m67_01_02 : usmc {};
class vn_i_armor_m67_01_01 : arvn {};
//Transport trucks
class vn_b_wheeled_m54_01 : unlocked {};
class vn_b_wheeled_m54_01_airport : unlocked {};
class vn_b_wheeled_m54_02 : unlocked {};
//M109 Command Truck
class vn_b_wheeled_m54_03 : unlocked {};
//Repair Truck
class vn_b_wheeled_m54_repair : unlocked {};
class vn_b_wheeled_m54_repair_airport : unlocked {};
//Fuel trucks
class vn_b_wheeled_m54_fuel : unlocked {};
class vn_b_wheeled_m54_fuel_airport : unlocked {};
//Ammo truck
class vn_b_wheeled_m54_ammo : unlocked {};
class vn_b_wheeled_m54_ammo_airport : unlocked {};
//Gun trucks
class vn_b_wheeled_m54_mg_01 : acav {};
class vn_b_wheeled_m54_mg_02 : acav {};
class vn_b_wheeled_m54_mg_03 : acav {};

//Wooden boats
class vn_c_boat_01_01 : unlocked {};
class vn_c_boat_02_01 : unlocked {};

//US Boats
class vn_b_boat_05_01 : frogmen {};
class vn_b_boat_06_01 : frogmen {};
class vn_b_boat_09_01 : unlocked {};
class vn_b_boat_10_01 : unlocked {};
class vn_b_boat_11_01 : unlocked {};
class vn_b_boat_12_01 : unlocked {};
class vn_b_boat_13_01 : unlocked {};
class B_Boat_Transport_01_F : unlocked {};

//Air assets
//CAS
//Cobra Helicopter
class vn_b_air_ah1g_01 : musket {};
class vn_b_air_ah1g_02 : musket {};
class vn_b_air_ah1g_03 : musket {};
class vn_b_air_ah1g_04 : musket {};
class vn_b_air_ah1g_05 : musket {};
class vn_b_air_ah1g_06 : musket {};
class vn_b_air_ah1g_07 : musket {};
class vn_b_air_ah1g_08 : musket {};
class vn_b_air_ah1g_09 : musket {};
class vn_b_air_ah1g_10 : musket {};
class vn_b_air_ah1g_01_usmc : musket {};
class vn_b_air_ah1g_02_usmc : musket {};
class vn_b_air_ah1g_03_usmc : musket {};
class vn_b_air_ah1g_04_usmc : musket {};
class vn_b_air_ah1g_05_usmc : musket {};
class vn_b_air_ah1g_06_usmc : musket {};
class vn_b_air_ah1g_07_usmc : musket {};
class vn_b_air_ah1g_08_usmc : musket {};
class vn_b_air_ah1g_09_usmc : musket {};
class vn_b_air_ah1g_10_usmc : musket {};
// CH-47 Guns-a-go-go
class vn_b_air_ach47_01_01 : musket {};
//Choctaw gunships
class vn_b_air_ch34_04_01 : musket {};
class vn_b_air_ch34_04_02 : musket {};
class vn_b_air_ch34_04_03 : musket {};
class vn_b_air_ch34_04_04 : musket {};
//UH1C - Hog
class vn_b_air_uh1c_01_01 : musket {};
class vn_b_air_uh1c_01_02 : musket {};
class vn_b_air_uh1c_01_03 : musket {};
class vn_b_air_uh1c_01_04 : musket {};
class vn_b_air_uh1c_01_05 : musket {};
class vn_b_air_uh1c_01_06 : musket {};
class vn_b_air_uh1c_01_07 : musket {};
//UH1C - Gunship
class vn_b_air_uh1c_02_01 : musket {};
class vn_b_air_uh1c_02_02 : musket {};
class vn_b_air_uh1c_02_03 : musket {};
class vn_b_air_uh1c_02_04 : musket {};
class vn_b_air_uh1c_02_05 : musket {};
class vn_b_air_uh1c_02_06 : musket {};
class vn_b_air_uh1c_02_07 : musket {};
//UH1C - Hornet
class vn_b_air_uh1c_03_01 : musket {};
class vn_b_air_uh1c_03_02 : musket {};
class vn_b_air_uh1c_03_03 : musket {};
class vn_b_air_uh1c_03_04 : musket {};
class vn_b_air_uh1c_03_05 : musket {};
class vn_b_air_uh1c_03_06 : musket {};
class vn_b_air_uh1c_03_07 : musket {};
//UH1C - Frog
class vn_b_air_uh1c_04_01 : musket {};
class vn_b_air_uh1c_04_02 : musket {};
class vn_b_air_uh1c_04_03 : musket {};
class vn_b_air_uh1c_04_04 : musket {};
class vn_b_air_uh1c_04_05 : musket {};
class vn_b_air_uh1c_04_06 : musket {};
class vn_b_air_uh1c_04_07 : musket {};
//UH1C - Heavy Hog
class vn_b_air_uh1c_05_01 : musket {};
class vn_b_air_uh1c_05_02 : musket {};
class vn_b_air_uh1c_05_03 : musket {};
class vn_b_air_uh1c_05_04 : musket {};
class vn_b_air_uh1c_05_05 : musket {};
class vn_b_air_uh1c_05_06 : musket {};
class vn_b_air_uh1c_05_07 : musket {};
//UH1C - ARA
class vn_b_air_uh1c_06_01 : musket {};
class vn_b_air_uh1c_06_02 : musket {};
//UH-1D Bushranger
class vn_b_air_uh1d_03_06 : musket {};
//UH-1E - Gunship
class vn_b_air_uh1e_01_04 : musket {};
//UH1E - Heavy Gunship
class vn_b_air_uh1e_02_04 : musket {};

//Transport
// CH-47 transport variants
class vn_b_air_ch47_01_01 : green_hornet {};
class vn_b_air_ch47_02_01 : green_hornet {};
class vn_b_air_ch47_03_01 : green_hornet {};
class vn_b_air_ch47_04_01 : green_hornet {};
class vn_b_air_ch47_03_02 : aircav {};
class vn_b_air_ch47_01_02 : aircav {};
//Choctaw
class vn_b_air_ch34_01_01 : green_hornet {};
class vn_b_air_ch34_03_01 : usmc {};
//CH34 - Heavy Transport
class vn_i_air_ch34_01_02 : arvn {};
class vn_i_air_ch34_02_01 : arvn {};
//Littlebird
class B_Heli_Light_01_F : dac_cong {};
class vn_b_air_oh6a_01 : green_hornet {};
class vn_b_air_oh6a_02 : scoutmg {};
class vn_b_air_oh6a_03 : musket {};
class vn_b_air_oh6a_04 : musket {};
class vn_b_air_oh6a_05 : musket {};
class vn_b_air_oh6a_06 : musket {};
class vn_b_air_oh6a_07 : musket {};
//UH1B - Dustoff
class vn_b_air_uh1b_01_01 : green_hornet {};
//UH1B - Slick
class vn_i_air_uh1c_07_01 : arvn {};
class vn_b_air_uh1c_07_01 : green_hornet {};
class vn_b_air_uh1c_07_02 : aircav {};
class vn_b_air_uh1c_07_05 : frogmen {};
class vn_b_air_uh1c_07_06 : anzac {};
//UH1D - Dustoff
class vn_b_air_uh1d_01_01 : green_hornet {};
class vn_b_air_uh1d_01_02 : green_hornet {};
class vn_b_air_uh1d_01_03 : usaf {};
class vn_b_air_uh1d_01_04 : green_hornet {};
class vn_b_air_uh1d_01_05 : green_hornet {};
class vn_b_air_uh1d_01_06 : green_hornet {};
class vn_b_air_uh1d_01_07 : green_hornet {};
//UH1D - Slick
class vn_i_air_uh1d_02_01 : arvn {};
class vn_b_air_uh1d_02_01 : green_hornet {};
class vn_b_air_uh1d_02_02 : aircav {};
class vn_b_air_uh1d_02_03 : usaf {};
class vn_b_air_uh1d_02_04 : usmc {};
class vn_b_air_uh1d_02_05 : frogmen {};
class vn_b_air_uh1d_02_06 : anzac {};
class vn_b_air_uh1d_02_07 : tf {};
//UH-1E - Slick
class vn_b_air_uh1e_03_04 : usmc {};
class vn_b_air_uh1c_07_04 : usmc {};
//UH1F - Slick
class vn_b_air_uh1f_01_03 : usaf {};
class vn_b_air_uh1c_07_03 : usaf {};
//UH1 - CIA
class vn_b_air_uh1b_01_09  : dac_cong {};
class vn_b_air_uh1d_04_09 : dac_cong {};

//F4 aircraft
class vn_b_air_f4c_cap : sa {};
class vn_b_air_f4c_cas : sa {};
class vn_b_air_f4c_hcas : sa {};
class vn_b_air_f4c_ehcas : sa {};
class vn_b_air_f4c_ucas : sa {};
class vn_b_air_f4c_at : sa {};
class vn_b_air_f4c_mr : sa {};
class vn_b_air_f4c_lrbmb : sa {};
class vn_b_air_f4c_lbmb : sa {};
class vn_b_air_f4c_bmb : sa {};
class vn_b_air_f4c_mbmb : sa {};
class vn_b_air_f4c_hbmb : sa {};
class vn_b_air_f4c_gbu : sa {};
class vn_b_air_f4c_cbu : sa {};
class vn_b_air_f4c_sead : sa {};
class vn_b_air_f4c_chico : sa {};
class vn_b_air_f4b_usmc_cap : sa {};
class vn_b_air_f4b_usmc_cas : sa {};
class vn_b_air_f4b_usmc_hcas : sa {};
class vn_b_air_f4b_usmc_ehcas : sa {};
class vn_b_air_f4b_usmc_ucas : sa {};
class vn_b_air_f4b_usmc_at : sa {};
class vn_b_air_f4b_usmc_mr : sa {};
class vn_b_air_f4b_usmc_lrbmb : sa {};
class vn_b_air_f4b_usmc_lbmb : sa {};
class vn_b_air_f4b_usmc_bmb : sa {};
class vn_b_air_f4b_usmc_mbmb : sa {};
class vn_b_air_f4b_usmc_hbmb : sa {};
class vn_b_air_f4b_usmc_gbu : sa {};
class vn_b_air_f4b_usmc_cbu : sa {};
class vn_b_air_f4b_usmc_sead : sa {};
class vn_b_air_f4b_navy_cap : sa {};
class vn_b_air_f4b_navy_cas : sa {};
class vn_b_air_f4b_navy_hcas : sa {};
class vn_b_air_f4b_navy_ehcas : sa {};
class vn_b_air_f4b_navy_ucas : sa {};
class vn_b_air_f4b_navy_at : sa {};
class vn_b_air_f4b_navy_mr : sa {};
class vn_b_air_f4b_navy_lrbmb : sa {};
class vn_b_air_f4b_navy_lbmb : sa {};
class vn_b_air_f4b_navy_bmb : sa {};
class vn_b_air_f4b_navy_mbmb : sa {};
class vn_b_air_f4b_navy_hbmb : sa {};
class vn_b_air_f4b_navy_gbu : sa {};
class vn_b_air_f4b_navy_cbu : sa {};
class vn_b_air_f4b_navy_sead : sa {};

// F100D
class vn_b_air_f100d_at : sa {};

//Howitzer
class vn_b_army_static_m101_02 : QuarterHorse {};
class vn_b_sf_static_m101_02 : QuarterHorse {};

//Unsung
//Jeeps + Small Cars
class uns_willys : unlocked {};
class uns_willys_2 : unlocked {};
class uns_willysmg50 : unlocked {};
class uns_willysm40 : unlocked {};
class uns_willysmg : unlocked {};
class uns_willys_2_usmp : unlocked {};
class uns_willys_2_usmc : unlocked {};
class uns_willys_2_m60 : unlocked {};
class uns_willys_2_m1919 : unlocked {};

//Trucks
class uns_m37b1 : acav {};
class uns_m37b1_m1919 : acav {};
class uns_M35A2 : acav {};
class uns_M35A2_Open : acav {};

//Armoured Cars
class uns_xm706e1 : acav {};
class uns_xm706e2 : acav {};

//US Boats
class uns_pbr : unlocked {};
class uns_pbr_m10 : unlocked {};
class uns_pbr_mk18 : unlocked {};

//Huey
class uns_UH1D_raaf_m60 : green_hornet {};
class uns_UH1C_M21_M200 : green_hornet {};

//Chinook
class uns_ch47_m60_army : green_hornet {};

//Dac Cong Vehicles
//Armor
class vn_o_armor_type63_01 : dac_cong {};
class vn_o_armor_m41_01 : dac_cong {};
class vn_o_armor_pt76a_01 : dac_cong {};
class vn_o_armor_pt76b_01 : dac_cong {};
class vn_o_armor_t54b_01 : dac_cong {};
class vn_o_armor_ot54b_01 : dac_cong {};

//Helicopters
class vn_o_air_mi2_01_01 : dac_cong {};
class vn_o_air_mi2_01_02 : dac_cong {};
class vn_o_air_mi2_01_03 : dac_cong {};
class vn_o_air_mi2_02_01 : dac_cong {};
class vn_o_air_mi2_02_02 : dac_cong {};
class vn_o_air_mi2_03_01 : dac_cong {};
class vn_o_air_mi2_03_02 : dac_cong {};
class vn_o_air_mi2_03_03 : dac_cong {};
class vn_o_air_mi2_03_04 : dac_cong {};
class vn_o_air_mi2_03_05 : dac_cong {};
class vn_o_air_mi2_03_06 : dac_cong {};
class vn_o_air_mi2_04_01 : dac_cong {};
class vn_o_air_mi2_04_02 : dac_cong {};
class vn_o_air_mi2_04_03 : dac_cong {};
class vn_o_air_mi2_04_04 : dac_cong {};
class vn_o_air_mi2_04_05 : dac_cong {};
class vn_o_air_mi2_04_06 : dac_cong {};
class vn_o_air_mi2_05_01 : dac_cong {};
class vn_o_air_mi2_05_02 : dac_cong {};
class vn_o_air_mi2_05_03 : dac_cong {};
class vn_o_air_mi2_05_04 : dac_cong {};
class vn_o_air_mi2_05_05 : dac_cong {};
class vn_o_air_mi2_05_06 : dac_cong {};

//APC
class vn_o_armor_btr50pk_01 : dac_cong {};
class vn_o_armor_btr50pk_02 : dac_cong {};
class vn_o_armor_btr50pk_03 : dac_cong {};
class vn_o_armor_m113_01 : dac_cong {};

//Cars
class vn_o_wheeled_btr40_mg_01 : dac_cong {};
class vn_o_wheeled_btr40_mg_02 : dac_cong {};
class vn_o_wheeled_btr40_mg_03 : dac_cong {};
class vn_o_wheeled_btr40_mg_04 : dac_cong {};
class vn_o_wheeled_btr40_mg_05 : dac_cong {};
class vn_o_wheeled_btr40_mg_06 : dac_cong {};
class vn_o_wheeled_btr40_01 : dac_cong {};
class vn_o_wheeled_btr40_02 : dac_cong {};
class vn_o_wheeled_z157_01 : dac_cong {};
class vn_o_wheeled_z157_02 : dac_cong {};
class vn_o_wheeled_z157_03 : dac_cong {};
class vn_o_wheeled_z157_04 : dac_cong {};
class vn_o_wheeled_z157_ammo : dac_cong {};
class vn_o_wheeled_z157_fuel : dac_cong {};
class vn_o_wheeled_z157_repair : dac_cong {};

//Planes
class vn_o_air_mig19_at : dac_cong {};
class vn_o_air_mig19_bmb : dac_cong {};
class vn_o_air_mig19_cas : dac_cong {};
class vn_o_air_mig19_cap : dac_cong {};
class vn_o_air_mig19_gun : dac_cong {};
class vn_o_air_mig19_hbmb : dac_cong {};
class vn_o_air_mig19_mr : dac_cong {};
class vn_o_air_mig21_at : dac_cong {};
class vn_o_air_mig21_atgm : dac_cong {};
class vn_o_air_mig21_bmb : dac_cong {};
class vn_o_air_mig21_cas : dac_cong {};
class vn_o_air_mig21_cap : dac_cong {};
class vn_o_air_mig21_gun : dac_cong {};
class vn_o_air_mig21_hbmb : dac_cong {};
class vn_o_air_mig21_hcas : dac_cong {};
class vn_o_air_mig21_mr : dac_cong {};

//Statics
class vn_sa2 : dac_cong {};
class vn_o_nva_static_zgu1_01 : dac_cong {};
class vn_o_nva_static_zpu4 : dac_cong {};
class vn_o_nva_static_d44_01 : dac_cong {};
class vn_o_nva_static_h12 : dac_cong {};