/// @description Insert description here
// You can write your code in this editor

alpha_cycle = (alpha_cycle + alpha_cycle_speed) mod 360;
if (!fade_in)
{
	image_alpha = image_alpha + scr_get_tick_length() / 2 + cos(degtorad(alpha_cycle)) / 20;
	if (image_alpha > 1.2)
	{
		fade_in = true;
	}
}
else
{
	image_alpha = 1;
	bob_amount = 0.12;
	alpha_cycle_speed = 5;
}

y += cos(degtorad(alpha_cycle)) * bob_amount;