/// @description Insert description here
// You can write your code in this editor


if (!paused)
{
	if (global.player_hp <= 0 && !instance_exists(par_transition))
	{
		var _temp_id = instance_create_depth(x,y, depth, obj_gbjam12_player_dead);
		//_temp_id.sprite_index = sprite_index;
		_temp_id.image_xscale = image_xscale;
		//_temp_id.image_angle = image_angle;
		scr_transition_fade_to_color(rm_gbjam_gameover, 1);
		instance_destroy();
		exit;
	}
	
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
	if (normal_movement)
	{
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
	}
	
	// If the player presses the depossess button, pop the player out the way they're facing,
	// recreate the original enemy (temporarily stunned), and destroy this object.
	if (can_act && scr_Input_Read(id_input, input_depossess, 0))
	{
		event_user(1);
		exit;
	}
	
	// If the player presses the act button, perform this cap's action.
	if (can_act && scr_Input_Read(id_input, input_act, 0))
	{
		event_user(0);
	}
	
	if (can_act && scr_Input_Read(id_input, input_act, 1))
	{
		event_user(2);
	}
	else
	{
		event_user(3);
	}
}

// Inherit the parent event
event_inherited();

if (!paused)
{
	if ((position[2] < -1 || z < -1) && !instance_exists(par_transition))
	{
		global.player_hp--;
		play_sound(snd_gbjam12_player_fall, 1, 0, 0.5, 0.5,0);
		var _temp_id = instance_create_depth(x,y, depth, obj_gbjam12_ef_enemy_fall);
		_temp_id.sprite_index = sprite_index;
		scr_transition_fade_to_color(room, 0.5, c_black, TRANSITION_PAUSE.GAME);
		visible = false;
	}
}