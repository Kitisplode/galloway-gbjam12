/// @description Insert description here
// You can write your code in this editor

if (stunned)
{
	force_gravity = 0;
}

// Inherit the parent event
event_inherited();

if (!stunned)
{
	force_gravity = 30;
}

if (!paused)
{
	if (instance_exists(obj_base_player))
	{
		direction_aiming = scr_snap_dir_to_compass(point_direction(x,y, obj_base_player.x,obj_base_player.y));
	}
}