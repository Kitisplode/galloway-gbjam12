/// @description Insert description here
// You can write your code in this editor


if (action == 1)
{
	//axis_max_speed = r3(200, 200, 1200);
	friction_ground = 1;
	z_height = 4;
	invincible = true;
}
else
{
	//axis_max_speed = r3(50, 50, 1200);
	friction_ground = 0.6;
	z_height = 16;
	invincible = false;
}

// Inherit the parent event
event_inherited();