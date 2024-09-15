/// @description Fade out to a color
image_alpha += scr_get_tick_as_percent(fade_time);
if (image_alpha >= 1)
{
	image_alpha = 1;
	transition_state = TRANSITION_STATE.SWITCH;
}