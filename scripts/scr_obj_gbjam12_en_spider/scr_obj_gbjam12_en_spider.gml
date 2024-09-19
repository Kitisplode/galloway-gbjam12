function scr_obj_gbjam12_en_spider_on_wall_collision()
{
	var _temp_angle = radtodeg(r3_get_angle_between(velocity, up_vector));
	if (_temp_angle == -1) return;
	//if (_temp_angle == -1 || abs(_temp_angle) >= 180) return;
	
	//_temp_angle = sign(_temp_angle) * 90;
	for (var _i = 0; _i < 3; _i++)
	{
		up_vector = r3_rotate(up_vector, _temp_angle);
		if (scr_par_physics_Check_On_Ground())
		{
			r3_rotate(velocity, _temp_angle * _i, velocity);
			break;
		}
	}
}

function scr_obj_gbjam12_en_spider_on_no_wall_collision()
{
	// Check downwards and with the up vector rotated to see if we could be on the ground.
	var _check_position = r3_subtract(position, r3_unit(up_vector));
		
	var _temp_angle = radtodeg(r3_get_angle_between(velocity, up_vector));
	if (_temp_angle == -1) return;
		
	//_temp_angle = sign(_temp_angle) * 90;
	for (var _i = 0; _i < 3; _i++)
	{
		up_vector = r3_rotate(up_vector, _temp_angle);
		if (scr_Check_For_Solids(r3_subtract(_check_position, r3_unit(up_vector)), true))
		{
			r3_rotate(velocity, _temp_angle * _i, velocity);
			r3_clone(_check_position, position);
			break;
		}
	}
}