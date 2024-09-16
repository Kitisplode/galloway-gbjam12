// If no player object exists, spawn one.
if (!instance_exists(obj_base_player) && active)
{
	event_user(0);
	active = false;
}

event_inherited();