/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

anim_speed = 0.15;
draw_2d_z = true;

timer = 0.15;
phase = 0;
dies_offscreen = false;

axis_max_speed = r3(200, 200, 1200);

movement_collision = false;
damage = 0;

after_effect_active = true;
after_effect_sprite = spr_gb12_player_item_mask_shot_effect;
after_effect_time = 0.1;