/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
//event_inherited();

var _temp_y = position[1] + shake[1];

// Adjust the y position to draw according to the current z level.
if (draw_2d_z)
{
	_temp_y = position[1] - position[2] - z_height + shake[1];
	depth = -position[1] * 100 - (position[2] + z_height);
	draw_set_alpha(image_alpha);
	draw_set_color(image_blend);
	draw_rectangle(bbox_left,bbox_top, bbox_right,bbox_bottom, 0);
	draw_set_color(c_white);
	draw_set_alpha(1);
}

draw_sprite_ext(sprite_index, anim_frame,
				position[0] + shake[0], _temp_y,
				image_xscale + pump[0], image_yscale + pump[1],
				image_angle, image_blend, image_alpha);