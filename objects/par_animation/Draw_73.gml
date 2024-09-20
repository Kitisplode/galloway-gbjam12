/// @description update animation
var _paused = scr_Is_Paused(TRANSITION_PAUSE.ANIMATIONS);
if (!_paused)
{
	// Animate the sprite.
    anim_looped = 0;
    anim_frame_count = sprite_get_number(sprite_index);
    if (anim_speed != 0)
    {
        anim_frame_previous = anim_frame;
        anim_frame += anim_speed * global.gameplay_speed_scale;
		// Constrain the current frame to the number of frames in the sprite.
        if (anim_frame < 0)
        {
            anim_frame = (anim_frame_count - 1) - (abs(anim_frame) mod anim_frame_count);
            anim_looped = -1;
        }
        else if (anim_frame >= anim_frame_count)
        {
            anim_frame = anim_frame mod anim_frame_count;
            anim_looped = 1;
        }
		// If the animation looped, call the animation end method.
		if (anim_looped != 0)
		{
			if (!anim_loop)
			{
				anim_speed = 0;
				anim_frame = anim_frame_previous;
			}
			//var temp_script_ID = asset_get_index(animation_end_script);
			//if (temp_script_ID > -1)
			//{
			//	script_execute(temp_script_ID);
			//}
			//event_perform(ev_animation_end, 0);
		}
    }
	// Reduce any shake and pump applied.
	if (r3_norm(shake) < 0.1)
		shake = r3_zero();
	else
		shake = r3_lerp(shake, r3_zero(), 0.25);
	if (r3_norm(pump) < 0.1)
		pump = r3_zero();
	else
		pump = r3_lerp(pump, r3_zero(), 0.25);
}
