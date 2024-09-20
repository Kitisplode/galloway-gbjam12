/// @description Update camera

// Update target
if (instance_exists(follow))
{
	x_to = follow.x;
	y_to = follow.y;
}
else
{
	x = 80;
	y = 72;
}

// Update camera position
//x += (xTo - x) / 15;
//y += (yTo - y) / 15;

// Keep camera center inside room
x = clamp(x_to - view_width_half, 
global.active_room.x - TILE_SIZE, 
global.active_room.x + global.active_room.sprite_width +TILE_SIZE - view_width_half*2);
y = clamp(y_to - view_height_half, 
global.active_room.y - TILE_SIZE, 
global.active_room.y + global.active_room.sprite_height +TILE_SIZE - view_height_half*2);

// Update screenshake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);

shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));

// Set camera position
camera_set_view_pos(cam, 
lerp(camera_get_view_x(cam),x,0.2), 
lerp(camera_get_view_y(cam),y,0.2));