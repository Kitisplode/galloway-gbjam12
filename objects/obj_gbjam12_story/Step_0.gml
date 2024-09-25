/// @description Insert description here
// You can write your code in this editor
if (!paused)
{
	if (!song_started)
	{
		scr_audio_play_song_no_fade(mus_gbjam12_cutscene, false);
		song_started = true;
	}
	
	var _button_pressed = input_check_pressed("a") || input_check_pressed("b");
	
	timer -= scr_get_tick_length();
	if (phase == 0)
	{
		if (timer <= 0)
		{
			phase = 1;
			paragraph = scr_create_text_paragraph_ext(text_x,text_y, depth - 1,
										"The accursed\n Mask of the\n Grim Reaper...\n",
										text_type_rate,
										global.font_02,
										fa_left, fa_top,
										1, c_white, text_destroy_timer);
			paragraph.fade_rate = text_fade_rate;
		}
	}
	else if (phase == 1)
	{
		if (paragraph != id && !instance_exists(paragraph))
		{
			phase = 2;
			timer = time_2;
		}
	}
	else if (phase == 2)
	{
		if (timer <= 0)
		{
			phase = 3;
			paragraph = scr_create_text_paragraph_ext(text_x,text_y, depth - 1,
										"Upon its theft,\n a terrible plague\n has befallen\n the kingdom.",
										text_type_rate,
										global.font_02,
										fa_left, fa_top,
										1, c_white, text_destroy_timer);
			paragraph.fade_rate = text_fade_rate;
		}
	}
	else if (phase == 3)
	{
		if (paragraph != id && !instance_exists(paragraph))
		{
			phase = 4;
			timer = time_2;
		}
	}
	else if (phase == 4)
	{
		if (timer <= 0)
		{
			phase = 5;
			paragraph = scr_create_text_paragraph_ext(text_x,text_y, depth - 1,
										"Using its powers\n of possession,\n I must venture to\n the Reaper's crypt\n and return it...",
										text_type_rate,
										global.font_02,
										fa_left, fa_top,
										1, c_white, text_destroy_timer);
			paragraph.fade_rate = text_fade_rate;
		}
	}
	else if (phase == 5)
	{
		if (paragraph != id && !instance_exists(paragraph))
		{
			phase = 6;
			timer = time_2;
		}
	}
	else if (phase == 6)
	{
		if (timer <= 0)
		{
			phase = 7;
			paragraph = scr_create_text_paragraph_ext(160 - text_x,text_y, depth - 1,
										"\n\n\n...And somehow,\n escape with\n my life.",
										text_type_rate,
										global.font_02,
										fa_right, fa_top,
										1, c_white, text_destroy_timer);
			paragraph.fade_rate = text_fade_rate;
		}
	}
	else if (phase == 7)
	{
		if (paragraph != id && !instance_exists(paragraph))
		{
			phase = 8;
		}
	}
	else if (phase == 8)
	{
		scr_audio_play_song_fade(-1,1);
		scr_transition_fade_to_color(next_room, 1);
	}
	
	if (paragraph != id && instance_exists(paragraph))
	{
		if (_button_pressed)
		{
			if (!paragraph.done_typing)
			{
				paragraph.text_type_rate = 1;
				paragraph.update_strings = true;
			}
			else
			{
				paragraph.destroy_timer = 0.01;
				timer = 0.01;
			}
		}
	}
	
	if (phase > 0)
	{
		if (image_alpha > 0.5)
		{
			image_alpha -= scr_get_tick_as_percent(1);
		}
	}
	
	if (input_check_pressed("start"))
	{
		phase = 8;
	}
}

//var _paragraph = scr_create_text_paragraph_ext(8,8, depth - 1,
//										"The accursed\n Mask of the\n Grim Reaper...\nStolen from its owner, a plague has befallen the kingdom...\nUsing its powers of possession, I must venture to the Reaper's crypt and return it...\n                                                                        \n...And somehow, escape with my life.",
//										-1,//scr_get_tick_length() * 5,
//										global.font_01,
//										fa_left, fa_top,
//										1, c_white, -1);