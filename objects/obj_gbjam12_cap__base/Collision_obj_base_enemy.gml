/// @description Insert description here
// You can write your code in this editor

var _temp_invuln_timer = invuln_timer;

// Inherit the parent event
event_inherited();

// If we took damage, get knocked back.
if (invuln_timer > 0 && _temp_invuln_timer <= 0)
{
	var _temp_direction = point_direction(other.x,other.y, x,y);
	velocity[0] = cos(degtorad(_temp_direction)) * 200;
	velocity[1] = -sin(degtorad(_temp_direction)) * 200;
	hurt_timer = hurt_time;
}