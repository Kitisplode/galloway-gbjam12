/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (hp <= 0)
{
	movement_collision = false;
	if ((delayed_death_effect && damage_timer <= 0) || !delayed_death_effect )
		instance_destroy();
}