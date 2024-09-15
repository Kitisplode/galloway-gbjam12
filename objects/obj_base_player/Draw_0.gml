
if (invuln_timer <= 0 || (invuln_timer * 100) mod 2 == 1)
	image_alpha = 1;
else image_alpha = 0.5;
	
event_inherited();

