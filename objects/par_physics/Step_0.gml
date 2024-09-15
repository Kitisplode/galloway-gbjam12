/// @description Handle movement

// Call the parent step to check if this object should be paused or not.
event_inherited();

// Apply position constraints as relevant.
scr_par_physics_Constrain_Position();

// If the object isn't paused, calculate movement.
if (!paused)
{
	scr_par_physics_Apply_Gravity();
	scr_par_physics_Constrain_Velocity();
	
	if (movement_enabled)
	{
		// Calculate the working velocity based on the tickrate.
		velocity_working = r3_scale(velocity, scr_get_tick_length());

		//if (global.GAMEPLAY_ENABLE_MANUAL_FRACTIONAL_MOVEMENT)
		//	scr_par_physics_Apply_Fractional_Velocity();
		
		var _temp_script = asset_get_index(movement_script);
		if (_temp_script > -1 && script_exists(_temp_script))
		{
			script_execute(_temp_script);
		}
		else
		{
			scr_par_physics_Apply_Movement(velocity_working);
		}
	}
		
	// Update the actual position.
	x = position[0];
	y = position[1];
	z = position[2];
}