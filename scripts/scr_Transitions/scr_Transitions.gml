// Scripts that start transitions.
function scr_transition_instant(_target_room)
{
	if (_target_room < 0) _target_room = room;
	var transition_ID = instance_create_depth(0,0, OBJECT_DEPTHS.TRANSITION, par_transition);
	if (instance_exists(transition_ID))
		transition_ID.target_room = _target_room;
	else
		transition_ID = -1;
	return transition_ID;
}

function scr_transition_fade_to_color(_target_room,
									  _fade_time = 0.25,
									  _fade_color = c_black,
								  	  _pause = TRANSITION_PAUSE.BOTH,
								  	  _start_sound = -1,
									  _end_sound = -1)
{
	if (_target_room < 0) _target_room = room;
	var transition_ID = instance_create_depth(0,0, OBJECT_DEPTHS.TRANSITION, obj_transition_fade);
	if (instance_exists(transition_ID))
	{
		transition_ID.target_room = _target_room;
		transition_ID.fade_time = _fade_time;
		transition_ID.fade_color = _fade_color;
		transition_ID.pause_during_transition = _pause;
		transition_ID.sound_end_room = _start_sound;
		transition_ID.sound_start_room = _end_sound;
	}
	else
		transition_ID = -1;
	return transition_ID;
}