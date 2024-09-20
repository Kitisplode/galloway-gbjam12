/// @description Insert description here
// You can write your code in this editor

if (!instance_exists(par_transition))
{
	timer -= scr_get_tick_length();
	if (phase == 0)
	{
		if (point_distance(position[0],position[1], 80,72) > 1)
		{
			position[0] = lerp(position[0], 80, 0.05);
			position[1] = lerp(position[1], 72, 0.05);
		}
		else
		{
			position[0] = 80;
			position[1] = 72;
			phase = 1;
			timer = wait_time_1;
		}
	}
	else if (phase == 1)
	{
		if (timer <= 0)
		{
			phase = 2;
			sprite_index = spr_gb12_player_dead;
			anim_frame = 0;
			anim_speed = 0.12;
			anim_loop = false;
			//timer = wait_time_2;
			play_sound(snd_gbjam12_player_dead, 1, 0, 0.8, 1,0);
		}
	}
	else if (phase == 2)
	{
		if (anim_looped != 0)
		{
			phase = 3;
			sound_index = snd_gbjam12_button_off;
			sound_pitch = 0.5;
			sound_time = 0.35;
			sounds_total = 7;
			sound = sounds_total;
			sound_timer = 0;
			timer = wait_time_3;
		}
	}
	else if (phase == 3)
	{
		if (timer <= 0)
		{
			phase = 4;
			instance_create_depth(position[0],position[1], depth - 1, obj_gbjam12_ef_gameover_reaper);
		}
	}
	else if (phase == 4)
	{
		if (instance_exists(obj_gbjam12_ef_gameover_reaper))
		{
			if (obj_gbjam12_ef_gameover_reaper.image_alpha >= 0.5)
			{
				phase = 5;
				play_sound(snd_gbjam12_player_cap, 1, 0, 4, 0.7,0);
			}
		}
	}
	else if (phase == 5)
	{
		if (instance_exists(obj_gbjam12_ef_gameover_reaper))
		{
			if (obj_gbjam12_ef_gameover_reaper.fade_in)
			{
				var _temp_id = scr_create_text_string_ext(80, 100, OBJECT_DEPTHS.TRANSITION - 3,
															"GAME OVER", scr_get_tick_length() * 3,
															global.font_01, fa_center, fa_middle,
															1, c_white, -1);
				instance_destroy();
			}
		}
	}
}

if (sound > 0)
{
	sound_timer -= scr_get_tick_length();
	if (sound_timer <= 0)
	{
		play_sound(sound_index, 1, 0, sound / sounds_total, sound_pitch,0);
		sound--;
		if (sound > 1) sound_timer = sound_time;
	}
}