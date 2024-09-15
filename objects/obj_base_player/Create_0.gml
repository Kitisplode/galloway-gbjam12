// Inherit the parent event
event_inherited();

// Set up the input source.
id_input = instance_create_depth(0,0, depth - 1, obj_input);

hp_max = 4;
hp = hp_max;
invuln_time = 1.5;
invuln_timer = 0;

depth = OBJECT_DEPTHS.PLAYER;