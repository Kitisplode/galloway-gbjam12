/// @description Insert description here
// You can write your code in this editor

var _temp_invuln_timer = invuln_timer;

// Inherit the parent event
event_inherited();

// If we took damage, get knocked back.
if (invuln_timer > 0 && _temp_invuln_timer <= 0)
{
	var _temp_direction = point_direction(other.x,other.y, x,y);
	velocity[0] = cos(degtorad(_temp_direction)) * hurt_pushback;
	velocity[1] = -sin(degtorad(_temp_direction)) * hurt_pushback;
	hurt_timer = hurt_time;
	
	var _temp_x = other.x - sprite_get_xoffset(other.sprite_index) + other.sprite_width / 2;
	var _temp_y = other.y - sprite_get_yoffset(other.sprite_index) + other.sprite_height / 2;
	scr_effect_create(lerp(x, _temp_x, 0.5),lerp(y, _temp_y, 0.5), spr_gb12_ef_pop, 0.25, OBJECT_DEPTHS.EFFECT);
}