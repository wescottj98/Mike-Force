// limits and vanilla/custom trait values
class MikeForce
{
    name = "Mike Force [Infantry]";
    icon = "\vn\ui_f_vietnam\ui\taskroster\img\logos\Logo_MikeForce_HL.paa";
    shortname = "Mike Force";
    unit = "vn_b_men_army_01";
    color = "ColorBlue";
    colorRGBA[] = {0, 0, 1, 1};
    description = "Sweep and clear areas; assault objectives and defend friendly positions.";

    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 10;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = false;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = true;
        increasedBuildRate = false;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class SpikeTeam
{
    name = "Spike Team [Special Forces]";
    icon = "\vn\ui_f_vietnam\ui\taskroster\img\logos\Logo_SpikeTeam_HL.paa";
    shortname = "Spike Team";
    unit = "vn_b_men_army_01";
    color = "ColorUNKNOWN";
    colorRGBA[] = {0.7,0.6,0,1};
    description = "Reconnaissance; ambushing and assaulting objectives.";

    class rolelimits 
    {
        medic = 40;
        engineer = 0;
        explosiveSpecialist = 20;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 1;
        audibleCoef = 0.3;
        loadCoef = 0.5;
        engineer = false;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = true;
        scout_multiple = true;
        increasedBuildRate = false;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class ACAV
{
    name = "Armored Cavalry [Ground Support]";
    icon = "\vn\ui_f_vietnam\ui\taskroster\img\logos\Logo_ACAV_HL.paa";
    shortname = "ACAV";
    unit = "vn_b_men_army_01";
    color = "ColorOrange";
    colorRGBA[] = {0.85, 0.4, 0, 1};
    description = "Combat engineering, artillery fire support and armour support.";

    class rolelimits 
    {
        medic = 20;
        engineer = 40;
        explosiveSpecialist = 10;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = false;
        increasedBuildRate = false;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class GreenHornets
{
    name = "Green Hornets [Air Support]";
    icon = "\vn\ui_f_vietnam\ui\taskroster\img\logos\Logo_Hornets_HL.paa";
    shortname = "Green Hornets";
    unit = "vn_b_men_army_01";
    color = "ColorIndependent";
    colorRGBA[] = {0, 1, 0, 1};
    description = "Helicopter based troop transport, resupply and reconnaissance.";
    
    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 0;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = false;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = false;
        increasedBuildRate = false;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class 3rdMEU
{
    name = "31st MEU [31st MEU]";
    icon = "custom\taskroster\31st_logo_meu_HL.paa";
    shortname = "31st MEU";
    unit = "vn_b_men_army_01";
    color = "ColorBlue";
    colorRGBA[] = {0, 0.3, 0.6, 1};
    description = "Forged in the crucible of history and honed through decades of service, the 31st MEU stands as a symbol of unwavering dedication and prowess in the world of military operations.";

    class rolelimits 
    {
        medic = 10;
        engineer = 40;
        explosiveSpecialist = 10;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = true;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = false;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class MilitaryPolice
{
    name = "Military Police [716th MP]";
    icon = "custom\taskroster\militarypolice_HL.paa";
    shortname = "Military Police";
    unit = "vn_b_men_army_01";
    color = "ColorBlue";
    colorRGBA[] = {0, 0, 1, 1};
    description = "We are a tribute unit for the 716th Military Police Battalion (Saigon Warriors) that focus on Military Police action in combat and in a garrison role.";

    class rolelimits 
    {
        medic = 40;
        engineer = 20;
        explosiveSpecialist = 20;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = false;
        explosiveSpecialist = false;
        medic = true;
        UAVHacker = false;
        vn_artillery = true;
        harassable = true;
        scout = false;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class QuarterHorse
{
    name = "Black Horse [11th ACR]";
    icon = "custom\taskroster\blackhorse_HL.paa";
    shortname = "Black Horse";
    unit = "vn_b_men_army_01";
    color = "ColorOrange";
    colorRGBA[] = {0.85, 0.4, 0, 1};
    description = "11th ACR is a multi-component combat brigade with a special emphasis on combat engineering, armored warfare, and firesupport.";

    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = false;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class Frogmen
{
    name = "Frogmen [UDT]";
    icon = "custom\taskroster\frogmen_HL.paa";
    shortname = "Frogmen";
    unit = "vn_b_men_army_01";
    color = "ColorOrange";
    colorRGBA[] = {0.85, 0.4, 0, 1};
    description = "UDT is a USN based spike team. Before there were SEALs, there was UDT.";

    class rolelimits 
    {
        medic = 20;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 1;
        audibleCoef = 0.3;
        loadCoef = 0.5;
        engineer = true;
        explosiveSpecialist = true;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = true;
        scout_multiple = true;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class Muskets
{
    name = "Muskets [176th Gunships]";
    icon = "custom\taskroster\muskets_HL.paa";
    shortname = "Muskets";
    unit = "vn_b_men_army_01";
    color = "ColorIndependent";
    colorRGBA[] = {0, 1, 0, 1};
    description = "The 176th Assault Helicopter Company, 3rd Gunship Platoon, also known as the 'Muskets' is a Close Air Support (CAS) unit that provides air support using a variety of attack helicopters.";
    
    class rolelimits 
    {
        medic = 20;
        engineer = 20;
        explosiveSpecialist = 0;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = false;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = false;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class SatansAngels
{
    name = "Satans Angels [433rd TFS]";
    icon = "custom\taskroster\satansangels_HL.paa";
    shortname = "Satans Angels";
    unit = "vn_b_men_army_01";
    color = "ColorIndependent";
    colorRGBA[] = {0, 1, 0, 1};
    description = "An advanced air superiority squadron providing close air support and air superiority.";
    
    class rolelimits 
    {
        medic = 20;
        engineer = 20;
        explosiveSpecialist = 20;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = false;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = false;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class 633rdCSG
{
    name = "Crossbow [633rd CSG]";
    icon = "custom\taskroster\633rdcombatsupportgroup_HL.paa";
    shortname = "Crossbow";
    unit = "vn_b_men_army_01";
    color = "ColorBlue";
    colorRGBA[] = {0, 1, 0, 1};
    description = "Support functions with a focus on aviation support and logistics. We do what others don't want to do or are deemed dangerous.";
    
    class rolelimits 
    {
        medic = 30;
        engineer = 60;
        explosiveSpecialist = 30;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = false;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class 7thCAV
{
    name = "Garryowen [7th CAV]";
    icon = "custom\taskroster\7thcav_HL.paa";
    shortname = "Garryowen";
    unit = "vn_b_men_army_01";
    color = "ColorOrange";
    colorRGBA[] = {0.85, 0.4, 0, 1};
    description = "The 7th Cavalry Regiment is an air cavalry based unit that focuses on rapid and mobile assaults.";
    
    class rolelimits 
    {
        medic = 30;
        engineer = 60;
        explosiveSpecialist = 30;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = true;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = false;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class TigerForce
{
    name = "Tiger Force [Recon]";
    icon = "custom\taskroster\tigerforce_HL.paa";
    shortname = "Tiger Force";
    unit = "vn_b_men_army_01";
    color = "ColorUNKNOWN";
    colorRGBA[] = {0.7,0.6,0,1};
    description = "Tiger Force is a Long Range Reconnaissance Patrol comprised of 45 Paratroopers from the 1st Battalion 327th Infantry Regiment of the 101st Airborne.";
    
    class rolelimits 
    {
        medic = 15;
        engineer = 20;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 1;
        audibleCoef = 0.3;
        loadCoef = 0.5;
        engineer = false;
        explosiveSpecialist = true;
        medic = true;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = true;
        scout_multiple = true;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

// class Montagnard
// {
//     name = "Montagnard [5th SFG]";
//     icon = "custom\taskroster\montagnard_HL.paa";
//     shortname = "Montagnard";
//     unit = "vn_b_men_army_01";
//     color = "ColorUNKNOWN";
//     colorRGBA[] = {0.7,0.6,0,1};
    
//     class rolelimits 
//     {
//         medic = 20;
//         engineer = 40;
//         explosiveSpecialist = 40;
//         vn_artillery = 0;
//     };
    
//     class defaultTraits
//     {
//         camouflageCoef = 1;
//         audibleCoef = 0.3;
//         loadCoef = 0.5;
//         engineer = true;
//         explosiveSpecialist = true;
//         medic = true;
//         UAVHacker = false;
//         vn_artillery = false;
//         harassable = true;
//         scout = true;
//         scout_multiple = true;
//         increasedBuildRate = true;
//     };

//     //Function Calls on team Join
//     onJoin = "";
//     onLeave = "";
// };

class SASR
{
    name = "SASR";
    icon = "custom\taskroster\nzsas_HL.paa";
    shortname = "SASR";
    unit = "vn_b_men_army_01";
    color = "ColorUNKNOWN";
    colorRGBA[] = {0.7,0.6,0,1};
    description = "NZ-SAS are an New Zealand and Australian themed Small Unit Tactics (SUT) Offshoot of the SAS.";
    
    class rolelimits 
    {
        medic = 20;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 1;
        audibleCoef = 0.3;
        loadCoef = 0.5;
        engineer = true;
        explosiveSpecialist = true;
        medic = true;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = true;
        scout_multiple = true;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class ARVN
{
    name = "Army of the Republic of Vietnam";
    icon = "custom\taskroster\ARVN_HL.paa";
    shortname = "ARVNR";
    unit = "vn_b_men_army_01";
    color = "ColorUNKNOWN";
    colorRGBA[] = {0.7,0.6,0,1};
    description = "A light infantry unit with different elements: recon team; armored corps and traditional infantry.";

    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };

    class defaultTraits
    {
        camouflageCoef = 0.8;
        audibleCoef = 0.6;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = true;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = true;
        scout = true;
        scout_multiple = true;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class MACV
{
    name = "MACV [Command]";
    icon = "custom\taskroster\macv_HL.paa";
    shortname = "MACV";
    unit = "vn_b_men_army_01";
    color = "ColorYellow";
    colorRGBA[] = {0.85, 0.85, 0, 1};
    description = "Military Assistance Command, Vietnam.";
    
    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 1;
        audibleCoef = 0;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = true;
        medic = true;
        UAVHacker = true;
        vn_artillery = false;
        harassable = false;
        scout = true;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class DacCong
{
    name = "Dac Cong [Commandos]";
    icon = "custom\taskroster\daccong_team.paa";
    shortname = "Dac Cong";
    unit = "vn_b_men_army_01";
    color = "ColorOPFOR";
    colorRGBA[] = {1, 0, 0, 1};
    
    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 1;
        audibleCoef = 0;
        loadCoef = 1;
        engineer = true;
        explosiveSpecialist = true;
        medic = true;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = false;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};

class PressCorp
{
    name = "Press Corp [DASPO]";
    icon = "custom\taskroster\presscorp_HL.paa";
    shortname = "Press Corp";
    unit = "C_journalist_F";
    color = "ColorCIV";
    colorRGBA[] = {0.4, 0, 0.5, 1};
    description = "The Department of the Army Special Photographic Office was a unit of the United States Department of the Army from 1962 to 1974.";

    class rolelimits 
    {
        medic = 40;
        engineer = 40;
        explosiveSpecialist = 40;
        vn_artillery = 0;
    };
    
    class defaultTraits
    {
        camouflageCoef = 1;
        audibleCoef = 0;
        loadCoef = 1;
        engineer = false;
        explosiveSpecialist = false;
        medic = false;
        UAVHacker = false;
        vn_artillery = false;
        harassable = false;
        scout = false;
        increasedBuildRate = true;
    };

    //Function Calls on team Join
    onJoin = "";
    onLeave = "";
};