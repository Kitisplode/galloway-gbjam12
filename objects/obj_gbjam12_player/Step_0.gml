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
		// Standard state
		if (action == 0)
		{
			can_act = true;
			can_move = true;
			if (instance_exists(item_id) && item_id != id)
			{
				instance_destroy(item_id);
				item_id = id;
			}
		}
		// Currently acting state
		else if (action == 1)
		{
			//can_act = false;
			can_move = false;
		}
	}
	
	var _direction_input = id_input.direction_input;
	if (_direction_input > -1 && can_move)
	{
		var _accel = accel_run;
		direction_aiming = _direction_input;
		
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
		
		if (can_act && scr_Input_Read(id_input, input_possess, 0))
		{
			scr_player_shoot(2, direction_facing * 90, 14,
							 1, 300,
							 0,0);
		}
	}
	
	if (can_act)
	{
		if (scr_Input_Read(id_input, input_act, 0))
		{
			action = 1;
			play_sound(snd_gbjam12_player_sword, 1, 0, 1, 1,0.25);
			if (item_id == id)
			{
				item_id = instance_create_depth(x,y, depth - 1, obj_gbjam12_player_item);
				item_id.dom_id = id;
			}
			item_id.swing_angle = (direction_facing * 90 + 270) mod 360;
			item_id.swing_direction = 1;
			item_id.swung_amount = 0;
			item_id.swinging = true;
			if (direction_facing == 0)
			{
				item_id.swing_angle = (direction_facing * 90 + 90) mod 360;
				item_id.swing_direction = -1;
			}
			anim_frame = 0;
		}
	}
}

event_inherited();