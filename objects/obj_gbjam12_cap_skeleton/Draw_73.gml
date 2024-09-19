/// @description change sprite

// Animate the current sprite.
event_inherited();

// Flip the sprite if we're facing west.
if (direction_facing == 0) image_xscale = -1;
else image_xscale = 1;

// If we're not acting, use the normal walk sprites.
if (action == 0)
{
	if (is_on_ground)
	{
		anim_loop = true;
		// Walking
		if (r2_norm(velocity) > 20) anim_speed = 0.15; 
		// Standing
		else anim_speed = 0;
		if (direction_facing == 0) scr_Animation_Change_Sprite(spr_gb12_en_skel_w);
		else if (direction_facing == 1) scr_Animation_Change_Sprite(spr_gb12_en_skel_n);
		else if (direction_facing == 2) scr_Animation_Change_Sprite(spr_gb12_en_skel_w);
		else if (direction_facing == 3) scr_Animation_Change_Sprite(spr_gb12_en_skel_s);
	}
}
// If we're performing a basic action, use the act sprites.
else if (action > 0)
{
	anim_loop = false;
	anim_speed = 0.18;
	if (direction_facing == 0) scr_Animation_Change_Sprite(spr_gb12_en_skel_w_act);
	else if (direction_facing == 1) scr_Animation_Change_Sprite(spr_gb12_en_skel_n_act);
	else if (direction_facing == 2) scr_Animation_Change_Sprite(spr_gb12_en_skel_w_act);
	else if (direction_facing == 3) scr_Animation_Change_Sprite(spr_gb12_en_skel_s_act);
	if (anim_looped != 0) action = 0;
}