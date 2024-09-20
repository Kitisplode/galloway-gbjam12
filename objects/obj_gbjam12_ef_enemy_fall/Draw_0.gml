/// @description Insert description here
// You can write your code in this editor

var _paused = scr_Is_Paused(TRANSITION_PAUSE.ANIMATIONS);
if (!_paused)
{
	scale -= scr_get_tick_as_percent(shrink_time);
	image_xscale = floor(scale * 4) / 4;
	image_yscale = floor(scale * 4) / 4;
	if (scale <= 0)
	{
		instance_destroy();
		exit;
	}
}

// Inherit the parent event
event_inherited();

