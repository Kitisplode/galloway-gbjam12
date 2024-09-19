/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	if (is_on_ground && !is_on_ground_previous)
	{
		r3_zero_out(velocity);
	}
	
	if (!is_on_ground && is_on_ground_previous)
	{
		scr_obj_gbjam12_en_spider_on_no_wall_collision();
	}
	
	if (stunned) shot_timer = shot_time;
	
	if (shot_timer > 0)
	{
		shot_timer -= scr_get_tick_length();
	}
	else if (collision_line(x,y, x + up_vector[0] * 160,y + up_vector[1] * 144, obj_base_player, 0, 1)
			&& !instance_exists(obj_gbjam12_en_spider_shot))
	{
		var _temp_id = instance_create_depth(x + up_vector[0] * 4,y + up_vector[1] * 4, depth + 1, obj_gbjam12_en_spider_shot);
		var _temp_direction = point_direction(0,0, up_vector[0],up_vector[1]);
		_temp_id.velocity[0] = cos(degtorad(_temp_direction)) * shot_speed;
		_temp_id.velocity[1] = -sin(degtorad(_temp_direction)) * shot_speed;
		_temp_id.creator_id = id;
		shot_timer = shot_time;
	}
}

// Inherit the parent event
event_inherited();

if (!paused)
{
	if (is_on_ground && r3_norm(velocity) <= 1 && !stunned)
	{
		r3_zero_out(velocity);
		r3_rotate(up_vector, -90, velocity);
		r3_scale(velocity, spider_speed, velocity);
	}
	
	if (collisions_this_frame[0] || collisions_this_frame[1])
	{
		scr_obj_gbjam12_en_spider_on_wall_collision();
	}
}