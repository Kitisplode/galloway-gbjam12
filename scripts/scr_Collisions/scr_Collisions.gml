// Contains common collision scripts.

function scr_Check_For_Z_Collision(_z, _other)
{
	if (!instance_exists(_other)) return false;
	var _temp_our_top_and_bottom, _temp_their_top_and_bottom;
	_temp_our_top_and_bottom = r2(_z + z_height, _z);
	_temp_their_top_and_bottom = r2(_other.z + _other.z_height, _other.z);
	return (_temp_our_top_and_bottom[0] > _temp_their_top_and_bottom[1] &&
			_temp_our_top_and_bottom[1] < _temp_their_top_and_bottom[0]);
}

function scr_Place_Meeting_3d(_position, _other)
{
	if (!instance_exists(_other)) return false;
	if (place_meeting(_position[0], _position[1], _other))
		return scr_Check_For_Z_Collision(_position[2], _other);
	return false;
}

// Called to check for more precise collisions between two objects, but only once we've already confirmed
// less precise collision has occurred.
function scr_Check_For_Precise_Collision_3d(_position, _other)
{
	var _temp_this_has_mesh = collision_mesh > -1 && ds_exists(collision_mesh, ds_type_list);
	var _temp_other_has_mesh = collision_mesh > -1 && ds_exists(_other.collision_mesh, ds_type_list);
	// If neither of them have collision meshes, there's no need for further checking.
	if (!_temp_this_has_mesh && !_temp_other_has_mesh)
	{
		return true;
	}
	// If this one has a collision mesh but the other does not, then check our mesh against the other's AABB.
	else if (_temp_this_has_mesh && !_temp_other_has_mesh)
	{
		return scr_Check_AABB_Vs_Mesh(_other, id, _other.position, _position);
	}
	// If this one does not have a mesh, but the other does, then check our AABB against the other's mesh
	else if (!_temp_this_has_mesh && _temp_other_has_mesh)
	{
		return scr_Check_AABB_Vs_Mesh(id, _other, _position, _other.position);
	}
	// If both have a mesh, then check our mesh against the other's mesh
	else
	{
		return true;
	}
}

function scr_Check_AABB_Vs_Mesh(_id_aabb, _id_mesh, _aabb_position, _mesh_position)
{
	if (ds_list_size(_id_mesh.collision_mesh) < 0) return true;
	
	var _temp_aabb_sprite = _id_aabb.sprite_index;
	if (_id_aabb.mask_index != -1) _temp_aabb_sprite = _id_aabb.mask_index;
	
	var _temp_aabb_pos1 = r3(_aabb_position[0] - sprite_get_xoffset(_temp_aabb_sprite),
							_aabb_position[1] - sprite_get_yoffset(_temp_aabb_sprite),
							_aabb_position[2]);
	var _temp_aabb_pos2 = r3(_temp_aabb_pos1[0] + sprite_get_width(_temp_aabb_sprite) * _id_aabb.image_xscale,
							_temp_aabb_pos1[1] + sprite_get_height(_temp_aabb_sprite) * _id_aabb.image_yscale,
							_aabb_position[2] + z_height);
	var temp_aabb = scr_Make_AABB_Center_Extents(
						_temp_aabb_pos1,
						_temp_aabb_pos2);
						
	for (var i = 0; i < ds_list_size(_id_mesh.collision_mesh); i += 1)
		{
			var temp_collision_triangle = ds_list_find_value(_id_mesh.collision_mesh, i);
			temp_collision_triangle = tri_r3_translate(temp_collision_triangle, _mesh_position);
			var temp_collision = scr_Collision_3d_AABB_Triangle(temp_aabb[0], temp_aabb[1],
									temp_collision_triangle[0],
									temp_collision_triangle[1],
									temp_collision_triangle[2]);
			if (temp_collision) 
			{
				return true;
			}
		}
		return false;
}

function scr_Make_AABB_Center_Extents(_pos1, _pos2)
{
	var _result;
	
	_result[0] = r3_lerp(_pos1, _pos2, 0.5);
	_result[1] = r3_subtract(_pos2, _result[0]);
	
	return _result;
}

