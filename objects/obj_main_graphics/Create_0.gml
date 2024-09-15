// ============================================================================
// This object represents the top level graphics controller.
// It's responsible for keeping track of any global graphics-related details.
// ============================================================================
if (instance_number(obj_main_graphics) > 1)
{
    instance_destroy(id, false);
    exit;
}

// Set up the initial gameboy shader colors.
scr_set_gb_shader_colors(c_white, c_ltgrey, c_dkgrey, c_black);

shaders_on = true;