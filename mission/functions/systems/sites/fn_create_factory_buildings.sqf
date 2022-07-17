/*
	File: fn_create_factory_buildings.sqf
	Author: Cerebral
	Public: No
	
	Description:
		Creates buildings for a PAVN Factory.
	
	Parameter(s):
		_position - Position [Position]
	
	Returns: nothing
	
	Example(s): none
	
	0: STRING	- Classname
	1: ARRAY	- Position [delta X, delta Y, z]
	2: NUMBER	- Azimuth
	3: NUMBER	- Fuel
	4: NUMBER	- Damage
	5: ARRAY	- Return from BIS_fnc_getPitchBank (only if 2nd param is true)
	6: STRING	- vehicleVarName
	7: STRING	- Initialization commands
	8: BOOLEAN	- Enable simulation
	9: BOOLEAN	- Position is ASL
*/

params ["_position"];

vn_mf_factory_compositions = [];

if(toLower(worldName) in ["cam_lao_nam", "vn_khe_sanh"])then {
	vn_mf_factory_compositions = [
		[
			["vn_o_armor_type63_01",[-3.70959,-0.818848,-0.0992966],180.535,1,0,[0.0437782,0.0194801],"","",false,false], 
			["Land_WoodenTable_large_F",[8.96582,5.06299,0.328636],268.464,1,0,[0,0],"","",false,false], 
			["vn_o_nva_65_static_zpu4",[8.96582,5.06299,6.00192],89.3972,1,0,[1.06611e-005,4.13474e-005],"","",false,false], 
			["Land_Map_unfolded_Malden_F",[8.96582,5.06299,1.21323],0,1,0,[0,0],"","",false,false], 
			["vn_o_armor_type63_01",[-12.1663,-1.03955,-0.099298],178.4,1,0,[0.043654,0.0194584],"","",false,false], 
			["Land_vn_sm_01_shelter_wide_f",[-2.7514,1.33057,0],269.958,1,0,[0,0],"","",false,false], 
			["Land_vn_wf_vehicle_service_point_east",[-13.0492,7.38867,0.0659533],181.648,1,0,[-1.51054e-005,-1.27548e-006],"","",false,false], 
			["Land_vn_pillboxwall_01_6m_round_f",[-3.68579,15.7007,0.267078],180.974,1,0,[0,0],"","",false,false], 
			["Land_vn_usaf_revetment_helipad_02",[11.7319,-14.4453,-0.00240421],0.473451,1,0,[0,0],"","",false,false], 
			["Land_vn_cementworks_01_grey_f",[-0.233704,20.5327,0],269.532,1,0,[0,0],"","",false,false], 
			["vn_o_air_mi2_04_01",[10.0447,-14.2432,-0.150681],88.7392,1,0,[1.84758,-0.00150054],"","",false,false], 
			["Land_vn_pillboxwall_01_6m_round_f",[-8.88684,15.8271,0.267078],180.974,1,0,[0,0],"","",false,false], 
			["Land_vn_pillboxwall_01_6m_round_f",[-0.934753,18.5234,0.267078],90.4742,1,0,[0,-0],"","",false,false], 
			["Land_vn_fuel_tank_stairs",[-2.40186,18.9492,0.267078],0.119405,1,0,[0,0],"","",false,false], 
			["vn_o_armor_type63_01",[-20.7893,-0.487305,-0.099298],179.345,1,0,[0.0437644,0.0194573],"","",false,false], 
			["Land_vn_plot_green_branka",[-1.75897,21.4277,-0.126109],180.599,1,0,[0,0],"","",false,false], 
			["Land_vn_pillboxwall_01_6m_round_f",[-5.46564,21.3257,0.267078],1.02018,1,0,[0,0],"","",false,false], 
			["Land_vn_pillboxwall_01_6m_round_f",[-11.6318,18.6934,0.267078],270.081,1,0,[0,0],"","",false,false], 
			["Land_vn_pillboxwall_01_6m_round_f",[-8.86047,21.3818,0.267078],1.02018,1,0,[0,0],"","",false,false], 
			["Land_NetFence_01_m_8m_F",[23.9233,3.7085,1.62215],89.8709,1,0,[0,0],"","",false,false], 
			["Land_NetFence_01_m_8m_F",[23.9196,-4.29932,1.62215],90.1429,1,0,[0,-0],"","",false,false], 
			["Land_NetFence_01_m_8m_F",[-4.00897,-24.2334,1.62215],180.443,1,0,[0,0],"","",false,false], 
			["Land_NetFence_01_m_8m_F",[3.99738,-24.2563,1.62215],180.443,1,0,[0,0],"","",false,false], 
			["Land_NetFence_01_m_8m_F",[23.924,11.7314,1.62215],90.1429,1,0,[0,-0],"","",false,false], 
			["Land_NetFence_01_m_8m_F",[23.9194,-12.2778,1.62215],89.8709,1,0,[0,0],"","",false,false], 
			["Land_NetFence_01_m_8m_F",[-12.0134,-24.2148,1.62215],179.49,1,0,[0,-0],"","",false,false], 
			["Land_NetFence_01_m_8m_F",[12.0029,-24.3169,1.62215],180.443,1,0,[0,0],"","",false,false], 
			["Land_NetFence_01_m_8m_F",[-30.0414,0.65332,1.62215],90.0442,1,0,[0,-0],"","",false,false], 
			["Land_Net_Fence_Gate_F",[-22.4385,-25.9351,0],91.9677,1,0,[0,-0],"","",false,false], 
			["Land_NetFence_01_m_8m_F",[-30.0722,-7.41895,1.62215],90.0442,1,0,[0,-0],"","",false,false], 
			["Land_NetFence_01_m_8m_F",[23.9278,19.7393,1.62215],89.8709,1,0,[0,0],"","",false,false], 
			["Land_vn_strazni_vez",[-29.1696,-17.6387,0],1.37287,1,0,[0,0],"","",false,false], 
			["Land_NetFence_01_m_8m_F",[-30.054,8.66162,1.62215],90.0442,1,0,[0,-0],"","",false,false], 
			["Land_NetFence_01_m_8m_F",[23.9156,-20.2856,1.62215],90.1429,1,0,[0,-0],"","",false,false], 
			["Land_NetFence_01_m_8m_F",[-19.9836,-24.2261,1.62215],180.443,1,0,[0,0],"","",false,false], 
			["Land_NetFence_01_m_8m_F",[20.0116,-24.377,1.62215],180.443,1,0,[0,0],"","",false,false], 
			["Land_NetFence_01_m_8m_F",[-25.8954,-18.25,1.62215],180.443,1,0,[0,0],"","",false,false], 
			["Land_NetFence_01_m_8m_F",[-30.0159,-14.4321,1.62215],269.272,1,0,[0,0],"","",false,false], 
			["vn_o_nva_65_static_zpu4",[-24.1265,17.4907,8.91143],5.78694,1,0,[-2.32492e-006,-1.04378e-005],"","",false,false], 
			["Land_NetFence_01_m_8m_F",[-26.1068,-24.2168,1.62215],180.443,1,0,[0,0],"","",false,false], 
			["Land_NetFence_01_m_8m_F",[23.9061,27.6348,1.62215],90.1429,1,0,[0,-0],"","",false,false], 
			["Land_Net_Fence_Gate_F",[-29.9689,-16.3291,0],270.512,1,0,[0,0],"","",false,false], 
			["Land_NetFence_01_m_8m_F",[19.9647,31.4438,1.622],359.151,1,0,[0,0],"","",false,false]
		],
		[
			["vn_o_armor_type63_01",[12.1646,-1.47314,-0.0990906],268.814,1,0,[0.0424399,0.0178929],"","",false,false], 
			["vn_o_armor_type63_01",[12.0884,4.5459,-0.100299],267.773,1,0,[0.0421888,0.0181872],"","",false,false], 
			["vn_o_armor_type63_01",[12.0235,-7.47852,-0.0983458],270.403,1,0,[0.0416342,0.0173247],"","",false,false], 
			["Land_vn_pillboxwall_01_6m_round_f",[-1.07635,14.5742,0.228407],180.421,1,0,[0,0],"","",false,false], 
			["Land_vn_pillboxwall_01_6m_round_f",[2.31885,14.5537,0.228407],180.421,1,0,[0,0],"","",false,false], 
			["Land_vn_plot_green_branka",[-4.7818,14.4331,0],0,1,0,[0,0],"","",false,false], 
			["vn_o_armor_type63_01",[11.3699,10.4971,-0.102966],268.23,1,0,[0.0378777,0.0132867],"","",false,false], 
			["vn_weapon_srifle_m40a1",[-12.2588,-8.90088,0.00721359],90.8063,1,0,[0.00252077,-0.179119],"","",false,false], 
			["Land_WoodenTable_large_F",[-12.2358,-7.14844,0.313781],268.464,1,0,[0.00480082,0.179072],"","",false,false], 
			["Land_vn_b_prop_map_01",[-12.665,-7.19385,1.19972],178.432,1,0,[0,-0],"","",false,false], 
			["vn_b_item_cigs_01_gh",[-11.4141,-7.47314,1.17837],268.464,1,0,[0,0],"","",false,false], 
			["Land_vn_fuel_tank_stairs",[-4.16486,16.9185,0],179.52,1,0,[0,-0],"","",false,false], 
			["vn_prop_drink_09_01_gh",[-13.7435,-8.94189,1.01845],44.2154,1,0,[0.122676,0.130516],"","",false,false], 
			["Land_vn_b_prop_messtin_02",[-14.1807,-8.15869,0.108372],149.896,1,0,[0.32701,89.1378],"","",false,false], 
			["Land_Map_unfolded_Malden_F",[-11.8208,-7.21826,1.19906],268.464,1,0,[0.00480082,0.179072],"","",false,false], 
			["Land_vn_wf_vehicle_service_point_east",[-16.4374,5.43555,0.0659547],91.0661,1,0.0098301,[-0.0001114,1.94386e-005],"","",false,false], 
			["Land_GarageOffice_01_F",[-13.1606,-11.4868,0],178.78,1,0,[0,-0],"","",false,false], 
			["Land_vn_pillboxwall_01_6m_round_f",[5.06195,17.271,0.228407],89.4816,1,0,[0,0],"","",false,false], 
			["Land_vn_pillboxwall_01_6m_round_f",[-5.67017,17.3301,0.24706],269.875,1,0,[0,0],"","",false,false], 
			["Land_vn_pillboxwall_01_6m_round_f",[2.28644,20.1406,0.235145],0.374524,1,0,[0,0],"","",false,false], 
			["Land_vn_pillboxwall_01_6m_round_f",[-2.91449,20.2119,0.249467],0.374524,1,0,[0,0],"","",false,false], 
			["Land_WeldingTrolley_01_F",[-11.3365,-17.0562,-0.000984669],0.00159469,1,0,[0.00144684,-0.00158068],"","",false,false], 
			["Land_vn_b_trench_90_02",[-10.3475,14.7861,0],359.594,1,0,[0,0],"","",false,false], 
			["vn_o_nva_65_static_zpu4",[-12.4202,17.0928, 0],5.78692,1,0,[-7.78285e-007,-1.01417e-005],"","",false,false], 
			["Land_vn_b_trench_revetment_tall_09",[1.74731,-23.1372,0],270.796,1,0,[0,0],"","",false,false], 
			["Land_vn_b_trench_90_02",[12.4694,-17.1714,0.420149],180.505,1,0,[0,0],"","",false,false], 
			["vn_o_nva_65_static_zpu4",[13.6128,-20.3247, 0],5.78741,1,0,[4.0679e-006,-1.96641e-006],"","",false,false], 
			["Land_vn_b_tower_01",[4.909,-24.6118,0],180.443,1,0,[0,0],"","",false,false], 
			["Land_vn_b_trench_revetment_tall_09",[-10.4871,-23.6943,0],89.7132,1,0,[0,0],"","",false,false], 
			["Land_vn_b_trench_20_01",[24.7507,-9.04932,0.863389],88.3601,1,0,[0,0],"","",false,false], 
			["Land_vn_b_tower_01",[16.3731,19.6846,0],359.834,1,0,[0,0],"","",false,false], 
			["Land_vn_b_trench_20_01",[24.2402,10.0532,0.863389],88.8883,1,0,[0,0],"","",false,false], 
			["Land_vn_b_trench_20_01",[-25.2679,9.18408,0.863389],269.319,1,0,[0,0],"","",false,false], 
			["Land_vn_b_trench_20_01",[-24.9171,-10.0054,0.863389],269.319,1,0,[0,0],"","",false,false], 
			["Land_vn_b_tower_01",[-11.4503,-24.0078,0],178.913,1,0,[0,-0],"","",false,false], 
			["Land_vn_b_trench_20_01",[-9.15057,25.4854,0.863389],358.982,1,0,[0,0],"","",false,false], 
			["Land_vn_b_tower_01",[-20.5016,19.4312,0],359.834,1,0,[0,0],"","",false,false], 
			["Land_vn_b_trench_revetment_tall_09",[5.82129,-27.145,0],179.592,1,0,[0,-0],"","",false,false], 
			["Land_vn_b_trench_20_01",[9.95343,25.9644,0.863389],358.454,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_03",[1.99884,-29.3418,0],87.831,1,0,[0,0],"","",false,false], 
			["Land_vn_b_trench_revetment_tall_09",[12.4453,-27.0732,0],179.592,1,0,[0,-0],"","",false,false], 
			["Land_vn_b_trench_revetment_tall_09",[-15.0765,-27.459,0],179.592,1,0,[0,-0],"","",false,false], 
			["Land_vn_fence_punji_01_03",[-10.4271,-29.9536,0],87.831,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[-31.6223,-4.52246,0],88.945,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[-31.8147,5.12939,0],88.945,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_03",[1.99377,-32.5562,0],87.831,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[32.6474,5.17041,0],88.945,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[32.8398,-4.48145,0],88.945,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[-0.865173,34.1367,0],179.082,1,0,[0,-0],"","",false,false], 
			["Land_vn_fence_punji_01_03",[-10.2396,-32.7046,0],87.831,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[-31.4288,-14.1748,0],88.945,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[6.36572,-34.2168,0],180.538,1,0,[0,0],"","",false,false], 
			["Land_vn_b_trench_tee_01",[24.0089,26.3062,0.863389],180.39,1,0,[0,0],"","",false,false], 
			["Land_vn_b_trench_tee_01",[24.9836,-25.3584,0.863389],0.390312,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[-31.8619,14.7222,0],88.945,1,0,[0,0],"","",false,false], 
			["Land_vn_b_trench_tee_01",[-24.9243,-26.0063,0.863389],0.390312,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[8.7876,34.3071,0],179.082,1,0,[0,-0],"","",false,false], 
			["Land_vn_b_trench_tee_01",[-25.549,25.8608,0.863389],180.39,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[-10.6074,34.1572,0],179.082,1,0,[0,-0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[32.5565,14.9263,0],88.945,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[33.0333,-14.1338,0],88.945,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[14.1982,-34.019,0],180.538,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[-14.5495,-34.0894,0],180.538,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[18.4399,34.4766,0],179.082,1,0,[0,-0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[-20.1436,34.0542,0],179.082,1,0,[0,-0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[23.8522,-34.0938,0],180.538,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[-41.6334,2.29102,0],269.861,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[-24.5345,-33.8994,0],180.538,1,0,[0,0],"","",false,false], 
			["Land_vn_b_trench_firing_05",[-33.6761,-26.0801,0.863389],179.366,1,0,[0,-0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[-41.5175,-9.75293,0],270.27,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[42.6041,-0.572266,0],270.27,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[-41.5912,12.0708,0],269.861,1,0,[0,0],"","",false,false], 
			["Land_vn_b_trench_firing_05",[34.3027,26.4063,0.863389],358.167,1,0,[0,0],"","",false,false], 
			["Land_vn_b_trench_firing_05",[35.2449,-25.625,0.863389],0.377374,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[42.7027,9.46191,0],270.27,1,0,[0,0],"","",false,false], 
			["Land_vn_b_trench_firing_05",[-35.287,25.9404,0.863389],179.366,1,0,[0,-0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[42.5746,-10.2266,0],270.27,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[28.1959,34.5439,0],179.082,1,0,[0,-0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[-29.6107,34.0811,0],179.082,1,0,[0,-0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[-41.6606,-19.7388,0],270.27,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[42.7775,18.7617,0],269.861,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[-41.4927,21.9185,0],269.861,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[42.4314,-20.2124,0],270.27,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[-34.1885,-33.8247,0],180.538,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[33.8372,-34.2837,0],180.538,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[42.7645,23.3286,0],269.861,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[-36.7784,34.0557,0],179.018,1,0,[0,-0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[37.2611,34.5332,0],2.31266,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[-41.3008,30.0176,0],269.861,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[42.3194,-29.9912,0],270.27,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[38.7941,-34.521,0],180.538,1,0,[0,0],"","",false,false], 
			["Land_vn_fence_punji_01_10",[42.7113,31.04,0],269.283,1,0,[0,0],"","",false,false]
		]
	];
};

//if(toLower(worldName) isEqualTo "tanoa")then {
//	vn_mf_hq_composition = [
//	];
//};

private _randomAngle = [0,360] call BIS_fnc_randomInt;
private _factoryObjects = [_position, _randomAngle, selectRandom vn_mf_factory_compositions, 0] call BIS_fnc_objectsMapper;
{
    if (_x isKindOf "GRAD_envelope_giant") then {
        _x setVectorUp (surfaceNormal getPos _x);
    };
	
	if (_x isKindOf "Land_vn_o_trench_firing_01") then {
        _x setVectorUp (surfaceNormal getPos _x);
    };

} forEach _factoryObjects;

_factoryObjects