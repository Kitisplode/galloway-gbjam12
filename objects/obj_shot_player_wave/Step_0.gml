// Inherit the parent event
event_inherited();

if (paused) exit;

if (sideways_rate != 0)
{
	sideways_cycle += sideways_rate;
	if (sideways_cycle > 360) sideways_cycle -= 360;
	else if (sideways_cycle < 0) sideways_cycle += 360;

	position[0] += cos(degtorad(image_angle + 90)) * sideways_vel * cos(degtorad(sideways_cycle));
	position[1] -= sin(degtorad(image_angle + 90)) * sideways_vel * cos(degtorad(sideways_cycle));
}