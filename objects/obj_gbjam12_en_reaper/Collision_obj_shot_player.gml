/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (other.sprite_index == spr_gb12_level_magic_circle)
{
	instance_create_depth(position[0],position[1], depth - 1, obj_gbjam12_en_alien);
	instance_destroy();
	instance_destroy(other);
	scr_audio_play_song_fade(mus_gbjam12_alien, 0.25);
	play_sound(snd_gbjam12_skeleton_roll, 1, 0, 1, 2, 0);
}