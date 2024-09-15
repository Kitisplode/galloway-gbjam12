if (image_alpha < 0.5) damage = 0;

if (keyboard_check_pressed(global.controls_debug_kill_enemies))
{
	debug_killed = true;
	instance_destroy();
}
else if (global.enemy_kill_signal && !is_boss) instance_destroy();

// Inherit the parent event
event_inherited();

