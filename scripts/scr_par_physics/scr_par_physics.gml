function scr_par_physics_Check_On_Ground()
{
	return scr_Check_For_Solids(r3_subtract(position, r3_unit(up_vector)), true);
}

function scr_par_physics_Constrain_Position()
{
	// Apply position constrain to any axis that has it enabled.
	for (var _i = 0; _i < 3; _i += 1)
	{
		if (!constrain_position[_i]) continue;
		if (position[_i] < constrain_min_pos[_i] && velocity[_i] < 0)
		{
			if (constrain_position_2[_i]) position[_i] = constrain_min_pos[_i];
			velocity[_i] *= constrain_vel_multiplier[_i];
		}
		if (position[_i] > constrain_max_pos[_i] && velocity[_i] > 0)
		{
			if (constrain_position_2[_i]) position[_i] = constrain_max_pos[_i];
			velocity[_i] *= constrain_vel_multiplier[_i];
		}
	}
}

function scr_par_physics_Apply_Gravity()
{
	// Apply gravity.
	if (!is_on_ground && apply_gravity_force)
	{
		r3_subtract(velocity, r3_scale(up_vector, force_gravity), velocity);
	}
}

// Called from the par_physics_2d step method to constrain velocities.
function scr_par_physics_Constrain_Velocity()
{
	current_speed = r3_norm(velocity);
	// If either the max speed or the current speed are 0 or less, we can't constrain anything.
	if (total_max_speed > 0 && current_speed > 0)
	{
		if (current_speed > total_max_speed || maintains_total_max_speed)
		{
			r3_constrain(velocity, total_max_speed, velocity);
			current_speed = total_max_speed;
		}
	}
	// Constrain the object's individual axis speeds.
	if (axis_max_speed[0] > 0 && abs(velocity[0]) > axis_max_speed[0]) velocity[0] = axis_max_speed[0] * sign(velocity[0]);
	if (axis_max_speed[1] > 0 && abs(velocity[1]) > axis_max_speed[1]) velocity[1] = axis_max_speed[1] * sign(velocity[1]);
	if (axis_max_speed[2] > 0 && abs(velocity[2]) > axis_max_speed[2]) velocity[2] = axis_max_speed[2] * sign(velocity[2]);
}

// Called from the par_physics_2d step method to apply movement.
function scr_par_physics_Apply_Movement(_velocity)
{
	var _temp_movement_total = r3_zero();
	// If movement collision is disabled, just add the velocity to the position.
	if (!movement_collision)
	{
		movement_this_frame = true;
		_temp_movement_total = _scr_par_physics_Actually_Move(_velocity);
	}
	// Otherwise, keep collisions in mind when moving.
	else
	{
		movement_this_frame = false;
		_temp_movement_total[0] = scr_par_physics_Apply_Movement_Axis(_velocity[0], 0);
		_temp_movement_total[1] = scr_par_physics_Apply_Movement_Axis(_velocity[1], 1);
		_temp_movement_total[2] = scr_par_physics_Apply_Movement_Axis(_velocity[2], 2);
		if (r3_norm(_temp_movement_total) > 0) movement_this_frame = true;
	}
	return _temp_movement_total;
}

