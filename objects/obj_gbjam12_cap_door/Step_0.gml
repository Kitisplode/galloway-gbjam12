/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	if (active)
	{
		if (position[2] < 32)
		{
			position[2] += scr_get_tick_length() * 16;
		}
	}
}

// Inherit the parent event
event_inherited();
