/// @description transition switch
// The transition should switch the room and then start the transition wrap up.
// If the target room is the current room, restart the room then.
if (room == target_room)
	room_restart();
// Otherwise, go to the new room.
else
	room_goto(target_room);
transition_state = TRANSITION_STATE.WAIT;