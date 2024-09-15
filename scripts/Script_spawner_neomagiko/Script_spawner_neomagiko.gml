
	// @description Returns the number of instances that are children of the par_enemy class.
function instance_number_enemies() {
	var _counter = 0;
	for (var _i = 0; _i < ds_list_size(global.list_enemies); _i += 1)
	{
		var _temp_id = ds_list_find_value(global.list_enemies, _i);
		if (instance_exists(_temp_id))
		{
			if (_temp_id.counts_for_spawn)
				_counter += 1;
		}
		else
		{
			ds_list_delete(global.list_enemies, _i);
			_i -= 1;
		}
	}
	return _counter;
}

// Call only in a spawner object.
function unlock_enemy()
{
	_new_enemy_unlocked = false;
	// If we've reached one of the new enemy thresholds, add the next available enemy to the unlocked list.
	if ((ds_list_size(list_enemies_unlocked) == 0 ||
		current_wave_total == enemy_unlock_wave_second ||
		current_wave_total == enemy_unlock_wave_third  ||
		current_wave_total == enemy_unlock_wave_fourth) &&
		current_wave_total != enemy_unlock_wave_boss)
	{
		var _temp_new_enemy_index = global.enemy_types[enemy_current_type,
														ds_list_size(list_enemies_unlocked)];
		ds_list_add(list_enemies_unlocked, _temp_new_enemy_index);
		_new_enemy_unlocked = true;
	}
	if (current_wave_total == enemy_unlock_wave_boss)
	{
		var _temp_new_enemy_index = global.enemy_boss[enemy_current_type];
		ds_list_add(list_enemies_unlocked, _temp_new_enemy_index);
		_new_enemy_unlocked = true;
	}
	return _new_enemy_unlocked;
}

// Call only in a spawner object.
function spawn_enemy()
{
	
}

// Call only in a spawner object.
function spawn_wave()
{
	// Spawn enemies. Each enemy costs a certain amount, once the total cost allotted for the wave has reached
	// the maximum amount, stop spawning more enemies.
	var _temp_unlocked_list_size = ds_list_size(list_enemies_unlocked);
	var _temp_wave_cost = 0;
	var _loops = 0;
	while (_temp_wave_cost < maximum_wave_cost)
	{
		if (_loops++ > 20) break;
		// Pick an enemy spawn index from the unlocked enemies list.
		var _temp_spawn_index = -1;
		// If this is the first enemy of the wave, force this one to be of the newest enemy type.
		if (_temp_wave_cost == 0)
		{
			_temp_spawn_index = ds_list_find_value(list_enemies_unlocked, _temp_unlocked_list_size - 1);
		}
		// Otherwise, choose an enemy type from the unlocked list.
		else
		{
			_temp_spawn_index = ds_list_find_value(list_enemies_unlocked,
												  irandom_range(0, _temp_unlocked_list_size - 1));
		}
		// If somehow we didn't get a good enemy index, just cancel.
		if (_temp_spawn_index == -1)
		{
			show_message("No enemy spawn index!");
			break;
		}
		
		// Determine the spawn position.
		var _temp_random_angle = degtorad(random_range(0,359));
		var _temp_random_range = random_range(room_width * 0.66, room_width);
		var _temp_spawn_pos_x = room_width / 2 + cos(_temp_random_angle) * _temp_random_range;
		var _temp_spawn_pos_y = room_height / 2 - sin(_temp_random_angle) * _temp_random_range;
		
		// Spawn the enemy.
		var _temp_enemy_spawned_id = instance_create_depth(_temp_spawn_pos_x, _temp_spawn_pos_y,
														  OBJECT_DEPTHS.ENEMY, _temp_spawn_index);
		_temp_enemy_spawned_id.damage_color = global.enemy_color[enemy_current_type];
		// Do some enemy setup stuff.
		with (_temp_enemy_spawned_id)
		{
			event_user(1);	
		}
		// If the enemy we just spawned was a boss, halt all further spawns.
		if (_temp_enemy_spawned_id.is_boss)
		{
			spawner_active = false;
			break;
		}
		
		// Add to the total cost.
		if (_temp_enemy_spawned_id.spawn_cost <= 0) _temp_wave_cost += 1;
		else _temp_wave_cost += _temp_enemy_spawned_id.spawn_cost;
	}
}

// Call from an enemy's setup.
function scr_enemy_setup_move_cardinal(_initial_speed)
{
	// Move in a cardinal direction towards the center of the screen.
	var _temp_new_direction = degtorad(scr_direction_cardinal(position[0],position[1], room_width / 2,room_height / 2));
	velocity[0] = cos(_temp_new_direction) * _initial_speed;
	velocity[1] = -sin(_temp_new_direction) * _initial_speed;

	// If we're in a position where we won't possibly reach the screen in a cardinal direction, line up!
	if (velocity[0] == 0)
	{
		if (bbox_left < 0 || bbox_right >= room_width)
		{
			var _temp = sprite_width * 2;
			position[0] = irandom_range(_temp, room_width - _temp);	
		}
	}
	if (velocity[1] == 0)
	{
		if (bbox_top < 0 || bbox_bottom >= room_height)
		{
			var _temp = sprite_height * 2;
			position[1] = irandom_range(_temp, room_height - _temp);
		}
	}	
}

function scr_enemy_setup_move_diagonal(_initial_speed)
{
	var _temp_new_direction = degtorad(scr_direction_cardinal(x,y, room_width / 2,room_height / 2) + choose(-45,45));
	
	velocity[0] = cos(_temp_new_direction) * _initial_speed;
	velocity[1] = -sin(_temp_new_direction) * _initial_speed;
}

function scr_enemy_setup_move_towards_player()
{
	var _temp_new_direction = random(360);
	if (instance_exists(obj_base_player))
	{
		_temp_new_direction = point_direction(x,y, obj_base_player.x,obj_base_player.y);
	}
	velocity_x = cos(degtorad(_temp_new_direction)) * initial_speed;
	velocity_y = -sin(degtorad(_temp_new_direction)) * initial_speed;
}