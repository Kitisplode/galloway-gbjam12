/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (instance_exists(obj_room_region))
{
	var _temp_id = instance_place(x,y, obj_room_region);
	if (_temp_id != noone && _temp_id != global.active_room)
	{
		paused = true;
		visible = false;
	}
	else
	{
		visible = true;
	}
}