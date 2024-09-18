/// @description Insert description here
// You can write your code in this editor

event_inherited();

if (surface_exists(surface_id))
{
	surface_free(surface_id);
}

ds_list_destroy(list_lights);