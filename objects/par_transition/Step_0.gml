switch (transition_state)
{
	case TRANSITION_STATE.START:
		event_user(1);
		//Play_Sound(sound_end_room, global.player_sound_priority, 0,1,1,0);
		sound_end_room = -1;
		break;
	case TRANSITION_STATE.SWITCH:
		event_user(2);
	case TRANSITION_STATE.WAIT:
		wait_timer -= 1 / game_get_speed(gamespeed_fps);
		if (wait_timer < 0)
			transition_state = TRANSITION_STATE.END;
		break;
	case TRANSITION_STATE.END:
		event_user(3);
		//Play_Sound(sound_start_room, global.player_sound_priority, 0,1,1,0);
		sound_start_room = -1;
		break;
}