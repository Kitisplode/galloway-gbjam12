
event_inherited();

ds_list_destroy(string_list);
while (ds_list_size(string_obj_list) > 0)
{
	var temp_string_obj = ds_list_find_value(string_obj_list, 0);
	if (instance_exists(temp_string_obj))
	{
		temp_string_obj.destroy_timer = 0;
		temp_string_obj.fade_rate = fade_rate;
	}
	ds_list_delete(string_obj_list, 0);
}
ds_list_destroy(string_obj_list);