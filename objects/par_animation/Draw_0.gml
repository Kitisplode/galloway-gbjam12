if (draw_gui) exit;

// Adjust the y position to draw according to the current z level.
var _temp_y = position[1];
if (draw_2d_z)
{
	_temp_y = position[1] - position[2];
	depth = -(position[2] + z_height);
	//depth = -position[1] * 100 - position[2];
}

draw_sprite_ext(sprite_index, anim_frame,
				position[0] + shake[0], _temp_y + shake[1],
				image_xscale + pump[0], image_yscale + pump[1],
				image_angle, image_blend, image_alpha);