/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (dom_id != id && instance_exists(dom_id))
{
	image_angle = dom_id.image_angle + swing_angle;
	image_angle = image_angle mod 360;
}