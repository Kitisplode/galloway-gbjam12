/// @description Fade in from color
image_alpha -= scr_get_tick_as_percent(fade_time);
if (image_alpha <= 0)
{
	image_alpha = 0;
	instance_destroy();
}