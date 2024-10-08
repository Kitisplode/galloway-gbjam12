/// @description Change rooms
// Only if the player is offscreen (and we're not already changing rooms ofc)
if (scr_check_off_screen(other, 8) && !instance_exists(par_transition))
{
	if (is_nan(next_x)) global.player_spawn_x = other.x;
	else global.player_spawn_x = next_x;
	if (is_nan(next_y)) global.player_spawn_y = other.y;
	else global.player_spawn_y = next_y;
	if (is_nan(next_z)) global.player_spawn_z = other.z;
	else global.player_spawn_z = next_z;
	if (is_nan(next_direction)) global.player_spawn_direction = other.direction;
	else global.player_spawn_direction = next_direction;
	//global.player_spawn_index = other.object_index;
	scr_transition_fade_to_color(next_room);
	//show_debug_message("room transition: {0}", other.object_index);
}