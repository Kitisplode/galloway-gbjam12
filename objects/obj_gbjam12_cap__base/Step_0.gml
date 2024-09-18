/// @description Insert description here
// You can write your code in this editor


if (!paused)
{
	// While hurt, the player cannot move.
	if (hurt_timer > 0)
	{
		hurt_timer -= scr_get_tick_length();
		can_act = false;
		can_move = false;
	}
	else
	{
		if (action == 0)
		{
			can_act = true;
			can_move = true;
		}
		if (action == 1)
		{
			can_act = false;
			can_move = false;
		}
	}
	
	direction_input = id_input.direction_input;
	if (direction_input > -1 && can_move)
	{
		var _accel = accel_run;
		direction_aiming = direction_input;
		
		scr_player_snap_to_4_directions(direction_aiming);
		direction = direction_facing * 90;
		
		velocity[0] += cos(degtorad(direction_aiming)) * _accel;
		velocity[1] += -sin(degtorad(direction_aiming)) * _accel;
	}
	
	if (is_on_ground)
	{
		var _temp_friction = friction_ground;
		if (hurt_timer > 0) _temp_friction = 0.9;
		velocity[0] *= _temp_friction;
		velocity[1] *= _temp_friction;
	}
	
	// If the player presses the depossess button, pop the player out the way they're facing,
	// recreate the original enemy (temporarily stunned), and destroy this object.
	if (can_act && scr_Input_Read(id_input, input_depossess, 0))
	{
		var _temp_id = instance_create_depth(x,y, depth, enemy_index);
		_temp_id.z = z;
		_temp_id.position[2] = position[2];
		_temp_id.stunned = true;
		
		_temp_id = instance_create_depth(x + sprite_width / 2,y + sprite_height / 2, depth, obj_gbjam12_player);
		_temp_id.z = z + 2;
		_temp_id.position[2] = position[2] + 2;
		_temp_id.direction_aiming = direction_aiming;
		_temp_id.direction_facing = direction_facing;
		_temp_id.velocity[0] = cos(degtorad(direction_facing * 90)) * 100;
		_temp_id.velocity[1] = sin(degtorad(direction_facing * 90)) * -100;
		_temp_id.velocity[2] = 250;
		
		
		play_sound(snd_gbjam12_player_uncap, 1, 0, 1, 1,0);
		
		instance_destroy();
		
		exit;
	}
	
	// If the player presses the act button, perform this cap's action.
	if (can_act && scr_Input_Read(id_input, input_act, 0))
	{
		event_user(0);
	}
}

// Inherit the parent event
event_inherited();