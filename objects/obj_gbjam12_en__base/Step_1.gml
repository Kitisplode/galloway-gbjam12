/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (obeys_room)
{
	if (active_room == id)
	{
		if (instance_exists(obj_room_region))
		{
			var _temp_id = instance_place(x,y, obj_room_region);
			if (_temp_id != noone) active_room = _temp_id;
		}
	}

	if (active_room != id && instance_exists(active_room))
	{
		if (active_room != global.active_room)
		{
			paused = true;
			visible = false;
		}
		else
		{
			visible = true;
		}
	}
}