/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enemy_index = obj_gbjam12_en_door;

accel_run = 0;

friction_ground = 1;

is_on_ground = true;

enable_manual_fractional_movement = false;

apply_gravity_force = false;
active = false;

solid = true;
ds_list_add(global.list_solids, id);

sound_time = 0.5;
sound_timer = 0;