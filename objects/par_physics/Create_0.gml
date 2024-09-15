/// @description physics object
// This object type represents the standard physics object, it runs the custom physics.

event_inherited();

// Vector tracking number of pixels the object moves per second on each axis.
velocity = r3_zero();
velocity_working = r3_zero();
// Keeps track of the object's previous velocity.
velocity_previous = r3_clone(velocity);

// Keeps track of the object's current speed (norm of the velocity vector)
current_speed = 0;
// The maximum total speed the object can move. If its speed exceeds this, it will be clipped.
// If this is 0 or less, no clipping will occur.
total_max_speed = 1200;
// If this is active, the object will always try to maintain maximum speed at all times.
maintains_total_max_speed = false;
// Similar to maximum speed, but constraints on individual axes.
// If an axis is 0 or less, no clipping will occur.
axis_max_speed = r3_zero();

// If this is set to false, then any application of velocity will not occur.
movement_enabled = true;
// If this is set to false, then collisions will not influence any movement.
movement_collision = true;
// The script used to perform movement. If the script is invalid, it will use the default one.
movement_script = "";
// Keeps track of whether the object has moved in the current frame.
movement_this_frame = false;
// Keeps track of whether the object has collided this current frame.
collision_this_frame = false;
collisions_this_frame = r3_zero();

// The up direction for this object, used for gravity and slopes.
//up_vector = r3(0,-1,0);
up_vector = r3(0,0,1);
normal_vector = r3_clone(up_vector);

apply_gravity_force = true;
// The strength of gravity.
force_gravity = 0;
// Keeps track of whether the object is on the ground or not.
is_on_ground = false;

// When true, the object will pass through one-way platforms, but only those oriented against their up vector...
fall_through_oneway = false;

// If true, this object will attempt to slide around obstacles.
slide_around_blocks = true;
slide_around_blocks_distance = 8;

// If true, this object will attempt to climb slopes.
slide_slopes_up = true;
slide_slopes_down = true;
slide_slopes_distance = 1;

// The script that is called when colliding with a block.
collision_script = asset_get_index("scr_physics_collision_Stop_Moving")//-1;
// The mesh to use for 3d precise collisions.
collision_mesh = -1;

// If true, this object will attempt to push pushable objects.
pushes_others = false;

// Constrains the object's position within a certain area
constrain_position = r3_zero();
constrain_position_2 = r3_zero();
constrain_min_pos = r3_zero();
constrain_max_pos = r3_zero();
constrain_vel_multiplier = r3(-1,-1,-1);