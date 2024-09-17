/// @description Insert description here
// You can write your code in this editor

if (surface_id == -1 || !surface_exists(surface_id))
{
	surface_id = surface_create(256, 256);
}

if (surface_exists(surface_id))
{
	surface_set_target(surface_id);
	draw_clear_alpha(c_black,1);
	
	for (var _i = 0; _i < ds_list_size(list_lights); _i++)
	{
		var _temp_value = ds_list_find_value(list_lights, _i);
		var _temp_id = _temp_value._id;
		if (!instance_exists(_temp_id)) continue;
		if (_temp_value._light > 0)
		{
			gpu_set_blendequation(bm_eq_subtract);
			draw_circle_color(_temp_id.x-1, _temp_id.y - _temp_id.z,
							_temp_value._light + 2, c_dkgrey,c_dkgrey, 0);
			draw_circle_color(_temp_id.x-1, _temp_id.y - _temp_id.z,
							_temp_value._light, c_ltgrey,c_ltgrey, 0);
			gpu_set_blendequation(bm_eq_add);
		}
		draw_sprite_ext(_temp_id.sprite_index, _temp_id.anim_frame,
						_temp_id.x, _temp_id.y - _temp_id.z,
						_temp_id.image_xscale,_temp_id.image_yscale,
						_temp_id.image_angle, c_white, _temp_id.image_alpha);
	}
	
	surface_reset_target();
	
	draw_set_alpha(image_alpha);
	draw_surface(surface_id,
				camera_get_view_x(view_get_camera(0)),
				camera_get_view_y(view_get_camera(0)));
	draw_set_alpha(1);
}