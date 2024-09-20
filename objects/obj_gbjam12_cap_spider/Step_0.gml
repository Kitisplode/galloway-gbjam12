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
}

// Inherit the parent event
event_inherited();

if (!paused)
{
	if (is_on_ground)
	{
		if (direction_input > -1)
		{
			if (r3_norm(velocity) <= 1)
			{
				r3_zero_out(velocity);
				if (r3_parallel(up_vector, [0,1,0]))
				{
					var _sign = 0;
					if (direction_input < 90 || direction_input > 270) _sign = 1;
					else if (direction_input > 90 && direction_input < 270) _sign = -1;
					velocity[0] = _sign * spider_speed;
				}
				if (r3_parallel(up_vector, [1,0,0]))
				{
					var _sign = 0;
					if (direction_input > 0 && direction_input < 180) _sign = -1;
					else if (direction_input > 180 && direction_input < 360) _sign = 1;
					velocity[1] = _sign * spider_speed;
				}
			}
		}
		else
		{
			r3_zero_out(velocity);
		}
	}
	
	if (collisions_this_frame[0] || collisions_this_frame[1])
	{
		scr_obj_gbjam12_en_spider_on_wall_collision();
	}
}