// Because this relies on the position and z_height fields, must be called only from physics objects.
function scr_Check_For_Solids(_position_to_check, _flag_skip_if_already_colliding)
{
	var _temp_block_list = global.list_solids;
	
	var _collision_result = false;
	
	// Loop through the solid list
	if (ds_list_size(_temp_block_list) > 0)
	{
		for (var i = 0; i < ds_list_size(_temp_block_list); i += 1)
		{
			var _temp_id = ds_list_find_value(_temp_block_list, i);
			if (!instance_exists(_temp_id)) continue;
			if (id == _temp_id) continue;
			if (object_is_ancestor(object_index, obj_base_player) && _temp_id.object_index == obj_block_enemy_only) continue;
			if (place_meeting(_position_to_check[0], _position_to_check[1], _temp_id))
			{
				// Skip the collision if we're already colliding with the other object and we want to skip.
				if (_flag_skip_if_already_colliding)
				{
					if (scr_Place_Meeting_3d(position, _temp_id))
					{
						// TODO: Check for more precise collisions.
						if (scr_Check_For_Precise_Collision_3d(position, _temp_id))
							continue;
					}
				}
				// Otherwise, just check to see if we will be colliding at the given location then.
				if (scr_Check_For_Z_Collision(_position_to_check[2], _temp_id))
				{
					// TODO: Check for more precise collisions here.
					if (!scr_Check_For_Precise_Collision_3d(_position_to_check, _temp_id))
						continue;
					// For solid blocks, return true immediately.
					if (_temp_id.solid)
					{
						_collision_result = true;
						break;
					}
					// For semisolid blocks, return true only if this object is above the other.
					else if (scr_Check_On_Top(_position_to_check, _temp_id))
					{
						// If this block's normal aligns with our up vector, and
						// we're supposed to fall through oneways right now, then skip it.
						if (fall_through_oneway && r3_equals(r3_unit(up_vector), r3_unit(_temp_id.normal_vector)))
						{
							continue;
						}
						// Otherwise, it's okay to collide.
						_collision_result = true;
						break;
					}
				}
			}
		}
		return _collision_result;
	}
	else
	{
		// If we made it to this point, try checking just with place_meeting obj_temp_block?
		return place_meeting(_position_to_check[0], _position_to_check[1], obj_block);
	}
}

// Checks to see if this object is on top of the other object's normal.
function scr_Check_On_Top(_position_to_check, _other_object)
{
	var _temp_collided = false;
	// Momentarily move the object...
	var _temp_premove = r3(x,y,z);
	x = _position_to_check[0]; y = _position_to_check[1]; z = _position_to_check[2];
	// Move the other object against its normal vector and then see if the two collide then.
	with (_other_object)
	{
		_temp_collided = scr_Place_Meeting_3d(r3_subtract(position, normal_vector), other);
	}
	// Return the object to its previous position.
	x = _temp_premove[0]; y = _temp_premove[1]; z = _temp_premove[2];
	return !_temp_collided;
}

function scr_Find_Pushables(_position_to_check, _pushables_list, _carryables_list)
{
	for (var i = 0; i < ds_list_size(global.list_pushables); i += 1)
	{
		var _temp_id = ds_list_find_value(global.list_pushables, i);
		if (!instance_exists(_temp_id)) continue;
		if (_temp_id == id) continue;
		if (ds_list_find_index(_pushables_list, _temp_id) > -1) continue;
		if (ds_list_find_index(_carryables_list, _temp_id) > -1) continue;
		// If the caller is solid, check for direct collision
		if (solid && scr_Place_Meeting_3d(_position_to_check, _temp_id))
		{
			ds_list_add(_pushables_list, _temp_id);
			continue;
		}
		// Otherwise, check to see if the object is on top of the caller.
		if (scr_Place_Meeting_3d(r3_add(position, normal_vector), _temp_id))
		{
			with (_temp_id)
			{
				if (scr_Check_On_Top(position, other))
				{
					ds_list_add(_carryables_list, _temp_id);
				}
			}
		}
	}
}