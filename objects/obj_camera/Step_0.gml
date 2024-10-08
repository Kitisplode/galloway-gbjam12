/// @description Update camera

// Update target
if (instance_exists(follow))
{
	x_to = follow.x;
	y_to = follow.y;
}
else
{
	if (instance_exists(obj_base_player))
	{
		follow = obj_base_player;
	}
	else
	{
		x = view_width_half;
		y = view_height_half;
	}
}

// Update camera position
//x += (xTo - x) / 15;
//y += (yTo - y) / 15;

// Keep camera center inside room
if (instance_exists(global.active_room))
{
	x = clamp(x_to - view_width_half, 
		global.active_room.x - TILE_SIZE, 
		global.active_room.x + global.active_room.sprite_width + TILE_SIZE - view_width_half*2);
	y = clamp(y_to - view_height_half, 
		global.active_room.y - TILE_SIZE, 
		global.active_room.y + global.active_room.sprite_height + TILE_SIZE - view_height_half*2);
}

// Update screenshake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);

shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));

// Set camera position
if (room_get_name(room) == "rm_gbjam_splash_gbjam" ||
	room_get_name(room) == "rm_gbjam_splash_title" ||
	room_get_name(room) == "rm_gbjam_splash_galloway")
{
	//camera_set_view_pos(cam, x,y);
}
else if (!instance_exists(par_transition))
{
	camera_set_view_pos(cam, 
		lerp(camera_get_view_x(cam),x,0.2), 
		lerp(camera_get_view_y(cam),y,0.2));
}
else
{
	cam = view_camera[0];
	camera_set_view_pos(cam, x,y);
}