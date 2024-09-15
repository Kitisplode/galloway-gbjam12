depth = OBJECT_DEPTHS.TRANSITION;

// If another transition object exists right now, delete this one.
if (instance_number(par_transition) > 1)
	instance_destroy();

// This is the index of the room we intend to transition to.
target_room = -1;

// Determines the current transition state.
transition_state = TRANSITION_STATE.START;

// Determines whether the game should pause while the room is transitioning.
pause_during_transition = TRANSITION_PAUSE.BOTH;

// If this is set, the transition will wait before fading back in.
wait_timer = 0;

// These sounds play when the transition starts and ends
// When the previous room ends
sound_end_room = -1;
// And when the new room starts
sound_start_room = -1;