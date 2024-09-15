// Scripts that get tick lengths

function scr_get_tick_length()
{
	return 1 / game_get_speed(gamespeed_fps) * global.gameplay_speed_scale;
}

function scr_get_tick_as_percent(_length_in_seconds)
{
	return 1 / ( game_get_speed(gamespeed_fps) * _length_in_seconds) * global.gameplay_speed_scale;
}