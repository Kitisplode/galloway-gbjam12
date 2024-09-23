/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!global.player_has_mask)
{
	image_alpha = 0;
}
else
{
	if (active_room == id)
	{
		if (instance_exists(obj_room_region))
		{
			var _temp_id = instance_nearest(x,y, obj_room_region);
			//if (_temp_id != noone) active_room = _temp_id;
			active_room = _temp_id;
		}
	}

	if (active_room != id && instance_exists(active_room))
	{
		if (active_room != global.active_room)
		{
			if (!first_check)
			{
				image_alpha = 0;
				first_check = true;
			}
			if (image_alpha > 0)
			{
				image_alpha = max(image_alpha - scr_get_tick_length() * 2, 0);
			}
		}
		else
		{
			if (!first_check)
			{
				image_alpha = 1.1;
				first_check = true;
			}
			if (image_alpha < 1.1)
			{
				image_alpha = min(image_alpha + scr_get_tick_length() * 2, 1.1);
			}
		}
	}
}