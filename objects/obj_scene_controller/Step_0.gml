if (input_check_pressed("a") || input_check_pressed("b"))
{
	scr_transition_fade_to_color(next_room);
}
else if (input_check_pressed("start"))
{
	scr_transition_fade_to_color(rm_gbjam_story);
}