/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	if (stunned)
	{
		sparkle_index = spr_gb12_ef_dizzy;
		sparkle_anim_speed = 0;
		if (stunned_timer <= 0) stunned_timer = stunned_time;
		else
		{
			stunned_timer -= scr_get_tick_length();
			if (stunned_timer <= 0)
			{
				stunned = false;
				sparkle_index = -1;
			}
		}
	}
	
	if (normal_movement)
	{
		if (hurt_timer > 0)
		{
			hurt_timer -= scr_get_tick_length();
			if (hurt_timer <= 0) r3_zero_out(velocity);
		}
		else
		{
			velocity[0] *= friction_ground;
			velocity[1] *= friction_ground;
		}
	}
}

// Inherit the parent event
event_inherited();

if (!paused)
{
	if (position[2] < -1 || z < -1)
	{
		play_sound(snd_gbjam12_player_fall, 1, 0, 0.5, 0.5,0);
		var _temp_id = instance_create_depth(x,y, depth, obj_gbjam12_ef_enemy_fall);
		_temp_id.sprite_index = sprite_index;
		instance_destroy();
	}
}