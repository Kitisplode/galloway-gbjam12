/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	if (global.player_hp <= 0 && !instance_exists(par_transition))
	{
		var _temp_id = instance_create_depth(x,y, depth, obj_gbjam12_player_dead);
		_temp_id.sprite_index = sprite_index;
		_temp_id.image_xscale = image_xscale;
		_temp_id.image_angle = image_angle;
		_temp_id.has_mask = has_mask;
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
		else if (action == 2)
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
		
	// Throw mask
	if (has_mask && can_act && scr_Input_Read(id_input, input_possess, 0) && !instance_exists(obj_gbjam12_player_item_mask_shot))
	{
		action = 2;
		var _temp_id = instance_create_depth(x,y, depth - 1, obj_gbjam12_player_item_mask_shot);
		_temp_id.velocity[0] = cos(degtorad(direction_aiming)) * 200;
		_temp_id.velocity[1] = sin(degtorad(direction_aiming)) * -200;
		_temp_id.creator_ID = id;
		play_sound(snd_gbjam12_spider_spit, 1, 0, 1, 0.7, 0.25);
		has_mask = false;
	}
	
	// Sword
	if (can_act && scr_Input_Read(id_input, input_act, 0))
	{
		/*
		show_debug_message("player is at ({0},{1},{2})", item_id.x, item_id.y, item_id.z);
		show_debug_message("player bbox: {0},{1},{2},{3}",
			item_id.bbox_left,
			item_id.bbox_right,
	        item_id.bbox_top,
			item_id.bbox_bottom,
		);
		show_debug_message("room size: {0},{1}", room_width, room_height);
		show_debug_message("player offscreen: {0}", scr_check_off_screen(other, 12));
		*/
		action = 1;
		play_sound(snd_gbjam12_player_sword, 1, 0, 1, 1,0.25);
		if (item_id != id && instance_exists(item_id)) instance_destroy(item_id);
		
		item_id = instance_create_depth(x,y, depth - 1, obj_gbjam12_player_item);
		item_id.dom_id = id;
		item_id.swing_angle = (direction_facing * 90 + 270) mod 360;
		item_id.swing_direction = 1;
		item_id.swung_amount = 0;
		item_id.swinging = true;
		if (direction_facing == 0)
		{
			item_id.swing_angle = (direction_facing * 90 + 90) mod 360;
			item_id.swing_direction = -1;
		}
		else if (direction_facing == 2)
		{
			item_id.anim_frame = 4;
		}
		anim_frame = 0;
	}
	
	holding_a = scr_Input_Read(id_input, input_possess, 1);
	
	scr_darkness_add_light(id, 14);
}

event_inherited();

if (!paused)
{
	if ((position[2] < -1 || z < -1) && !instance_exists(par_transition))
	{
		global.player_hp--;
		play_sound(snd_gbjam12_player_fall, 1, 0, 0.5, 1,0);
		visible = false;
		
		//scr_effect_create(x,y, spr_gb12_player_fall, 0.15, OBJECT_DEPTHS.EFFECT);
		var _temp_id = instance_create_depth(x,y, depth, obj_gbjam12_ef_enemy_fall);
		_temp_id.sprite_index = sprite_index;
		scr_transition_fade_to_color(room, 0.5, c_black, TRANSITION_PAUSE.GAME);
	}
}