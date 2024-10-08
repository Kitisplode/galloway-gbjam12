/// @description change sprite

// Animate the current sprite.
event_inherited();

// Flip the sprite if we're facing west.
if (direction_facing == 0) image_xscale = -1;
else image_xscale = 1;

if (has_mask)
{
	// If we're hurt, use the hurt sprites.
	if (hurt_timer > 0)
	{
		anim_loop = true;
		anim_speed = 0;
		if (direction_facing == 0) scr_Animation_Change_Sprite(spr_gb12_player_w_hurt);
		else if (direction_facing == 1) scr_Animation_Change_Sprite(spr_gb12_player_n_hurt);
		else if (direction_facing == 2) scr_Animation_Change_Sprite(spr_gb12_player_w_hurt);
		else if (direction_facing == 3) scr_Animation_Change_Sprite(spr_gb12_player_s_hurt);
	}
	// If we're not hurt, use normal sprites.
	else
	{
		// If we're not acting, use the normal walk sprites.
		if (action == 0)
		{
			//if (is_on_ground)
			{
				anim_loop = true;
				// Walking
				if (r2_norm(velocity) > 20) anim_speed = 0.15; 
				// Standing
				else anim_speed = 0;
				if (direction_facing == 0) scr_Animation_Change_Sprite(spr_gb12_player_w);
				else if (direction_facing == 1) scr_Animation_Change_Sprite(spr_gb12_player_n);
				else if (direction_facing == 2) scr_Animation_Change_Sprite(spr_gb12_player_w);
				else if (direction_facing == 3) scr_Animation_Change_Sprite(spr_gb12_player_s);
			}
		}
		// If we're performing a basic action, use the act sprites.
		else if (action > 0)
		{
			anim_loop = false;
			anim_speed = 0.18;
			if (direction_facing == 0) scr_Animation_Change_Sprite(spr_gb12_player_w_act);
			else if (direction_facing == 1) scr_Animation_Change_Sprite(spr_gb12_player_n_act);
			else if (direction_facing == 2) scr_Animation_Change_Sprite(spr_gb12_player_w_act);
			else if (direction_facing == 3) scr_Animation_Change_Sprite(spr_gb12_player_s_act);
			if (anim_looped != 0) action = 0;
		}
	}
}
else
{
	// If we're hurt, use the hurt sprites.
	if (hurt_timer > 0)
	{
		anim_loop = true;
		anim_speed = 0;
		if (direction_facing == 0) scr_Animation_Change_Sprite(spr_gb12_player_unmasked_w_hurt);
		else if (direction_facing == 1) scr_Animation_Change_Sprite(spr_gb12_player_unmasked_n_hurt);
		else if (direction_facing == 2) scr_Animation_Change_Sprite(spr_gb12_player_unmasked_w_hurt);
		else if (direction_facing == 3) scr_Animation_Change_Sprite(spr_gb12_player_unmasked_s_hurt);
	}
	// If we're not hurt, use normal sprites.
	else
	{
		// If we're not acting, use the normal walk sprites.
		if (action == 0)
		{
			//if (is_on_ground)
			{
				anim_loop = true;
				// Walking
				if (r2_norm(velocity) > 20) anim_speed = 0.15; 
				// Standing
				else anim_speed = 0;
				if (direction_facing == 0) scr_Animation_Change_Sprite(spr_gb12_player_unmasked_w);
				else if (direction_facing == 1) scr_Animation_Change_Sprite(spr_gb12_player_unmasked_n);
				else if (direction_facing == 2) scr_Animation_Change_Sprite(spr_gb12_player_unmasked_w);
				else if (direction_facing == 3) scr_Animation_Change_Sprite(spr_gb12_player_unmasked_s);
			}
		}
		// If we're performing a basic action, use the act sprites.
		else if (action > 0)
		{
			anim_loop = false;
			anim_speed = 0.18;
			if (direction_facing == 0) scr_Animation_Change_Sprite(spr_gb12_player_unmasked_w_act);
			else if (direction_facing == 1) scr_Animation_Change_Sprite(spr_gb12_player_unmasked_n_act);
			else if (direction_facing == 2) scr_Animation_Change_Sprite(spr_gb12_player_unmasked_w_act);
			else if (direction_facing == 3) scr_Animation_Change_Sprite(spr_gb12_player_unmasked_s_act);
			if (anim_looped != 0) action = 0;
		}
	}
}