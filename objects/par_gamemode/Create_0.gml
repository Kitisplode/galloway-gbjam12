/// @description This class represents a gamemode, and tracks win conditions and loss conditions.

enum GAMEMODE_STATUS
{
	PLAY,
	RESPAWN,
	LOSE,
	WIN
};

// If there is already an active gamemode... delete this one.
if (instance_number(par_gamemode) > 1) instance_destroy();

// Otherwise, set the main controller's game mode to this one.
//global.gamemode_ID = id;

finalized_setup = false;

status = GAMEMODE_STATUS.PLAY;

//global.paused = false;

depth = -5000;