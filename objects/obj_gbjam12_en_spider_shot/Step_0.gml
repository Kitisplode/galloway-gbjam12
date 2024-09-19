/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!paused)
{
	if (collision_this_frame)
	{
		instance_destroy();
	}
}