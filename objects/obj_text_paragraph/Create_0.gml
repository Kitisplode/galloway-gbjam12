event_inherited();

// The string to print.
text = "";

// The rate at which the text will type out per frame.
// -1 means the whole string will be typed in one frame.
text_type_rate = 1;

cursor_pos_x = 0;
cursor_pos_y = 0;

font = global.font_01;
halign = fa_left;
halign = fa_top;
scale = 1;

text_height = 16;

// A list of all the strings printed as part of this paragraph.
string_list = ds_list_create();
string_obj_list = ds_list_create();

// A timer in seconds that controls when the text goes away. Disabled if negative
destroy_timer = 5;
fade_rate = 0.25;

init = false;