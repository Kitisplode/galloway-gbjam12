/// @description Insert description here
// You can write your code in this editor

var _temp_blend = image_blend;

if (damage_timer > 0)
{
	if (!paused) damage_timer -= scr_get_tick_length();
	image_blend = damage_color;
}
else
{
	image_blend = c_white;
}

// Inherit the parent event
event_inherited();

image_blend = _temp_blend;