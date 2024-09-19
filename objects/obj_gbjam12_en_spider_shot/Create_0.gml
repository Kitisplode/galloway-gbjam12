/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

damage = 1;

slide_around_blocks = false;

scr_effect_create(x,y, spr_gb12_ef_pop, 0.25, OBJECT_DEPTHS.EFFECT);
play_sound(snd_gbjam12_skeleton_roll, 2, 0, 0.5, 3.5, 0);