/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	// Loop through the pushables and see if any are touching the button.
	// If they are, set the button's switch to true.
	// Otherwise, set the button's switch to false.
	var _temp_button_pushed = button_pushed;
	button_pushed = false;
	for (var _i = 0; _i < ds_list_size(global.list_pushables); _i++)
	{
		var _colliding = false;
		var _temp_id = ds_list_find_value(global.list_pushables, _i);
		if (!instance_exists(_temp_id)) continue;
		if (!place_meeting(x,y, _temp_id)) continue;
		with (_temp_id)
		{
			_colliding = scr_Check_On_Top(_temp_id.position, other);
		}
		if (_colliding)
		{
			button_pushed = true;
			break;
		}
	}
	if (_temp_button_pushed != button_pushed)
	{
		if (button_pushed) play_sound(snd_gbjam12_button_on, 2, 0, 0.8, 1,0);
		else play_sound(snd_gbjam12_button_off, 2, 0, 0.8, 1,0);
		ds_map_replace(global.map_switches, switch_name, button_pushed);
	}
}

// Inherit the parent event
event_inherited();

