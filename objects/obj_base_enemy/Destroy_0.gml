/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var _temp_id_self = ds_list_find_index(global.list_enemies, id);
if (_temp_id_self > -1)
{
	ds_list_delete(global.list_enemies, _temp_id_self);
}

if ((hp <= 0 || global.enemy_kill_signal) && death_effect_index > -1)
{
	var _eff_id = scr_effect_create(x,y, death_effect_index, 0.5, depth - 5);
	_eff_id.image_xscale = death_effect_size;
	_eff_id.image_yscale = death_effect_size;
	if (audio_exists(sound_dead)) play_sound(sound_dead, 1, false, 1, sound_pitch,0);
}

if (is_boss)
{
	global.enemy_kill_signal = true;
	if (hp <= 0 || debug_killed)
	{
		var _temp_id = instance_create_depth(x,y, depth, death_next_enemy_index);
		_temp_id.damage_color = damage_color;
		if (death_next_enemy_sprite == -2) _temp_id.sprite_index = sprite_index;
		else if (death_next_enemy_sprite > -1) _temp_id.sprite_index = death_next_enemy_sprite;
		_temp_id.death_next_phase = death_next_phase;
	}
}