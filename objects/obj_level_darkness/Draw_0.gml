/// @description Insert description here
// You can write your code in this editor

if (surface_id_1 == -1 || !surface_exists(surface_id_1))
{
	surface_id_1 = surface_create(256, 256);
}

if (surface_id_2 == -1 || !surface_exists(surface_id_2))
{
	surface_id_2 = surface_create(256, 256);
}

if (surface_exists(surface_id_1) && surface_exists(surface_id_2))
{
	if (!paused)
	{
		light_cycle = (light_cycle + 10) mod 360;
	}
	
	surface_set_target(surface_id_1);
	draw_clear_alpha(c_black,1);
	surface_reset_target();
	//surface_set_target(surface_id_2);
	//draw_clear_alpha(c_black,1);
	//surface_reset_target();
	window_set_caption(ds_list_size(list_lights));
	
	for (var _i = 0; _i < ds_list_size(list_lights); _i++)
	{
		var _temp_value = ds_list_find_value(list_lights, _i);
		var _temp_id = _temp_value._id;
		if (!instance_exists(_temp_id))
		{
			ds_list_delete(list_lights, _i);
			_i--;
			continue;
		}
		var _temp_x = _temp_id.position[0] - (sprite_get_xoffset(_temp_id.sprite_index) + _temp_id.sprite_width / 2 * -_temp_id.image_xscale) - camera_get_view_x(view_get_camera(0));
		var _temp_y = _temp_id.position[1] - sprite_get_yoffset(_temp_id.sprite_index) + _temp_id.sprite_height / 2 - camera_get_view_y(view_get_camera(0));
		if (_temp_value._light > 0)
		{
			gpu_set_blendequation(bm_eq_subtract);
			
			draw_set_alpha(1);
			surface_set_target(surface_id_1);
			draw_circle_color(_temp_x-1, _temp_y - _temp_id.z,
							_temp_value._light * 1 + abs(round(cos(degtorad(light_cycle)) * 3)),
							c_white,c_white, 0);
			surface_reset_target();
			
			//draw_set_alpha(1);
			//surface_set_target(surface_id_2);
			//draw_circle_color(_temp_x-1, _temp_y - _temp_id.z,
			//				_temp_value._light + abs(round(cos(degtorad(light_cycle)) * 1)),
			//				c_white,c_white, 0);
			//surface_reset_target();
			
			draw_set_alpha(1);
			gpu_set_blendequation(bm_eq_add);
		}
		
		//surface_set_target(surface_id_1);
		//draw_sprite_ext(_temp_id.sprite_index, _temp_id.anim_frame,
		//				_temp_id.position[0], _temp_id.position[1] - _temp_id.position[2],
		//				_temp_id.image_xscale,_temp_id.image_yscale,
		//				_temp_id.image_angle, c_white, _temp_id.image_alpha);
		//surface_reset_target();
		
		//surface_set_target(surface_id_2);
		//draw_sprite_ext(_temp_id.sprite_index, _temp_id.anim_frame,
		//				_temp_id.position[0], _temp_id.position[1] - _temp_id.position[2],
		//				_temp_id.image_xscale,_temp_id.image_yscale,
		//				_temp_id.image_angle, c_white, _temp_id.image_alpha);
		//surface_reset_target();
	}
	
	if (image_alpha > 0)
	{
		draw_set_alpha(image_alpha);
		draw_surface(surface_id_1,
					camera_get_view_x(view_get_camera(0)),
					camera_get_view_y(view_get_camera(0)));
		//draw_surface(surface_id_2,
		//			camera_get_view_x(view_get_camera(0)),
		//			camera_get_view_y(view_get_camera(0)));
		draw_set_alpha(1);
	}
}