/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	if (instance_exists(obj_base_player))
	{
		// Slowly approach the player.
		var _player = obj_base_player;
		var _temp_direction = point_direction(position[0],position[1], _player.position[0],_player.position[1]);
		var _temp_angle_diff = angle_difference(direction, _temp_direction);
		direction += sign(_temp_angle_diff) * direction_accel;
		velocity[0] += cos(degtorad(direction)) * accel;
		velocity[1] -= sin(degtorad(direction)) * accel;
	}
}

// Inherit the parent event
event_inherited();

