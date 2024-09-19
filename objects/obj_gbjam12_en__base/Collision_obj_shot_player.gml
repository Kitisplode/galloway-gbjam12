/// @description Insert description here
// You can write your code in this editor

var _temp_hp = hp;

// Inherit the parent event
event_inherited();

if (_temp_hp > hp)
{
	ai_notices_player = true;
	hurt_timer = hurt_time;
	if (knockedback_by_hits)
	{
		velocity[0] = shake[0] * 200;
		velocity[1] = shake[1] * 200;
	}
	
	var _temp_x = x - sprite_get_xoffset(sprite_index) + sprite_width / 2;
	var _temp_y = y - sprite_get_yoffset(sprite_index) + sprite_height / 2;
	scr_effect_create(lerp(_temp_x, other.x, 0.5),lerp(_temp_y, other.y, 0.5),
						spr_gb12_ef_pop, 0.25, OBJECT_DEPTHS.EFFECT);
}