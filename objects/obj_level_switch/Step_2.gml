/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	if (button_pushed_previous != button_pushed)
	{
		if (button_pushed) play_sound(snd_gbjam12_button_on, 2, 0, 0.8, 1,0);
		else play_sound(snd_gbjam12_button_off, 2, 0, 0.8, 1,0);
		ds_map_replace(global.map_switches, switch_name, button_pushed);
	}
	else
	{
		var _temp_value = ds_map_find_value(global.map_switches, switch_name);
		if (!is_undefined(_temp_value) && _temp_value != button_pushed)
		{
			button_pushed = _temp_value;
		}
	}
}

// Inherit the parent event
event_inherited();

