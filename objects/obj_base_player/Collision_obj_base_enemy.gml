/// @description Insert description here
// You can write your code in this editor
if (invuln_timer <= 0 && other.damage > 0 && !other.stunned && other.hp > 0)
{
	if (hp > 0) hp -= other.damage;
	invuln_timer = invuln_time;
	//var _temp_id = instance_create_depth(x,y, -1000, obj_effect);
	//_temp_id.sprite_index = spr_effect_ring_large;
	//_temp_id.anim_speed = 0.5;
	//play_sound(snd_player_hit_02, 1, false, 1, 1,0);
}