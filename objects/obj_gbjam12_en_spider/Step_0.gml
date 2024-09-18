/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	if (is_on_ground && !is_on_ground_previous)
	{
		r3_zero_out(velocity);
		r3_rotate(up_vector, -90, velocity);
		r3_scale(velocity, spider_speed, velocity);
	
	}
	
	if (!is_on_ground && is_on_ground_previous)
	{
		scr_obj_gbjam12_en_spider_on_no_wall_collision();
	}
}

// Inherit the parent event
event_inherited();

if (!paused)
{
	if (collisions_this_frame[0] || collisions_this_frame[1])
	{
		scr_obj_gbjam12_en_spider_on_wall_collision();
	}
}