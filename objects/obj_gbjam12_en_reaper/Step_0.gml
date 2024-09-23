/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	if (instance_exists(obj_base_player))
	{
		// Slowly approach the player.
		var _player = obj_base_player;
		var _temp_direction = point_direction(position[0],position[1], _player.position[0],_player.position[1]);
		var _temp_angle_diff = -angle_difference(direction, _temp_direction);
		direction += sign(_temp_angle_diff) * min(direction_accel / max(r3_norm(velocity), 1) * 100, abs(_temp_angle_diff));
		velocity[0] += cos(degtorad(direction)) * accel;
		velocity[1] -= sin(degtorad(direction)) * accel;
	}
}

// Inherit the parent event
event_inherited();

if (!paused)
{
	var _temp_view_x = camera_get_view_x(view_get_camera(0));
	var _temp_view_y = camera_get_view_y(view_get_camera(0));
	if (position[0] > _temp_view_x + 210 && velocity[0] > 0)
		position[0] = _temp_view_x - 8;
	else if (position[0] < _temp_view_x - 8 && velocity[0] < 0)
		position[0] = _temp_view_x + 210;
	if (position[1] > _temp_view_y + 184 && velocity[1] > 0)
		position[1] = _temp_view_y - 8;
	else if (position[1] < _temp_view_y - 8 && velocity[1] < 0)
		position[1] = _temp_view_y + 184;
}