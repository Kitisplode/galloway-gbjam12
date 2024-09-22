/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!stunned) 
{
	anim_frame = direction_aiming / 45;
	anim_speed = 0;
}
else anim_speed = 0.25;