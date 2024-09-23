/// @description Insert description here
// You can write your code in this editor
if (!invincible && invuln_timer <= 0 && other.damage > 0 && !other.stunned && other.hp > 0 && other.creator_id != id)
{
	if (other.position[2] > position[2] + z_height || other.position[2] + other.z_height < position[2]) exit;
	if (hp > 0) hp -= other.damage;
	global.player_hp -= other.damage;
	invuln_timer = invuln_time;
	//var _temp_id = instance_create_depth(x,y, -1000, obj_effect);
	//_temp_id.sprite_index = spr_effect_ring_large;
	//_temp_id.anim_speed = 0.5;
	play_sound(snd_gbjam12_player_hurt, 2, 0, 0.75, 1,0.25);
	play_sound(snd_gbjam12_player_hurt_02, 1, 0, 0.75, 1,0.1);
}