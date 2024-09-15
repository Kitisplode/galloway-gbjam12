// If no player object exists, spawn one.
if (!instance_exists(player_object_index) && active)
{
	event_user(0);
	active = false;
}

event_inherited();