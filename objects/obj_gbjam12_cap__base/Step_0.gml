/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

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
	// TODO
	
	// If the player presses the act button, perform this cap's action.
	if (can_act && scr_Input_Read(id_input, input_act, 0))
	{
		event_user(0);
	}
}