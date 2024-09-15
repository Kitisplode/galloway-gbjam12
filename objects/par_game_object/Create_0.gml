/// @description Insert description here
// You can write your code in this editor

event_inherited();

// Keeps track of whether the object is paused or not.
paused = false;
// If active, this object will be affected by pausing.
affected_by_pause = true;

// Represents the location of the object. actual x and y are updated at the end of each step.
position = r3(x,y,0);
z = 0;
z_height = 16;

// Represents an object this object is attached to
dom_id = id;
dom_offset_x = 0;
dom_offset_y = 0;

// Allows the object to generate effects around it randomly (like sparkles).
sparkle_index = -1;
sparkle_timer = 0;
sparkle_time = 0.5;
sparkle_anim_speed = 0.5;
sparkle_sound = -1;

fade_time = -1;
fade_point = 0.5;