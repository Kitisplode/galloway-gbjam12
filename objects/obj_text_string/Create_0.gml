/// @description Insert description here
// You can write your code in this editor

event_inherited();

// The string to print.
text = "";

text_current_position = 1;
// The rate at which the text will type out per frame. -1 means the whole string will be typed in one frame.
text_type_rate = 1;

// The current relative position to type at.
cursor_pos_x = 0;
cursor_pos_y = 0;

font = global.font_01;
halign = fa_left;
halign = fa_top;
scale = 1;

// The sound to play any frame that a character is typed.
text_type_sound_ID = -1;

// A list of all the characters handled by this string.
list_characters = ds_list_create();
characters_typed = 0;

// A timer in seconds that controls when the text starts typing.
start_timer = 0;

// A timer in seconds that controls when the text goes away. Disabled if negative
destroy_timer = 5;
// If this is true, the destroy timer will not start until the whole string has been typed out.
destroy_timer_wait = true;

// This is the rate at which the text will fade once the destroy timer ends. Affected by game_speed_scale
fade_rate = 0;

// When this is true, this object is not affected by the game being paused.
not_affected_by_pause = true;

finalized_setup = false;
// When this is true, the string has finished typing out.
finished_typing = false;

flash_rate = 0;
flash_alpha = 0.5;

// When this is set to true, the string will update a number of variables for its character objects next step.
update_characters = false;

// If this is true, the text has run off screen.
string_is_off_screen = false;