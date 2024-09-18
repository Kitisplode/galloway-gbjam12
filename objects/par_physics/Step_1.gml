// Find out if we're on the ground or not.
event_inherited();

is_on_ground_previous = is_on_ground;
is_on_ground = scr_par_physics_Check_On_Ground();
collision_this_frame = false;
collisions_this_frame = r3_zero();
r3_clone(velocity, velocity_previous);