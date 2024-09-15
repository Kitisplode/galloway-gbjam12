/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Set up physics
axis_max_speed = r3(300, 300, 1200);
up_vector = r3(0,0,1);
r3_clone(up_vector, normal_vector);
force_gravity = 50;

slide_slopes_distance = 2;
slide_around_blocks = true;
slide_around_blocks_distance = 2;

ds_list_add(global.list_pushables, id);

draw_2d_z = true;

damage_time = 0.25;

hurt_timer = 0;
hurt_time = 0.075;
knockedback_by_hits = true;

friction_ground = 0.7;

death_effect_index = spr_gb12_ef_pop;
delayed_death_effect = true;