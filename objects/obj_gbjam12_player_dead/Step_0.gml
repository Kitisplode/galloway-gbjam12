/// @description Insert description here
// You can write your code in this editor

if (!instance_exists(par_transition))
{
	
	
	if (phase < 7)
	{
		if (scr_Input_Read(id_input, input_continue, 1)
		|| scr_Input_Read(id_input, input_continue_2, 1)
		|| scr_Input_Read(id_input, input_continue_3, 1))
		{
			phase = 8;
			sound = 0;
		}
	}
	
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
			sprite_index = spr_gb12_player_unmasked_dead;
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
			instance_create_depth(160,144, depth - 1, obj_gbjam12_ef_gameover_reaper);
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
				play_music(mus_gbjam12_game_over, 1, 0, 1, 1,0);
				visible = false;
				var _temp_id = scr_create_text_string_ext(160, 175, OBJECT_DEPTHS.TRANSITION - 3,
															"GAME OVER", scr_get_tick_as_percent(0.2),
															global.font_01, fa_center, fa_middle,
															1, c_white, -1);
				phase = 6;
				timer = wait_time_4;
			}
		}
	}
	else if (phase == 6)
	{
		if (timer <= 0)
		{
			var _temp_id = scr_create_text_string_ext(160, 195, OBJECT_DEPTHS.TRANSITION - 3,
														"PRESS START", -1,
														global.font_01, fa_center, fa_middle,
														1, c_white, -1);
			phase = 7;
		}
	}
	else if (phase == 7)
	{
		if (scr_Input_Read(id_input, input_continue, 1)
		|| scr_Input_Read(id_input, input_continue_2, 1)
		|| scr_Input_Read(id_input, input_continue_3, 1))
		{
			//scr_reset_game();
			scr_continue_game();
			instance_destroy();
			exit;
		}
	}
	else if (phase == 8)
	{
		if (!instance_exists(obj_gbjam12_ef_gameover_reaper))
		{
			var _temp_id = instance_create_depth(160,144, depth - 1, obj_gbjam12_ef_gameover_reaper);
			_temp_id.fade_in = true;
		}
		scr_create_text_string_ext(160, 175, OBJECT_DEPTHS.TRANSITION - 3,
									"GAME OVER", -1,
									global.font_01, fa_center, fa_middle,
									1, c_white, -1);
		scr_create_text_string_ext(160, 195, OBJECT_DEPTHS.TRANSITION - 3,
									"PRESS START", -1,
									global.font_01, fa_center, fa_middle,
									1, c_white, -1);
		visible = false;
		phase = 7;
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