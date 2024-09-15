// Debug controls
if (global.debug_global)
{
	// Close the game when the debug exit key is pressed.
	if (keyboard_check(global.controls_debug_exit)) game_end();

	// Restart the current room if the debug restart key is pressed.
	if (global.debug_can_restart_level && keyboard_check_pressed(global.controls_debug_restart))
	{
		//room_restart();
		scr_transition_fade_to_color(room);
	}
	
	// Toggle fullscreen mode if the debug fullscreen key is pressed.
	if (keyboard_check_pressed(global.controls_debug_fullscreen))
		window_set_fullscreen(!window_get_fullscreen());
		
	// Toggle pause mode if the debug pause key is pressed.
	if (global.debug_can_pause && keyboard_check_pressed(global.controls_debug_pause))
		global.paused = !global.paused;
}

var _temp_game_speed = game_get_speed(gamespeed_fps);
if (_temp_game_speed < global.GAMEPLAY_FRAMERATE)
{
	game_set_speed(_temp_game_speed + 1, gamespeed_fps);
}