/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	// If the player gets close enough, start following them!
	if (instance_exists(obj_base_player))
	{
		if (point_distance(x,y, obj_base_player.x,obj_base_player.y) <= ai_follow_range)
		{
			ai_notices_player = true;
		}
	}
	
	if (hurt_timer <= 0)
	{
		if (action == 0)
		{
			ai_timer -= scr_get_tick_length();
			// This enemy waits a short time, picks a direction to move in, then moves that way, then waits again.
			// During phase 0, wait for the timer to finish.
			if (ai_phase == 0)
			{
				r3_zero_out(velocity);
				if (ai_timer <= 0)
				{
					ai_phase = 1;
					ai_timer = random_range(ai_move_time / 3, ai_move_time);
					// Pick a direction.
					// If the enemy has not noticed the player, otherwise, pick a direction randomly.
					direction_facing = irandom(3);
					// Otherwise, pick the direction that is closest to the player.
					if (ai_notices_player && instance_exists(obj_base_player))
					{
						direction_facing = scr_snap_dir_to_cardinal(point_direction(x,y, obj_base_player.x,obj_base_player.y)) / 90;
					}
					var _temp_direction = direction_facing * 90;
					velocity[0] = cos(degtorad(_temp_direction)) * 40;
					velocity[1] = -sin(degtorad(_temp_direction)) * 40;
				}
			}
			// During phase 1, move in the direction we're facing.
			else if (ai_phase == 1)
			{
				if (ai_timer < 0)
				{
					ai_phase = 0;
					ai_timer = ai_pick_direction_time;
				}
			}
			
			// If a player shot is nearby, try to dodge it by rolling away.
			if (ai_roll_timer > 0)
			{
				ai_roll_timer -= scr_get_tick_length();
			}
			if (instance_exists(obj_shot_player) && ai_roll_timer <= 0)
			{
				var _temp_id = instance_nearest(x,y, obj_shot_player);
				var _temp_distance = point_distance(x,y, _temp_id.x,_temp_id.y);
				if (_temp_distance < ai_roll_distance && _temp_distance > ai_roll_distance_short)
				{
					action = 1;
					play_sound(snd_gbjam12_skeleton_roll, 2, 0, 0.75, 1, 0.1);
					var _temp_direction = degtorad(scr_snap_dir_to_cardinal(point_direction(x,y, _temp_id.x,_temp_id.y)));
					velocity[0] = -cos(_temp_direction) * roll_speed;
					velocity[1] = sin(_temp_direction) * roll_speed;
					direction_facing = scr_snap_dir_to_cardinal(point_direction(0,0, velocity[0],velocity[1])) / 90;
					ai_phase = 0;
					ai_timer = ai_pick_direction_time / 2;
					ai_roll_timer = ai_roll_time;
				}
			}
		}
	}
}

// Inherit the parent event
event_inherited();

