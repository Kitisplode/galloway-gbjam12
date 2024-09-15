// Called within an animation object to change the sprite
function scr_Animation_Change_Sprite(_new_sprite)
{
	if (!sprite_exists(_new_sprite)) return false;
	if (sprite_index != _new_sprite)
	{
		anim_frame = 0;
		anim_looped = 0;
	}
	sprite_index = _new_sprite;
	//anim_speed = _anim_speed;
	return true;
}

function scr_set_gb_shader_colors(_color_100, _color_066, _color_033, _color_000)
{
	var _shd = sh_gameboy;
	
	var _unif_col_100 = shader_get_uniform(_shd, "col_100");
	var _unif_col_066 = shader_get_uniform(_shd, "col_066");
	var _unif_col_033 = shader_get_uniform(_shd, "col_033");
	var _unif_col_000 = shader_get_uniform(_shd, "col_000");
	
	shader_set(_shd);
	
	// Now we simply set the uniforms to the correct values!
	shader_set_uniform_f(_unif_col_100,
		color_get_red(_color_100)/255, color_get_green(_color_100)/255, color_get_blue(_color_100)/255);
		
	shader_set_uniform_f(_unif_col_066,
		color_get_red(_color_066)/255, color_get_green(_color_066)/255, color_get_blue(_color_066)/255);
		
	shader_set_uniform_f(_unif_col_033,
		color_get_red(_color_033)/255, color_get_green(_color_033)/255, color_get_blue(_color_033)/255);
		
	shader_set_uniform_f(_unif_col_000,
		color_get_red(_color_000)/255, color_get_green(_color_000)/255, color_get_blue(_color_000)/255);
	
	shader_reset();
}
