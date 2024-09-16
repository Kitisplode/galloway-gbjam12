/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	if (phase == 0)
	{
		if (instance_exists(creator_ID) && creator_ID.holding_a)
		{
			if (creator_ID.direction_input > -1)
			{
				velocity[0] += cos(degtorad(creator_ID.direction_input)) * 30;
				velocity[1] -= sin(degtorad(creator_ID.direction_input)) * 30;
			}
		}
		timer -= scr_get_tick_length();
		if (timer <= 0) phase = 1;
	}
	else if (phase == 1)
	{
		velocity[0] *= 0.8;
		velocity[1] *= 0.8;
		if (r2_norm(velocity) <= 50)
		{
			phase = 2;
			timer = 0.25;
		}
	}
	else if (phase == 2)
	{
		velocity[0] *= 0.9;
		velocity[1] *= 0.9;
		timer -= scr_get_tick_length();
		if (timer <= 0) phase = 3;
	}
	else if (phase == 3)
	{
		if (instance_exists(creator_ID))
		{
			var _temp_dir = point_direction(x,y, creator_ID.x,creator_ID.y);
			velocity[0] += cos(degtorad(_temp_dir)) * 50;
			velocity[1] -= sin(degtorad(_temp_dir)) * 50;
		}
	}
}

// Inherit the parent event
event_inherited();