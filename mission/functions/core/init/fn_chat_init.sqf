/*
    File: fn_chat_init.sqf
    Author: Cerebral
    Public: No

    Description:
        Initializes the chat channels.

    Parameter(s): none

    Returns: nothing

    Example(s): none
*/

//Add Ground chat 
private _groundChat = radioChannelCreate [[1, 0.15, 0.15, 1], "Ground", "%UNIT_GRP_NAME (%UNIT_NAME)", []]; 
if(_groundChat == 0) then
{
    diag_log "Ground channel failed to init";
};

//Add Air chat 
private _airChat = radioChannelCreate [[0, 0.8, 0, 1], "Air", "%UNIT_GRP_NAME (%UNIT_NAME)", []]; 
if(_airChat == 0) then
{
    diag_log "Air channel failed to init";
};

//Add ACAV chat 
private _acavChat = radioChannelCreate [[1, 0.59, 0, 1], "ACAV", "%UNIT_GRP_NAME (%UNIT_NAME)", []]; 
if(_acavChat == 0) then
{
    diag_log "ACAV channel failed to init";
};

// Add MACV chat
private _macvChat = radioChannelCreate [[0.85, 0.85, 0, 1], "MACV", "%UNIT_GRP_NAME (%UNIT_NAME)", []]; 
if(_macvChat == 0) then
{
    diag_log "MACV channel failed to init";
};