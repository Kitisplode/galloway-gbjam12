/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

button_pushed = false;
switch_name = "0";
anim_speed = 0;

z = -1;
position[2] = z;
z_height = 1;

//draw_2d_z = true;

normal_vector = r3(0,-1,0);

ds_map_replace(global.map_switches, switch_name, button_pushed);