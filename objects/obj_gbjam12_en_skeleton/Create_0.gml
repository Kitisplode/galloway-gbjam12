/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

cap_index = obj_gbjam12_cap_skeleton;

direction_facing = irandom(3);

accel_run = 30;
friction_ground = 1;
roll_speed = 125;
axis_max_speed = r3(125, 125, 1200);
action = 0;

hp = 4;

ai_follow_range = 80;
ai_pick_direction_time = 1;
ai_move_time = 2;
ai_timer = random(ai_pick_direction_time);
ai_phase = 0;
ai_roll_timer = 0;
ai_roll_time = 2;
ai_roll_distance = 40;
ai_roll_distance_short = 25;