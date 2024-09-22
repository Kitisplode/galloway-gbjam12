/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (direction_facing == 0) image_xscale = -1;
else image_xscale = 1;

if (direction_facing == 0) scr_Animation_Change_Sprite(spr_gb12_en_ghost_w);
else if (direction_facing == 1) scr_Animation_Change_Sprite(spr_gb12_en_ghost_n);
else if (direction_facing == 2) scr_Animation_Change_Sprite(spr_gb12_en_ghost_w);
else if (direction_facing == 3) scr_Animation_Change_Sprite(spr_gb12_en_ghost_s);