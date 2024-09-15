

function scr_player_shoot(_shot_count, _shot_direction, _shot_spacing, _shot_size,_shot_speed, _xoffset,_yoffset)
{
	var _shot_direction_radians = degtorad(_shot_direction);
			
	//shot_cycle += shot_cycle_rate;
	//if (shot_cycle > 360) shot_cycle -= 360;
	for (var _i = 0; _i < _shot_count; _i++)
	{
		var _shot_offset = r3(0,0,0);
		var _d = _i - floor(_shot_count / 2);
		if (scr_is_even(_shot_count)) _d += 0.5;
		_d *= 1/_shot_count;
				
		_shot_offset[0] = sin(_shot_direction_radians) * _d * _shot_spacing * _shot_size;
		_shot_offset[1] = cos(_shot_direction_radians) * _d * _shot_spacing * _shot_size;
		var _shot_id = instance_create_depth(x + _xoffset + _shot_offset[0],
											 y + _yoffset + _shot_offset[1],
											 depth, obj_shot_player_wave);
		_shot_id.creator_ID = id;
		_shot_id.damage = _shot_size;
		_shot_id.velocity = r3_scale(r3(cos(_shot_direction_radians),
								-sin(_shot_direction_radians), 0), _shot_speed);
		_shot_id.image_xscale = _shot_size;
		_shot_id.image_yscale = _shot_size * 2;
		if (_shot_size > 1) _shot_id.image_yscale = _shot_size * 3;
		_shot_id.image_angle = _shot_direction;
		//_shot_id.sideways_vel = shot_cycle_vel;
		//if (_i >= _shot_count / 2) _shot_id.sideways_vel = -shot_cycle_vel;
		//if (_i < _shot_count / 2 && _i + 1 > _shot_count / 2) _shot_id.sideways_vel = 0;
		//_shot_id.sideways_cycle = _i / _shot_count * 360 + shot_cycle;
	}
}

function scr_player_snap_to_4_directions(_direction_aiming)
{
	var _temp_direction = _direction_aiming;
	if (_temp_direction == 45)
	{
		if (direction_facing == 0) _temp_direction = 0;
		else if (direction_facing == 1) _temp_direction = 1;
		else _temp_direction = -1;
	}
	else if (_temp_direction == 135)
	{
		if (direction_facing == 1) _temp_direction = 1;
		else if (direction_facing == 2) _temp_direction = 2;
		else _temp_direction = -1;
	}
	else if (_temp_direction == 225)
	{
		if (direction_facing == 2) _temp_direction = 2;
		else if (direction_facing == 3) _temp_direction = 3;
		else _temp_direction = -1;
	}
	else if (_temp_direction == 315)
	{
		if (direction_facing == 3) _temp_direction = 3;
		else if (direction_facing == 0) _temp_direction = 0;
		else _temp_direction = -1;
	}
	else _temp_direction = -1;
	if (_temp_direction == -1) _temp_direction = scr_snap_dir_to_cardinal(_direction_aiming) / 90;
	direction_facing = _temp_direction;
}