function scr_par_physics_Apply_Movement_Axis(_distance, _axis)
{
	var _temp_moved_total = false;
	var _temp_move_vector = r3_zero();
	_temp_move_vector[_axis] = 1;
	var _temp_up_axis = r3_unit(up_vector);
	var _temp_other_axis = r3_cross(_temp_up_axis, _temp_move_vector);
	for (var i = 0; i < floor(abs(_distance)); i += 1)
	{
		var _temp_move_sign = r3_scale(_temp_move_vector, sign(_distance));
		var _temp_moved = false;
		var _temp_moved_position = r3_add(position, _temp_move_sign);
		// If the next position has a collision, stop moving or slide around the obstruction.
		if (scr_Check_For_Solids(_temp_moved_position, true))
		{
			// If this movement axis doesn't align with the up axis, then slide.
			if (!r3_parallel(_temp_move_vector, _temp_up_axis))
			{
				// If there is gravity, then try to move along the up vector first.
				if (force_gravity > 0 && slide_slopes_up)
				{
					for (var _up_axis_distance = 1;
						 _up_axis_distance <= slide_slopes_distance;
						 _up_axis_distance += 1)
					{
						var _temp_other_axis_movement = r3_scale(_temp_up_axis, _up_axis_distance);
						if (!scr_Check_For_Solids(r3_add(_temp_moved_position, _temp_other_axis_movement), true))
						{
							_scr_par_physics_Actually_Move(r3_add(_temp_move_sign, _temp_other_axis_movement));
							_temp_moved = true;
							break;
						}
						else if (!scr_Check_For_Solids(r3_subtract(_temp_moved_position, _temp_other_axis_movement), true))
						{
							_scr_par_physics_Actually_Move(r3_subtract(_temp_move_sign, _temp_other_axis_movement));
							_temp_moved = true;
							break;
						}
					}
				}
				
				// Then try to slide around the obstacle along the third axis.
				if (!_temp_moved && slide_around_blocks && velocity_working[!_axis] == 0)
				{
					for (var _other_axis_distance = 1;
						 _other_axis_distance <= slide_around_blocks_distance;
						 _other_axis_distance += 1)
					{
						var _temp_other_axis_movement = r3_scale(_temp_other_axis, _other_axis_distance);
						if (!scr_Check_For_Solids(r3_add(_temp_moved_position, _temp_other_axis_movement), true))
						{
							_scr_par_physics_Actually_Move(_temp_other_axis);
							_temp_moved = true;
							break;
						}
						else if (!scr_Check_For_Solids(r3_subtract(_temp_moved_position, _temp_other_axis_movement), true))
						{
							_scr_par_physics_Actually_Move(r3_scale(_temp_other_axis, -1, _temp_other_axis));
							_temp_moved = true;
							break;
						}
					}
				}
			}
			// Otherwise, just stop moving.
			if (!_temp_moved)
			{
				// TODO: do different collision actions depending on the axis?
				if (script_exists(collision_script))
				{
					script_execute(collision_script, _axis);
				}
				collision_this_frame = true;
				collisions_this_frame[_axis] = 1;
				break;
			}
		}
		// If there is no collision, then just move.
		else
		{
			// If this movement axis doesn't align with the up axis, and there's gravity, then slide down.
			if (!r3_parallel(_temp_move_vector, _temp_up_axis))
			{
				if (force_gravity > 0 && slide_slopes_down)
				{
					for (var _up_axis_distance = 1;
						 _up_axis_distance <= slide_slopes_distance;
						 _up_axis_distance += 1)
					{
						var _temp_other_axis_movement = r3_scale(_temp_up_axis, _up_axis_distance);
						var _temp_other_axis_movement_plus_one = r3_scale(_temp_up_axis, _up_axis_distance + 1);
						if (!scr_Check_For_Solids(r3_subtract(_temp_moved_position, _temp_other_axis_movement), true) &&
							scr_Check_For_Solids(r3_subtract(_temp_moved_position, _temp_other_axis_movement_plus_one), true))
						{
							_scr_par_physics_Actually_Move(r3_subtract(_temp_move_sign, _temp_other_axis_movement));
							_temp_moved = true;
							break;
						}
					}
				}	
			}
			// Otherwise, move normally.
			if (!_temp_moved)
			{
				_scr_par_physics_Actually_Move(_temp_move_sign);
				_temp_moved = true;
			}
		}
		if (_temp_moved) _temp_moved_total = true;
	}
	return _temp_moved_total;
}

// Helper method called to make an object move in such a way that it will move other objects that it can. 
function _scr_par_physics_Actually_Move(_movement_vector)
{
	var _temp_moved_position = r3_add(position, _movement_vector);
	
	// TODO: Handle pushing objects.
	if (pushes_others)
	{
		var _temp_pushables = ds_list_create();
		var _temp_carryables = ds_list_create();
		// Find any pushable objects that are in a position to be pushed.
		scr_Find_Pushables(_temp_moved_position, _temp_pushables, _temp_carryables);
		
		r3_clone(_temp_moved_position, position);
		x = position[0];
		y = position[1];
		z = position[2];
	
		// Try to push all the pushables.
		_scr_par_physics_Move_Group(_movement_vector, _temp_pushables);
		// Try to push all the carryables.
		_scr_par_physics_Move_Group(_movement_vector, _temp_carryables);
		
		ds_list_destroy(_temp_pushables);
		ds_list_destroy(_temp_carryables);
	}
	else
	{
		r3_clone(_temp_moved_position, position);
		x = position[0];
		y = position[1];
		z = position[2];
	}
}

function _scr_par_physics_Move_Group(_movement_vector, _temp_group_of_physics_objects)
{
	for (var i = 0; i < ds_list_size(_temp_group_of_physics_objects); i += 1)
	{
		var _temp_id = ds_list_find_value(_temp_group_of_physics_objects, i);
		var _temp_moved;
		if (!instance_exists(_temp_id)) continue;
		with (_temp_id)
		{
			_temp_moved = scr_par_physics_Step_Apply_Movement(_movement_vector);
		}
		if (r3_norm(_temp_moved) > 0)
		{
			ds_list_delete(_temp_group_of_physics_objects, i);
		}
	}
}

// Call in a collision event for a physics object.
function scr_par_physics_bounce()
{
	speed = point_distance(0,0, velocity[0],velocity[1]);
	direction = point_direction(0,0, velocity[0],velocity[1]);
	
	move_bounce_all(true);
	
	velocity[0] = speed * cos(degtorad(direction));
	velocity[1] = speed * -sin(degtorad(direction));
	speed = 0;
	direction = 0;
	position[0] = x;
	position[1] = y;
	//x = position[0];
	//y = position[1];
}