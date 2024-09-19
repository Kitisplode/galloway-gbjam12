/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enemy_index = obj_gbjam12_en_spider;

up_vector = r3(0,-1,0);
r3_clone(up_vector, normal_vector);
force_gravity = 30;

collision_script = -1;
//no_collision_script = asset_get_index("scr_obj_gbjam12_en_spider_on_no_wall_collision");

friction_ground = 1;

spider_speed = 35;
shot_speed = 100;

normal_movement = false;