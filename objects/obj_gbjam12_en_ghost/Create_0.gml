/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

cap_index = obj_gbjam12_cap_ghost;

movement_collision = false;
hp = 1;

direction = random(90) - 45 + choose(0, 180);
movement_sideways_cycle = 0;
movement_sideways_cycle_speed = 15;
movement_sideways_cycle_amount = 45;

axis_max_speed = r3(50, 50, 1200);

anim_speed = 0.15;

apply_gravity_force = false;