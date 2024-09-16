/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

direction_aiming = 270;
direction_facing = 3;
accel_run = 80;
friction_ground = 0.7;

// Set up input
direction_input = -1;
input_possess = "a";
input_act = "b";
with(id_input)
{
	scr_Input_Add_Verb("a");
	scr_Input_Add_Verb("b");
}

// Behavior vars
can_move = true;
can_act = true;
action = 0;
item_id = id;

hurt_timer = 0;
hurt_time = 0.15;

holding_a = false;

// Set up physics
axis_max_speed = r3(100, 100, 1200);
up_vector = r3(0,0,1);
r3_clone(up_vector, normal_vector);
force_gravity = 50;

slide_slopes_distance = 2;
slide_around_blocks = true;
slide_around_blocks_distance = 2;

ds_list_add(global.list_pushables, id);

draw_2d_z = true;