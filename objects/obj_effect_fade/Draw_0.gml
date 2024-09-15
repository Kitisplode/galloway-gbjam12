/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	image_alpha -= scr_get_tick_as_percent(fade_time);
	if (image_alpha <= 0)
	{
		instance_destroy();
		exit;
	}
}

// Inherit the parent event
event_inherited();

