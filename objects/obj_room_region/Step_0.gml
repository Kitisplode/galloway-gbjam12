if (id != global.active_room)
{
	if (place_meeting(x, y, obj_base_player))
	{
		global.active_room = id;
		global.player_spawn_x = floor(obj_base_player.position[0] / 16) * 16 + 8;
		global.player_spawn_y = floor(obj_base_player.position[1] / 16) * 16 + 8;
		global.player_spawn_z = floor(obj_base_player.position[2] / 16) * 16 + 8;
		global.player_spawn_direction = obj_base_player.direction;
	}
}
	