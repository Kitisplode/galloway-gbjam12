if (!paused)
{
	if (invuln_timer > 0)
	{
		invuln_timer -= scr_get_tick_length();
	}
}

event_inherited();

