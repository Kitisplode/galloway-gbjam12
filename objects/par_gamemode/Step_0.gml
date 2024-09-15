/// @description Check game mode status
// In this event, check to see if either the win or loss conditions are met.

// If the win condition is met, perform the appropriate action.

// If the loss condition is met, perform the appropriate action.

// Also if a timer is involved, do stuff with that here, too.

if (!finalized_setup)
{
	event_user(0);
	finalized_setup = true;
}