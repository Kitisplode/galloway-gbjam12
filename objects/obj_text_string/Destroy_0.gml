/// @description Clean up
// Delete each of the characters before destroying the list.

event_inherited();

while (ds_list_size(list_characters) > 0)
{
	var temp_character_ID = ds_list_find_value(list_characters, 0);
	ds_list_delete(list_characters, 0);
	if (!instance_exists(temp_character_ID))
		continue;
	with (temp_character_ID)
	{
		instance_destroy();	
	}
}
ds_list_destroy(list_characters);