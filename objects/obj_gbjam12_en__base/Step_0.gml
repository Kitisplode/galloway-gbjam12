/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	if (hurt_timer > 0)
	{
		hurt_timer -= scr_get_tick_length();
	}
	else
	{
		velocity[0] *= friction_ground;
		velocity[1] *= friction_ground;
	}
}

// Inherit the parent event
event_inherited();

