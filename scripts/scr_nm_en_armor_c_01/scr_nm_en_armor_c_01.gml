// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_nm_en_armor_c_01_step_behavior()
{
	if (timer > 0) timer -= scr_get_tick_length();
	// At the start, move onto the edge of the screen.
	if (steps == 0)
	{
		if (target_position[0] > 0 || target_position[1] > 0)
		{
			movement_enabled = false;
			position[0] = lerp(position[0], target_position[0], 0.05);
			position[1] = lerp(position[1], target_position[1], 0.05);
			if (point_distance(position[0],position[1], target_position[0],target_position[1]) < 1)
			{
				position[0] = target_position[0];
				position[1] = target_position[1];
				target_position[0] = 0;
				target_position[1] = 0;
			}
		}
		else
		{
			movement_enabled = true;
			steps = 1;
			timer = wait_time;
		}
	}
	// Wait a short time, then start moving along the edge of the screen.
	else if (steps == 1)
	{
		if (timer <= 0)
		{
			if (image_angle == 0 || image_angle == 180)
			{
				velocity[1] = choose(-50,50);
			}
			else
			{
				velocity[0] = choose(-50,50);
			}
			steps = 2;
			timer = lunge_time;
		}
	}
	// If the player passes in front of the enemy, stop and wait to lunge.
	else if (steps == 2)
	{
		if (timer <= 0)
		{
			if (collision_line(x,y, x + cos(degtorad(image_angle)) * 180, y - sin(degtorad(image_angle)) * 180, obj_nm_player, 1,1))
			{
				steps = 3;
				timer = charge_time;
				velocity[0] = 0;
				velocity[1] = 0;
				bounces_off_walls = false;
				claws_open = true;
				play_sound(snd_enemy_charge_start, 2, false, 1, 1,0);
			}
		}
	}
	// After waiting a bit, lunge.
	else if (steps == 3)
	{
		shake[0] = random_range(-1,1);
		shake[1] = random_range(-1,1);
		if (timer <= 0)
		{
			velocity[0] = cos(degtorad(image_angle)) * total_max_speed;
			velocity[1] = -sin(degtorad(image_angle)) * total_max_speed;
			steps = 4;
			play_sound(snd_enemy_charge, 2, false, 1, 1,0);
		}
	}
	// While lunging, if we leave the screen, reset.
	else if (steps == 4)
	{
		if (bbox_right < 0 || bbox_left > room_width || bbox_bottom < 0 || bbox_top > room_height)
		{
			event_user(2);
			bounces_off_walls = true;
			steps = 0;
			claws_open = false;
		}
	}
}