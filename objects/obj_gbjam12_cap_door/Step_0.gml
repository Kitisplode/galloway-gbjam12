/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	if (active)
	{
		if (position[2] < 32)
		{
			position[2] += scr_get_tick_length() * 16;
			shake[0] = random(2) - 1;
			shake[1] = random(2) - 1;
			if (sound_timer >= 0)
			{
				sound_timer -= scr_get_tick_length();
				if (sound_timer < 0)
				{
					sound_timer = sound_time;
					play_sound(snd_gbjam12_door_open, 2, 0, 0.5, 1, 0.25);
				}
			}
		}
	}
}

// Inherit the parent event
event_inherited();

if (direction_facing <= 2) direction_facing = 3;