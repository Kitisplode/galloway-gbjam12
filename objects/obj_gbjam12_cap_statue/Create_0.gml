/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enemy_index = obj_gbjam12_en_statue;

accel_run = 0;

friction_ground = 1;

is_on_ground = true;

enable_manual_fractional_movement = false;

force_gravity = 30;

solid = true;
ds_list_add(global.list_solids, id);