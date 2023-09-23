/*
    File: fn_director_play_music_completed_zone.sqf
    Author: DJ Dijksterhuis
    Public: Yes
    
    Description:
        Plays some random music when a zone is marked as completed

        [!!!!!] MUST BE RUN IN A SCHEDULED ENVIRONMENT [!!!!!] 

        Needs to run locally on each player.
    
        https://community.bistudio.com/wiki/Arma_3:_Remote_Execution
        https://community.bistudio.com/wiki/remoteExec

    
    Parameter(s): player 
    
    Returns:
    
    Example(s):
        allPlayers apply {
            [_x] call remoteExec ["vn_mf_fnc_director_play_music_completed_zone"];
        };

*/

0 fadeMusic 1;
playMusic selectRandom [
    "vn_trippin",
    "vn_drafted",
    "vn_there_it_is",
    "vn_fire_in_the_sky",
    "vn_dont_cry_baby"
];

sleep 45; 
// Fade out the music
30 fadeMusic 0;
// Restore the music volume in the near future.
sleep 35; 
playMusic ""; 
2 fadeMusic 1;
