/// @description Roll!

// Inherit the parent event
event_inherited();

action = 1;
play_sound(snd_gbjam12_skeleton_roll, 1, 0, 0.75, 1, 0.1);
var _temp_direction = degtorad(direction_aiming);
velocity[0] = cos(_temp_direction) * roll_speed;
velocity[1] = -sin(_temp_direction) * roll_speed;