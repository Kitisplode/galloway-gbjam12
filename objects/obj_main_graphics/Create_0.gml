// ============================================================================
// This object represents the top level graphics controller.
// It's responsible for keeping track of any global graphics-related details.
// ============================================================================
if (instance_number(obj_main_graphics) > 1)
{
    instance_destroy(id, false);
    exit;
}

// Greyscale
palette[0,0] = make_color_rgb(216,216,216);
palette[0,1] = make_color_rgb(151,151,151);
palette[0,2] = make_color_rgb(94,94,94);
palette[0,3] = c_black;

// Green
palette[1,0] = make_color_rgb(223,248,208);
palette[1,1] = make_color_rgb(137,192,111);
palette[1,2] = make_color_rgb(51,104,86);
palette[1,3] = make_color_rgb(6,26,37);

// Red
palette[2,0] = make_color_rgb(223,248,208);
palette[2,1] = make_color_rgb(255,0,21);
palette[2,2] = make_color_rgb(134,0,32);
palette[2,3] = make_color_rgb(17,7,10);

// Orangepurple
palette[3,0] = make_color_rgb(239,249,214);
palette[3,1] = make_color_rgb(186,80,68);
palette[3,2] = make_color_rgb(122,28,75);
palette[3,3] = make_color_rgb(27,3,38);

current_palette = 0;
palette_count = 4;

// Set up the initial gameboy shader colors.
scr_set_gb_shader_colors(palette[current_palette,0],
						 palette[current_palette,1],
						 palette[current_palette,2],
						 palette[current_palette,3]);


shaders_on = true;