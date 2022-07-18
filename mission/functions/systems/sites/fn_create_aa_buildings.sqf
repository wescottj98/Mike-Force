/*
	File: fn_create_aa_buildings.sqf
	Author: Cerebral
	Public: No
	
	Description:
		Creates a aa encampment at the given position.
	
	Parameter(s):
		_position - Position of the aa [Position3D]
	
	Returns:
		Array containing the aa buildings [Array]
	
	Example(s): none
*/

params ["_position"];

vn_mf_aa_compositions = [
	[
		["vn_o_nva_65_static_d44_01",[-3.02441,0.137695,-0.0754976],269.16,1,0,[-0.00951079,-0.000260241],"","",false,false], 
		["Land_VehicleTrack_01_straight_v1_F",[3.89453,0.487305,0.000148773],100.195,1,0,[0,-0],"","",false,false], 
		["Land_VehicleTrack_01_left_v1_F",[3.83691,-1.67236,0.0699997],85.231,1,0,[0,0],"","",false,false], 
		["Land_VehicleTrack_01_left_v1_F",[3.85254,1.25049,0.0299997],85.231,1,0,[0,0],"","",false,false], 
		["Land_VehicleTrack_01_straight_v1_F",[3.89453,-2.5127,0.000148773],100.195,1,0,[0,-0],"","",false,false], 
		["Land_VehicleTrack_01_straight_start_F",[5.05908,-1.17676,0],231.522,1,0,[0,0],"","",false,false], 
		["Land_vn_wheelcart_f",[6.84326,3.62451,0],31.799,1,0,[0,0],"","",false,false], 
		["Land_Shovel_F",[6.84326,4.62451,0],247.241,1,0,[0,0],"","",false,false], 
		["vn_prop_sandbag_02",[7.84326,3.62695,0],0,1,0,[0,0],"","",false,false], 
		["Land_VehicleTrack_01_straight_start_F",[7.00781,2.96045,0],231.522,1,0,[0,0],"","",false,false], 
		["vn_prop_sandbag_01",[7.86523,4.63281,0],254.503,1,0,[0,0],"","",false,false], 
		["Land_vn_b_colored_yellow_f",[6.22998,6.9126,-0.547908],0,1,0,[0,0],"","",false,false], 
		["vn_prop_sandbag_01",[8.86523,3.63281,0],88.236,1,0,[0,0],"","",false,false], 
		["Land_vn_fort_bagfence_long",[4.53418,8.55908,0],44.5069,1,0,[0,0],"","",false,false], 
		["Land_vn_fort_bagfence_long",[-1.47803,9.76758,0],1.399,1,0,[0,0],"","",false,false], 
		["vn_prop_sandbag_01",[8.86523,4.63281,0],196.154,1,0,[0,0],"","",false,false], 
		["Land_VehicleTrack_01_straight_v1_F",[8.00098,-6.19824,0],234.898,1,0,[0,0],"","",false,false], 
		["Land_vn_metalbarrel_f",[2.28809,-9.85938,0],0,1,0,[0,0],"","",false,false], 
		["vn_o_prop_t102e_01",[1.99951,-9.93994,0.817173],144.67,1,0,[2.22147e-005,-1.19675e-005],"","",false,false], 
		["Land_vn_metalbarrel_f",[1.78223,-10.1616,0],0,1,0,[0,0],"","",false,false], 
		["Land_VehicleTrack_01_straight_start_F",[9.06738,-5.59131,0],219.127,1,0,[0,0],"","",false,false], 
		["Land_vn_b_colored_yellow_f",[0.785156,-10.791,0],0,1,0,[0,0],"","",false,false], 
		["CraterLong_small",[8.89844,8.75977,0.299849],42.221,1,0,[0,0],"","",false,false], 
		["vn_o_wheeled_z157_ammo_vcmf",[5.58398,-9.56934,-0.0267925],54.3477,1,0,[-0.279733,0.00293147],"","",false,false], 
		["Land_SandbagBarricade_01_half_F",[-9.12695,-7.38574,0],228.263,1,0,[0,0],"","",false,false], 
		["Land_VehicleTrack_01_straight_v1_F",[9.00098,-8.19824,0],49.641,1,0,[0,0],"","",false,false], 
		["Land_SandbagBarricade_01_half_F",[-10.7012,5.96826,0],298.635,1,0,[0,0],"","",false,false], 
		["Land_vn_b_colored_yellow_f",[-9.5957,-7.93652,0],0,1,0,[0,0],"","",false,false], 
		["Land_VehicleTrack_01_straight_start_F",[10.3687,-7.05811,0],216.328,1,0,[0,0],"","",false,false], 
		["Land_vn_fort_bagfence_long",[1.59961,-12.5757,0],231.281,1,0,[0,0],"","",false,false], 
		["Land_vn_b_colored_yellow_f",[3.89746,-13.5913,0],0,1,0,[0,0],"","",false,false], 
		["Land_vn_fort_bagfence_long",[8.5752,-11.5933,0],323.099,1,0,[0,0],"","",false,false], 
		["Land_vn_fort_bagfence_long",[5.5752,-13.5928,0],324.101,1,0,[0,0],"","",false,false]
	],
	[
		["Land_vn_bagfence_long_f",[-0.820313,-0.89209,-0.000999928],225.617,1,0,[0,0],"","",false,false], 
		["Land_vn_woodentable_small_f",[-0.743652,1.86768,0],234.486,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[1.29883,0.582031,-0.0780067],4.97408,1,0,[-6.5664e-007,-3.33648e-006],"","",false,false], 
		["vn_o_nva_static_dshkm_low_01",[-1.90625,-0.715332,-0.0791335],272.872,1,0,[0.000179079,0.684533],"","",false,false], 
		["vn_o_prop_t102e_01",[-0.906738,2.0249,0.859518],325.123,1,0,[0,0],"","",false,false], 
		["Land_vn_b_sugarcane_mature_row_f",[-1.87451,-2.07324,0.143424],66.6908,1,0,[0,0],"","",false,false], 
		["Land_vn_bagfence_round_f",[1.39551,-2.60498,-0.00130129],359.715,1,0,[0,0],"","",false,false], 
		["Land_vn_bagfence_long_f",[-0.484375,2.94385,-0.000999928],148.829,1,0,[0,-0],"","",false,false], 
		["Land_vn_bagfence_long_f",[3.46826,-0.745605,-0.000999928],303.192,1,0,[0,0],"","",false,false], 
		["vn_o_nva_spiderhole_03",[-3.03516,-2.45557,-0.0762668],153.291,1,0,[-0.000218244,0.00102207],"","",false,false], 
		["Land_vn_bagfence_long_f",[3.55811,1.82959,-0.000999928],61.6903,1,0,[0,0],"","",false,false], 
		["Land_vn_bagfence_round_f",[1.70654,3.86523,-0.00130129],186.496,1,0,[0,0],"","",false,false], 
		["Land_vn_b_sugarcane_mature_row_f",[3.81104,-1.38525,-1.90735e-006],114.686,1,0,[0,-0],"","",false,false], 
		["Land_vn_b_sugarcane_mature_row_f",[-0.918945,4.74561,-1.90735e-006],122.004,1,0,[0,-0],"","",false,false], 
		["vn_o_nva_spiderhole_02",[-2.05908,5.07861,-0.0765438],312.653,1,0,[0.00683091,0.003763],"","",false,false], 
		["Land_vn_b_sugarcane_mature_row_f",[3.76904,3.67773,0.353921],63.2977,1,0,[0,0],"","",false,false], 
		["vn_o_nva_spiderhole_01",[2.82617,-5.38281,-0.0755754],184.521,1,0,[-1.70358e-005,-0.000364285],"","",false,false], 
		["vn_o_nva_static_pk_low",[5.8667,1.14063,-0.0752697],78.6469,1,0,[-0.117002,-9.38819e-007],"","",false,false], 
		["vn_o_nva_spiderhole_03",[5.25928,6.1333,-0.0752625],317.669,1,0,[4.14605e-005,-0.00193496],"","",false,false]
	],
	[
		["Land_vn_b_trench_45_02",[-0.71582,-1.28223,0],89.1924,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_zpu4",[1.0459,-0.0166016,0],161.281,1,0,[-4.10137e-007,-7.49133e-006],"","",false,false], 
		["Land_vn_woodentable_small_f",[3.55225,0.275879,0],177.923,1,0,[0,-0],"","",false,false], 
		["Land_vn_b_trench_45_02",[3.34326,0.886719,0],268.501,1,0,[0,0],"","",false,false], 
		["vn_o_prop_t102e_01",[3.85693,0.484375,0.859518],88.6896,1,0,[0,0],"","",false,false], 
		["Land_vn_b_betula_nana",[-5.30469,-1.65625,0.688705],0,1,0,[34.9592,-54.6701],"","",false,false], 
		["Land_vn_b_leucaena_f",[-4.30566,5.33594,0],287.727,1,0,[0,0],"","",false,false], 
		["Land_vn_b_cestrum_f",[6.25,3.05273,0],0,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_dshkm_low_01",[5.2417,4.65479,0],360,1,0,[-2.40894e-006,4.96553e-005],"","",false,false], 
		["Land_vn_bamboo_bush_01",[-6.49512,0.195801,0],186.049,1,0,[0,0],"","",false,false], 
		["Land_vn_bamboo_bush_01",[-5.47998,-3.59131,0],348.435,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_dshkm_low_01",[-0.337402,-7.79102,-0.07897],197.501,1,0,[4.19707e-005,-5.95819e-005],"","",false,false], 
		["Land_vn_bamboo_bush_01",[-6.36523,4.11328,0],173.631,1,0,[0,-0],"","",false,false], 
		["Land_vn_bamboo_bush_01",[-3.16504,-7.23047,0],333.771,1,0,[0,0],"","",false,false], 
		["Land_vn_bamboo_bush_01",[3.95459,6.87598,0],117.353,1,0,[0,-0],"","",false,false], 
		["Land_vn_bamboo_bush_01",[6.41064,4.9834,0],136.222,1,0,[0,-0],"","",false,false], 
		["Land_vn_bamboo_bush_01",[8.28174,1.44922,0],163.342,1,0,[0,-0],"","",false,false], 
		["Land_vn_b_leucaena_f",[1.32568,-8.81006,0],108.394,1,0,[0,-0],"","",false,false], 
		["Land_vn_bamboo_bush_01",[1.5249,9.06689,0],307.698,1,0,[0,0],"","",false,false], 
		["Land_vn_bamboo_bush_01",[-1.42139,9.14746,0],267.128,1,0,[0,0],"","",false,false], 
		["Land_vn_bamboo_bush_01",[9.24023,-2.5957,0],352.182,1,0,[0,0],"","",false,false], 
		["Land_vn_bamboo_bush_01",[-6.59521,7.49951,0],195.014,1,0,[0,0],"","",false,false], 
		["Land_vn_bamboo_bush_01",[-1.02588,-10.0781,0],137.132,1,0,[0,-0],"","",false,false], 
		["Land_vn_d_fallentrunk_branches_f",[-9.49902,-4.50049,0],173.962,1,0,[0,-0],"","",false,false], 
		["Land_vn_misc_fallentrunk_pmc",[8.31641,7.9541,0],132.364,1,0,[0,-0],"","",false,false], 
		["Land_vn_bamboo_bush_01",[8.38232,-7.23145,0],208.194,1,0,[0,0],"","",false,false], 
		["Land_vn_bamboo_bush_01",[1.17676,-11.4937,0],297.803,1,0,[0,0],"","",false,false], 
		["Land_vn_bamboo_bush_01",[6.79346,-10.2798,0],197.245,1,0,[0,0],"","",false,false]
	],
	[
		["vn_o_nva_static_zpu4",[2.37451,-1.02051,0],66.313,1,0,[1.04686e-006,-1.13551e-005],"","",false,false], 
		["vn_jar_02",[0.438477,3.08936,0],343.833,1,0,[0,0],"","",false,false], 
		["Land_vn_b_betula_nana",[-3.65039,0.740723,0],89.8531,1,0,[-45.815,44.1162],"","",false,false], 
		["vn_jar_03",[-4.15869,0.0292969,0],0,1,0,[0,0],"","",false,false], 
		["vn_o_nva_spiderhole_03",[-4.06641,1.4541,0.495387],231.185,1,0,[17.3747,21.6553],"","",false,false], 
		["vn_o_nva_static_dshkm_low_01",[0.393066,4.47949,0],327.537,1,0,[2.27288e-006,-7.7955e-006],"","",false,false], 
		["vn_jar_01",[2.68604,3.84424,0],343.833,1,0,[0,0],"","",false,false], 
		["Land_vn_b_calochlaena_f",[0.591309,4.76025,0],25.1148,1,0,[0,0],"","",false,false], 
		["vn_o_nva_spiderhole_01",[4.59277,2.28711,0],64.0521,1,0,[0.000311461,0.00021562],"","",false,false], 
		["Land_vn_b_ginger_9_f",[5.26465,-0.097168,0],53.8037,1,0,[0,0],"","",false,false], 
		["Land_vn_o_bunker_03",[-3.51953,-5.20264,1.00825],205.382,1,0,[0,0],"","",false,false], 
		["Land_vn_b_rosacanina_2s",[-4.64893,-0.310547,0],0,1,0,[0,0],"","",false,false], 
		["Land_vn_woodentable_small_f",[4.99023,-3.63184,0],295.277,1,0,[0,0],"","",false,false], 
		["vn_o_prop_t102e_01",[4.93066,-4.01074,0.859518],206.044,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_dshkm_high_01",[-4.39941,-5.40723,0],4.77603,1,1,[32.2842,-83.0623],"","",false,false], 
		["Land_vn_b_sambucusnigra_1s",[0.0717773,-7.31494,0],0,1,0,[0,0],"","",false,false], 
		["Land_vn_b_corylus_heterophylla_1",[7.17188,-3.43506,0],11.2567,1,0,[0,0],"","",false,false], 
		["vn_o_nva_spiderhole_02",[-0.114746,-8.39307,0],199.796,1,0,[-1.64267,-6.33042],"","",false,false], 
		["vn_o_nva_static_pk_low",[7.77637,-4.12842,0],60.297,1,0,[-0.116966,0.00010997],"","",false,false], 
		["vn_jar_03",[0.882324,-9.37744,0],188.958,1,0,[0,0],"","",false,false], 
		["vn_jar_03",[8.34668,-4.32129,0],16.4055,1,0,[0,0],"","",false,false], 
		["Land_vn_stone_medium",[4.7998,-8.70898,0],45.367,1,0,[0,0],"","",false,false]
	],
	[
		["vn_o_nva_static_zpu4",[1.41797,2.36328,-0.0780067],144.378,1,0,[6.1176e-007,-6.62803e-006],"","",false,false], 
		["vn_o_nva_static_zpu4",[-3.78467,-0.0795898,-0.0780072],347.535,1,0,[-5.00901e-007,1.24846e-005],"","",false,false], 
		["vn_o_nva_static_pk_low",[-2.27832,5.9126,-0.0752697],127.146,1,0,[-0.117073,0.000100972],"","",false,false], 
		["Land_vn_woodentable_small_f",[-2.33496,-7.18604,0],278.815,1,0,[0,0],"","",false,false], 
		["vn_o_prop_t102e_01",[-2.2627,-7.56055,0.859518],189.581,1,0,[0,0],"","",false,false], 
		["vn_o_nva_spiderhole_01",[-5.23828,-6.79785,-0.0754547],49.4874,1,0,[1.29656e-005,-0.00735968],"","",false,false], 
		["vn_o_nva_spiderhole_03",[8.26416,-3.0752,-0.0752773],208.314,1,0,[-4.4907e-005,0.000215198],"","",false,false], 
		["Land_vn_brier_bush_03",[8.75928,7.9126,0],38.7176,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_pk_low",[6.78711,8.27441,-0.0749998],50.0455,1,0,[0,0],"","",false,false], 
		["Land_vn_bamboo_bush_01",[10.9316,-4.23975,0],26.2745,1,0,[0,0],"","",false,false], 
		["Land_vn_brier_bush_03",[-0.105957,-13.9409,0],165.92,1,0,[0,-0],"","",false,false], 
		["Land_vn_bamboo_bush_01",[12.0215,-5.75391,0],328.683,1,0,[0,0],"","",false,false], 
		["Land_vn_bamboo_bush_01",[13.6563,-3.94141,0],255.709,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_dshkm_low_01",[13.9126,-5.29932,-0.07897],97.7291,1,0,[-1.87076e-005,0.000108814],"","",false,false]
	],
	[
		["vn_o_nva_static_zpu4",[0.270508,2.71484,-0.0780082],266.727,1,0,[-3.88391e-005,2.23928e-005],"","",false,false], 
		["Land_vn_camonet_east",[0.226074,-6.33789,-0.859518],178.577,1,0,[0,-0],"","",false,false], 
		["Land_vn_woodentable_small_f",[-0.0800781,-6.52881,0],278.815,1,0,[0,0],"","",false,false], 
		["vn_o_prop_t102e_01",[-0.046875,-6.5166,0.859518],189.581,1,0,[0,0],"","",false,false], 
		["Land_vn_b_prop_mapstand_01",[3.03955,-6.65723,0],163.637,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_bunker_03",[-1.19971,10.1821,1.00825],357.908,1,0,[0,0],"","",false,false], 
		["Land_vn_o_trench_firing_01",[1.30127,-7.02051,0],178.828,1,0,[0,-0],"","",false,false], 
		["Land_vn_o_trench_firing_01",[7.77393,2.52686,0],47.3274,1,0,[0,0],"","",false,false], 
		["Land_vn_o_trench_firing_01",[-9.24805,0.560059,0],300.673,1,0,[0,0],"","",false,false], 
		["vn_o_nva_spiderhole_02",[0.993164,-12.543,-0.0755548],177.665,1,0,[0.00468779,0.00182757],"","",false,false], 
		["Land_vn_b_pipermeth_f",[-1.48682,-12.6528,0],0,1,0,[0,0],"","",false,false], 
		["Land_vn_b_piceaabies_1f",[9.67188,8.26416,0],312.626,1,0,[0,0],"","",false,false], 
		["Land_vn_b_calochlaena_f",[3.45459,-12.4775,0],0,1,0,[0,0],"","",false,false], 
		["Land_vn_b_ficusc2s_f",[-5.52246,-12.96,0],214.387,1,0,[0,0],"","",false,false], 
		["Land_vn_b_pipermeth_f",[6.47266,12.0234,0],0,1,0,[0,0],"","",false,false], 
		["vn_o_nva_spiderhole_03",[-13.3213,4.28613,-0.0752759],216.39,1,0,[-1.78427e-005,-0.000507215],"","",false,false], 
		["vn_o_nva_spiderhole_03",[13.4399,4.67285,-0.0752769],317.654,1,0,[-6.70783e-005,-0.000239438],"","",false,false], 
		["Land_vn_fence_punji_01_10",[9.1875,11.2153,0],45.2326,1,0,[0,0],"","",false,false], 
		["Land_vn_b_caragana_arborescens",[8.41553,-12.3594,0],148.864,1,0,[0,-0],"","",false,false], 
		["Land_vn_fence_punji_01_10",[-3.60205,-14.5137,0],180.746,1,0,[0,0],"","",false,false]
	],
	[
		["vn_o_nva_65_static_zpu4",[1.76807,1.76367,-0.0780077],28.0467,1,0,[4.52433e-006,-2.32232e-005],"","",false,false], 
		["Box_FIA_Wps_F",[3.56348,-1.20166,1.43051e-006],359.999,1,0,[6.83359e-005,0.000153806],"NVA_9k32_Strela_2M_Missile_Crate","",false,false], 
		["Box_Syndicate_WpsLaunch_F",[2.35059,-3.61035,0],41.6432,1,0,[-0.000372507,-3.21326e-005],"NVA_LAUNCHER_CRATE","",false,false], 
		["vn_o_prop_t102e_01",[-3.15967,2.87598,0.972352],306.156,1,0,[-0.00492311,0.00119035],"","",false,false], 
		["Land_WoodenBox_02_F",[-3.25928,2.94824,0],306.128,1,0,[0,0],"","",false,false], 
		["vn_o_nva_65_static_zpu4",[-1.82129,-4.04541,-0.0780072],236.097,1,0,[-1.85013e-006,-9.45653e-006],"","",false,false], 
		["Land_vn_b_ficusc2s_f",[1.54053,-5.31104,0],205.342,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-1.23242,4.76318,0],74.138,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[4.76758,-1.23682,0],0,1,0,[0,0],"","",false,false], 
		["Weapon_arifle_AKM_F",[-3.43066,3.1582,0.973],324.599,1,0,[0,0],"","",false,false], 
		["Land_vn_b_ficusc2s_f",[-4.52783,-2.00488,0],151.561,1,0,[0,-0],"","",false,false], 
		["Land_vn_b_ficusc2s_f",[-4.48682,4.83105,0],0,1,0,[0,0],"","",false,false], 
		["Land_vn_fence_punji_02_10",[-5.24609,3.08008,0],282.668,1,0,[0,0],"","",false,false], 
		["vn_o_nva_spiderhole_03",[-0.405273,6.5791,-0.0752759],301.922,1,0,[-0.000196787,-0.00070888],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[2.76758,-6.23682,0],246.729,1,0,[0,0],"","",false,false], 
		["Land_vn_b_ficusc1s_f",[6.34863,-2.11182,0],131.389,1,0,[0,-0],"","",false,false], 
		["Land_vn_b_ficusc1s_f",[-5.0957,5.51123,0],24.5458,1,0,[0,0],"","",false,false], 
		["Land_vn_o_wallfoliage_01",[-1.23242,-7.23682,0],68.761,1,0,[0,0],"","",false,false], 
		["Land_vn_b_ficusc2s_f",[6.54053,1.68896,0],205.342,1,0,[0,0],"","",false,false], 
		["Land_vn_t_banana_wild_f",[8.02051,-0.185059,0],0,1,0,[0,0],"","",false,false], 
		["Land_vn_fence_punji_02_10",[6.94141,3.29297,0.0820084],86.7713,1,1,[-90,90],"","",false,false], 
		["vn_o_nva_static_dshkm_low_02",[-6.23438,4.4917,-0.0789695],220.107,1,0,[2.88657e-006,-2.45059e-006],"","",false,false], 
		["Land_vn_fence_punji_02_10",[-4.42871,-6.45166,0.0820093],72.3499,1,1,[-90,90.0001],"","",false,false], 
		["Land_vn_b_ficusc1s_f",[-2.09326,7.74463,0],188.004,1,0,[0,0],"","",false,false], 
		["Land_vn_fence_punji_02_10",[0.493652,8.03076,0],4.39215,1,0,[0,0],"","",false,false], 
		["vn_o_nva_static_pk_low",[2.24805,-7.91748,-0.0752697],181.426,1,0,[-0.117081,4.84782e-005],"","",false,false], 
		["Land_vn_b_ficusc2s_f",[-1.45166,-9.56934,0],205.342,1,0,[0,0],"","",false,false], 
		["Land_vn_b_ficusc1s_f",[7.08057,-5.74121,0],188.004,1,0,[0,0],"","",false,false], 
		["vn_o_nva_spiderhole_03",[9.21582,0.924316,-0.0752649],359.696,1,0,[-0.000249245,-0.00140957],"","",false,false], 
		["Land_vn_fence_punji_02_10",[7.57715,-5.67383,0],282.319,1,0,[0,0],"","",false,false], 
		["vn_o_nva_spiderhole_03",[-2.42139,-9.34277,-0.0762806],157.894,1,0,[0.000672321,0.00459002],"","",false,false], 
		["Land_vn_b_ficusc1s_f",[-6.34863,7.04688,0],188.004,1,0,[0,0],"","",false,false], 
		["Land_vn_b_ficusc1s_f",[-7.65723,6.07422,0],188.004,1,0,[0,0],"","",false,false], 
		["Land_vn_fence_punji_02_10",[1.83301,-10.5059,0.0820093],359.363,1,1,[-90,90.0001],"","",false,false], 
		["Land_vn_b_ficusc1s_f",[6.29541,-8.90381,0],0,1,0,[0,0],"","",false,false], 
		["Land_vn_t_ficus_small_f",[3.44141,-9.29736,0],0,1,0,[0,0],"","",false,false], 
		["Land_vn_t_ficus_small_f",[-10.1768,3.78418,0],0,1,0,[0,0],"","",false,false]
	],
	[
		["Land_vn_fireplace_f",[-1.88965,1.1499,-9.53674e-007],0,1,0,[0,0],"","",false,false], 
		["Land_vn_c_prop_pot_01",[2.06445,-1.48877,0],0,1,0,[0,0],"","",false,false], 
		["Land_WoodenLog_02_F",[1.1416,-2.51221,0],0,1,0,[0,0],"","",false,false], 
		["Land_vn_b_ficusc2s_f",[-3.11279,0.555664,0],0,1,0,[0,0],"","",false,false], 
		["Land_WoodenLog_02_F",[-2.8584,1.48779,0],0,1,0,[0,0],"","",false,false], 
		["vn_air_ch34_01_wreck",[-1.83936,-2.41309,0],314.984,1,0,[0,0],"","",false,false], 
		["vn_o_nva_65_static_zpu4",[2.14111,2.48828,-0.0780067],39.3666,1,0,[-2.09515e-005,-1.18732e-005],"","",false,false], 
		["Land_WoodenLog_02_F",[3.1416,-2.51221,0.0194411],0,1,0,[0,0],"","",false,false], 
		["Box_Syndicate_WpsLaunch_F",[-3.73438,2.66406,-4.76837e-007],41.6432,1,0,[-0.000372433,-3.21616e-005],"NVA_LAUNCHER_CRATE_1","",false,false], 
		["vn_o_nva_spiderhole_03",[4.54834,-1.2998,-0.0752673],359.813,1,0,[-0.000248012,-0.00145648],"","",false,false], 
		["Box_FIA_Wps_F",[-2.82422,4.19141,0],359.998,1,0,[-0.00036426,0.00019592],"NVA_9k32_Strela_2M_Missile_Crate_1","",false,false], 
		["Land_vn_o_shelter_01",[5.1416,-2.51221,0.0036006],0,1,0,[0,0],"","",false,false], 
		["Land_vn_o_shelter_03",[-3.3374,4.15869,0],44.149,1,0,[0,0],"","",false,false], 
		["vn_o_nva_spiderhole_03",[-1.61523,6.05615,-0.0752749],284.437,1,0,[0.000144962,-0.000348359],"","",false,false], 
		["Land_vn_b_ficusc2s_f",[3.81934,-4.00439,0],0,1,0,[0,0],"","",false,false], 
		["vn_o_prop_t102e_01",[6.09082,-3.21387,0.858518],108.453,1,0,[-2.90883e-005,-1.17304e-005],"","",false,false], 
		["Land_vn_woodentable_small_f",[6.13721,-3.50928,0],17.346,1,0,[0,0],"","",false,false], 
		["CraterLong_02_small_F",[1.28174,-6.27002,0],305.949,1,0,[0,0],"","",false,false], 
		["Land_vn_b_ficusc2s_f",[-0.112793,-8.44434,0],0,1,0,[0,0],"","",false,false]
	],
	[
		["vn_o_prop_t102e_01",[-1.48535,1.76709,0],28.6989,1,0,[1.4401e-005,-1.35807e-007],"","",false,false], 
		["Land_vn_bedrag_01",[-1.61426,1.79346,0],189.151,1,0,[0,0],"","",false,false], 
		["vn_o_prop_t884_01",[-2.08594,2.17432,0],0,1,0,[0,0],"","",false,false], 
		["vn_o_item_bedroll_01",[-2.81689,2.93945,0],0,1,0,[0,0],"","",false,false], 
		["vn_o_item_bedroll_01",[-3.19775,2.81982,0],25.685,1,0,[0,0],"","",false,false], 
		["vn_o_nva_65_static_zpu4",[3.18311,2.93652,-0.0780072],44.7955,1,0,[-1.74576e-006,-5.38492e-006],"","",false,false], 
		["vn_o_nva_65_static_zpu4",[-4.81689,-0.0634766,-0.0780072],270.736,1,0,[6.78149e-006,5.38228e-006],"","",false,false], 
		["Land_vn_b_arundod2s_f",[-1.84717,5.13574,-1.45],30.792,1,0,[0,0],"","",false,false], 
		["vn_o_nva_65_static_zpu4",[1.18311,-5.06348,-0.0780072],153.593,1,0,[5.81526e-006,-2.8572e-005],"","",false,false], 
		["Land_vn_b_arundod2s_f",[6.36914,-2.98828,-1.45],107.336,1,0,[0,-0],"","",false,false], 
		["Land_vn_b_arundod2s_f",[-3.84717,-5.86426,-1.45],30.792,1,0,[0,0],"","",false,false], 
		["Land_vn_t_juglansregia_2s",[-0.396484,-0.537109,0],0,1,0,[0,0],"","",false,false], 
		["vn_o_nva_spiderhole_03",[-1.71875,7.71631,-0.0752654],249.808,1,0,[0.000614582,-0.00215659],"","",false,false], 
		["vn_o_nva_spiderhole_03",[-5.24268,-7.38037,-0.0752568],116.312,1,0,[-0.000307683,0.00155385],"","",false,false], 
		["vn_o_nva_spiderhole_03",[8.68555,-2.75293,-0.0752778],359.812,1,0,[-5.66245e-005,-0.000151024],"","",false,false]
	]
];

private _aaObjects = [_position, 0, selectRandom vn_mf_aa_compositions] call BIS_fnc_objectsMapper;
{

	if (_x isKindOf "StaticWeapon") then {
		_x allowDamage false;
		_x setPos [getPos _x # 0, getPos _x # 1, 0];
		_x setVectorUp (surfaceNormal getPos _x);
		_x allowDamage true;
	};
	
} forEach _aaObjects;

_aaObjects