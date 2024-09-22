/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	direction_input = id_input.direction_input;
	{
		var _temp_friction = 1;
		if (direction_input > -1 && can_move)
		{
			var _accel = accel_run;
			direction_aiming = direction_input;
		
			scr_player_snap_to_4_directions(direction_aiming);
			direction = direction_facing * 90;
			
			movement_sideways_cycle = (movement_sideways_cycle + movement_sideways_cycle_speed) mod 360;
			var _temp_movement_sideways = cos(degtorad(movement_sideways_cycle)) * movement_sideways_cycle_amount;
		
			velocity[0] += cos(degtorad(direction_aiming + _temp_movement_sideways)) * _accel;
			velocity[1] += -sin(degtorad(direction_aiming + _temp_movement_sideways)) * _accel;
		}
		else
		{
			_temp_friction = 0.95;
		}
		
		if (hurt_timer > 0) _temp_friction = 0.9;
		velocity[0] *= _temp_friction;
		velocity[1] *= _temp_friction;
	}
}

// Inherit the parent event
event_inherited();

if (collision_this_frame)
{
	direction_facing = (direction_facing + 2) mod 4;
	event_user(1);
}