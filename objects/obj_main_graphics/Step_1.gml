/// @description Insert description here
// You can write your code in this editor

application_surface_draw_enable(!shaders_on);
if (shaders_on)
{
	if (input_check_pressed("select"))
	{
		current_palette = (current_palette + 1) mod palette_count;
		scr_set_gb_shader_colors(palette[current_palette,0],
							 palette[current_palette,1],
							 palette[current_palette,2],
							 palette[current_palette,3]);
	}
}