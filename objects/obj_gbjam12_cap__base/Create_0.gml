/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enemy_index = obj_gbjam12_en__base;

direction_aiming = 270;
direction_facing = 3;
accel_run = 80;
friction_ground = 0.7;

// Input stuff
direction_input = -1;
input_depossess = "a";
input_act = "b";
with(id_input)
{
	scr_Input_Add_Verb("a");
	scr_Input_Add_Verb("b");
}

can_move = true;
can_act = true;
action = 0;
hurt_timer = 0;
hurt_time = 0.15;

// Set up physics
axis_max_speed = r3(100, 100, 1200);
up_vector = r3(0,0,1);
r3_clone(up_vector, normal_vector);
force_gravity = 30;

slide_slopes_distance = 2;
slide_around_blocks = true;
slide_around_blocks_distance = 2;

ds_list_add(global.list_pushables, id);

draw_2d_z = true;