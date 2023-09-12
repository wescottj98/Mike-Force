private _admin_messages = [
    "Events: We regularly host events and custom missions on multiple servers. See the events tab on discord: discord.gg/bro-nation",
    "Servers: We usually have a selection of custom Mike Force servers. Past missions: 1986 Cold War; WW2; Star Wars; Halo; Warhammer 40k. discord.gg/bro-nation",
    "Server Restarts: Every 6 hours: 00:00, 06:00, 12:00, 18:00 EST.",
    "Server Rule 1: Trolling will not be tolerated.",
    "Server Rule 2: Use communication channels appropriately.",
    "Server Rule 3: Missions are to be handled one AO at a time unless otherwise directed.",
    "Server Rule 4: All fire mission requests must be marked appropriately.",
    "Ban Policy: Appeal bans in the discord (ban-appeals channel): discord.gg/bro-nation",
    "Bug / Player / Server Reports: Handled over in the discord: discord.gg/bro-nation"
];

private _msg = format ["%1", selectRandom _admin_messages];

{
    [_msg] remoteExec ["systemChat", _x]
} forEach allPlayers;
