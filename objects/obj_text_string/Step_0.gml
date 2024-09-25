/// @description Insert description here
// You can write your code in this editor

if (!finalized_setup)
{
	finalized_setup = true;
	// Set the initial point for the cursor based on the halign and valign.
	draw_set_font(font);
	if (halign == fa_center)
		cursor_pos_x = -string_width(text) / 2 * scale;
	else if (halign == fa_right)
		cursor_pos_x = -string_width(text) * scale;
}

event_inherited();

if (text_current_position >= string_length(text) + 1)
{
	finished_typing = true;
}

characters_typed = ds_list_size(list_characters);

if (!global.paused || not_affected_by_pause)
{
	if (start_timer <= 0)
	{
		// Type out text.
		var temp_text_length = string_length(text) + 1.1;
		if (text_type_rate != 0 && text_current_position < temp_text_length)
		{
			// Type out characters
			var temp_text_previous_position = text_current_position;
			// If we have a positive typing rate, type out that many characters.
			if (text_type_rate > 0)
				text_current_position += text_type_rate;
			// Otherwise just type out the whole string.
			else
				text_current_position = temp_text_length;
			// Constrain the position to the text length.
			if (text_current_position > temp_text_length)
				text_current_position = temp_text_length;
			
			// Create text objects for each of the characters that should have been typed in this frame.
			var temp_did_we_type = false;
			for (var i = floor(temp_text_previous_position); i < floor(text_current_position); i += 1)
			{
				// If we're past the text length already, break out.
				if (i > temp_text_length)
					break;
				// Extract the character from the string.
				var temp_text = string_copy(text, i, 1);
				// If we have a control character, do the stuff we need to do with that.
				// Otherwise, type out the next character in the string.
				temp_did_we_type = true;
				var temp_text_ID = instance_create_depth(x + cursor_pos_x, y + cursor_pos_y, depth, obj_text);
				temp_text_ID.text = temp_text;
				temp_text_ID.font = font;
				//temp_text_ID.halign = halign;
				//temp_text_ID.valign = valign;
				temp_text_ID.image_blend = image_blend;
				temp_text_ID.scale = scale;
				temp_text_ID.draw_gui = draw_gui;
				ds_list_add(list_characters, temp_text_ID);
				// Move the cursor
				cursor_pos_x += string_width(temp_text_ID.text) * scale;
			}
		
			// If we typed anything, play a sound
			if (temp_did_we_type && text_type_sound_ID > -1)
			{
				play_sound(text_type_sound_ID, 5, 0, 1, 1,0);
			}
		}
	
		// Handle the destroy timer.
		if (destroy_timer > -1)
		{
			if (!destroy_timer_wait || (destroy_timer_wait && text_current_position >= temp_text_length))
			{
				if (destroy_timer > 0)
				{
					destroy_timer -= scr_get_tick_length();
				}
				if (destroy_timer <= 0)
				{
					destroy_timer = -1;
					// Destroy the object only if we don't have a fade rate set.
					if (fade_rate <= 0)
					{
						instance_destroy();
						exit;
					}
				}
			}
		}
		// Once the destroy timer is up, start fading away.
		else
		{
			if (fade_rate > 0)
			{
				image_alpha -= fade_rate * scr_get_tick_length();
				if (image_alpha <= 0)
				{
					image_alpha = 0;
					instance_destroy();
					exit;
				}
				update_characters = true;
			}
		}
	
		if (update_characters || velocity[0] != 0 || velocity[1] != 0)
		{
			for (var i = 0; i < ds_list_size(list_characters); i += 1)
			{
				var _temp_character_ID = ds_list_find_value(list_characters, i);
				if (!instance_exists(_temp_character_ID)) continue;
				_temp_character_ID.flash_rate = flash_rate;
				_temp_character_ID.flash_alpha = flash_alpha;
				_temp_character_ID.image_alpha = image_alpha;
				_temp_character_ID.velocity[0] = velocity[0];
				_temp_character_ID.velocity[1] = velocity[1];
			}
			update_characters = false;
		}
	}
	else
		start_timer -= scr_get_tick_length();
}

// Check to see if all the characters are offscreen or not.
string_is_off_screen = true;
for (var i = 0; i < ds_list_size(list_characters); i += 1)
{
	var _temp_character_ID = ds_list_find_value(list_characters, i);
	if (!instance_exists(_temp_character_ID)) continue;
	if (!scr_check_off_screen(_temp_character_ID, 0))
	{
		string_is_off_screen = false;
		break;
	}
}