// We want the game to be unpaused anytime a room first starts.
global.paused = false;

// Make sure the room runs at the global framerate.
game_set_speed(global.GAMEPLAY_FRAMERATE, gamespeed_fps);

global.enemy_kill_signal = false;
