if (id != global.active_room)
{
	if (place_meeting(x, y, obj_base_player))
	{
		global.active_room = id;
		global.player_spawn_x = obj_base_player.position[0];//floor(obj_base_player.position[0] / 16) * 16 + 8;
		global.player_spawn_y = obj_base_player.position[1];//floor(obj_base_player.position[1] / 16) * 16 + 8;
		global.player_spawn_z = obj_base_player.position[2] + 1;
		global.player_spawn_direction = obj_base_player.direction;
	}
}
	