/// @description animated sprites

// The id of the base object that created this animation.
id_base = -1;

// The actual position, since we're using gmlinear vectors.
position = r3(x,y,0);
position_previous = r3_clone(position);
z = 0;

// if this is active, draws on the gui instead of the world
draw_gui = false;

// If this is active, subtract the object's z from the y when drawing.
draw_2d_z = false;

// if somehow there is no sprite available, we just draw this sprite.
sprite_default = sprite_index;

// The speed at which the animation plays (frame per second)
anim_speed = 0;
// The previous frame.
anim_frame_previous = 0;
// The current frame.
anim_frame = 0;
// The number of frames in the current animation.
anim_frame_count = 0;
// If this is true, the animation will loop when it reaches the end.
anim_loop = true;

// If this is 0, the sprite has not looped this frame. If 1 or -1, then it has looped this frame, in that direction.
anim_looped = 0;
animation_end_script = "";

// Temporary positional shift
shake = r3_zero();
// Temporary scaling
pump = r3_zero();

// Keeps track of whether this object has been paused or not.
paused = false;
// If this is false, this animation will not be affected by pausing.
affected_by_pause = true;

shader_outline = false;
//outline_pixel_stage = shader_get_uniform(sh_outline,"texture_Pixel")
//outline_thickness_stage = shader_get_uniform(sh_outline,"thickness_power")
//outline_color_stage = shader_get_uniform(sh_outline,"RGBA")
outline_thickness = 1;
outline_color = c_white;