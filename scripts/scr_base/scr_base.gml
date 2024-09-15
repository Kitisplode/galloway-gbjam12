/// @func			scr_Is_Paused(pause_type)
/// @desc			Finds out if an object should be paused or not.
/// @arg pause_type	An enum TRANSITION_PAUSE representing whether this is physics or animation.
/// @return {Bool}	True if the object should be paused, false otherwise.
function scr_Is_Paused(_pause_type)
{
	var _paused = global.paused && affected_by_pause;
	// If there's a transition present, pause if the transition pauses animations.
	if (instance_exists(par_transition))
	{
		if (par_transition.pause_during_transition == TRANSITION_PAUSE.BOTH ||
			par_transition.pause_during_transition == _pause_type)
		{
			_paused = affected_by_pause;
		}
	}
	return _paused;
}

function scr_Bounce_Off_Walls()
{
	if (bbox_left <= 0 && velocity[0] < 0)
	{
		x = -sprite_get_bbox_left(sprite_index);
		velocity[0] *= -1;
		return true;
	}
	else if (bbox_right >= room_width && velocity[0] > 0)
	{
		x = room_width - sprite_get_bbox_right(sprite_index);
		velocity[0] *= -1;
		return true;
	}
		
	if (bbox_top <= 0 && velocity[1] < 0)
	{
		x = -sprite_get_bbox_top(sprite_index);
		velocity[1] *= -1;
		return true;
	}
	else if (bbox_bottom >= room_height && velocity[1] > 0)
	{
		x = room_width - sprite_get_bbox_bottom(sprite_index);
		velocity[1] *= -1;
		return true;
	}
	return false;
}

function scr_Lerp_Position_To_Target_Position(_lerp_speed)
{
	position[0] = lerp(position[0], target_position[0], _lerp_speed);
	position[1] = lerp(position[1], target_position[1], _lerp_speed);
	if (point_distance(position[0],position[1], target_position[0],target_position[1]) < 1)
	{
		position[0] = target_position[0];
		position[1] = target_position[1];
		return true;
	}
	return false;
}