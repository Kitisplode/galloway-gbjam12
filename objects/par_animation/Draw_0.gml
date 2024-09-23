if (draw_gui) exit;

// Adjust the y position to draw according to the current z level.
var _temp_y = position[1];
if (draw_2d_z)
{
	_temp_y = position[1] - position[2];
	depth = -position[1] * 10 -(position[2] + z_height);
	//depth = -position[1] * 100 - position[2];
}

if (sprite_exists(sprite_index))
{
	if (shader_outline)
	{
		shader_set(sh_outline);
		var _tex = sprite_get_texture(sprite_index, anim_frame);
		var _tex_w=texture_get_texel_width(_tex);
		var _tex_h=texture_get_texel_height(_tex);
		shader_set_uniform_f(outline_pixel_stage,_tex_w,_tex_h)
		shader_set_uniform_f(outline_thickness_stage, outline_thickness);
		shader_set_uniform_f(outline_color_stage, color_get_red(outline_color), color_get_green(outline_color), color_get_blue(outline_color),1.0)
	}
	draw_sprite_ext(sprite_index, anim_frame,
					position[0] + shake[0], _temp_y + shake[1],
					image_xscale + pump[0], image_yscale + pump[1],
					image_angle, image_blend, image_alpha);
	if (shader_outline)
	{
		shader_reset();
	}
}