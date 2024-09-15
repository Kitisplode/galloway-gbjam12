// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_nm_en_armor__boss_01_step_phase_1()
{
	if (timer > 0) timer -= scr_get_tick_length();
	// Behavior for when both claws are still alive.
	if (ds_list_size(list_parts) > 0)
	{
		// At the start, move onto the edge of the screen.
		if (steps == 0)
		{
			movement_enabled = false;
			position[0] = lerp(position[0], target_position[0], 0.025);
			position[1] = lerp(position[1], target_position[1], 0.025);
			if (point_distance(position[0],position[1], target_position[0],target_position[1]) < 1)
			{
				position[0] = target_position[0];
				position[1] = target_position[1];
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
					velocity[1] = choose(-35,35);
				}
				else
				{
					velocity[0] = choose(-35,35);
				}
				steps = 2;
				timer = rove_time;
				claws_open = true;
			}
		}
		// Move back and forth on the edge of the screen.
		else if (steps == 2)
		{
			steps = 0;
			if (velocity[0] < 0 && position[0] <= bounds_left) steps = 1;
			else if (velocity[0] > 0 && position[0] >= room_width - bounds_right) steps = 2;
			if (velocity[1] < 0 && position[1] <= bounds_top) steps = 3;
			else if (velocity[1] > 0 && position[1] >= room_height - bounds_bottom) steps = 4;
			if (steps > 0)
			{
				velocity[0] *= -1;
				velocity[1] *= -1;
			}
			steps = 2;
			if (timer <= 0)
			{
				if (abs(position[0]-(room_width / 2)) < 1)
				{
					steps = 3;
					position[0] = room_width / 2;
				}
				else if (abs(position[1]-(room_height / 2)) < 1)
				{
					steps = 3;
					position[1] = room_height / 2;
				}
				if (steps == 3)
				{
					velocity[0] = 0;
					velocity[1] = 0;
					timer = wait_time;
				}
				claws_open = false;
			}
		}
		// Just wait a short time before starting to charge.
		else if (steps == 3)
		{
			if (timer <= 0)
			{
				steps = 4;
				timer = 0;
			}
		}
		// Charge up the claws, then attack.
		else if (steps == 4)
		{
			if (timer <= 0)
			{
				steps = 5;
				for (var _i = 0; _i < ds_list_size(list_parts); _i += 1)
				{
					var _temp_id = ds_list_find_value(list_parts, _i);
					if (instance_exists(_temp_id))
					{
						_temp_id.attack = 1;
					}
				}
			}
		}
		// Wait for the claws to finish attacking before continuing from the start again.
		else if (steps == 5)
		{
			var _claws_done = 0;
			for (var _i = 0; _i < ds_list_size(list_parts); _i += 1)
			{
				var _temp_id = ds_list_find_value(list_parts, _i);
				if (instance_exists(_temp_id))
				{
					if (_temp_id.attack == 0) _claws_done += 1;
				}
				else _claws_done += 1;
			}
			if (_claws_done == ds_list_size(list_parts)) steps = 0;
		}
	}
}