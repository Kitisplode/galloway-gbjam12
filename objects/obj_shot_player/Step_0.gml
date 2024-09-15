/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

if (bbox_right < -16 || bbox_left > room_width+16 ||
	bbox_bottom < -16 || bbox_top > room_height+16)
	instance_destroy();