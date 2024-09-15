if (!draw_gui) exit;

draw_sprite_ext(sprite_index, anim_frame,
				position[0] + shake[0], position[1] + shake[1],
				image_xscale + pump[0], image_yscale + pump[1],
				image_angle, image_blend, image_alpha);