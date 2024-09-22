/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (is_on_ground && !is_on_ground_previous)
{
	velocity[0] = 0;
	velocity[1] = 0;
	play_sound(snd_gbjam12_statue_stomp, 2, 0, 0.75,0.5,0.25);
	// Snap to the target position
	// TODO
}