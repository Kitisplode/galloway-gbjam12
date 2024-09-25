/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!init)
{
	event_user(0);
	init = true;
}

// If we don't have any strings, just stop now.
if (ds_list_size(string_list) <= 0)
{
	instance_destroy();
	exit;
}

// If we haven't made all of our string objects yet, try to make the next one.
if (ds_list_size(string_list) != ds_list_size(string_obj_list))
{
	// Store what will be the index of the next string object.
	var temp_string_obj_index = ds_list_size(string_obj_list);
	// If we don't have any string objects, then we should definitely try to make one.
	var temp_make_new_string = ds_list_empty(string_obj_list);
	// Otherwise, find out if the latest string object has finished typing yet.
	if (!temp_make_new_string)
	{
		// Grab the latest string object.
		var temp_string = ds_list_find_value(string_obj_list, ds_list_size(string_obj_list) - 1);
		temp_make_new_string = temp_string.finished_typing
	}
	// If we should make a new string object, do it!
	if (temp_make_new_string)
	{
		var temp_string = ds_list_find_value(string_list, temp_string_obj_index);
		var temp_string_obj = scr_create_text_string_ext(x + cursor_pos_x, y + cursor_pos_y,depth,
												temp_string, text_type_rate,
												font, halign, valign,
												scale, image_blend, -1);
		temp_string_obj.draw_gui = draw_gui;
		ds_list_add(string_obj_list, temp_string_obj);
		cursor_pos_y += text_height * scale;
	}
}
// If we've typed out all of our text, start the destroy timer!
else
{
	done_typing = true;
	if (destroy_timer > -1)
	{
		//if (!destroy_timer_wait || (destroy_timer_wait && text_current_position >= temp_text_length))
		{
			if (destroy_timer > 0)
			{
				destroy_timer -= scr_get_tick_length();	
			}
			if (destroy_timer <= 0)
			{
				destroy_timer = -1;
				// Destroy the object only if we don't have a fade rate set.
				//if (fade_rate <= 0)
				{
					instance_destroy();
					exit;
				}
			}
		}
	}
}

if (update_strings)
{
	for (var _i = 0; _i < ds_list_size(string_obj_list); _i++)
	{
		var _temp_id = ds_list_find_value(string_obj_list, _i);
		if (!instance_exists(_temp_id)) continue;
		_temp_id.text_type_rate = text_type_rate;
		_temp_id.update_characters = true;
	}
	update_strings = false;
}
