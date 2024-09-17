/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!paused)
{
	var _value = ds_map_find_value(global.map_switches, switch_name);
	if (!is_undefined(_value))
	{
		if (_value) state = 1;
		else state = 0;
	}
	
	if (state == 1)
	{
		visible = false;
		mask_index = msk_no_collision;
	}
	else
	{
		visible = true;
		mask_index = sprite_index;
	}
}