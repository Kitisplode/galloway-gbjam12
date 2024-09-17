/// @description Insert description here
// You can write your code in this editor
var _temp = ds_list_find_index(list_hits, other.id);
if (_temp == -1)
{
	ds_list_add(list_hits, other.id);
	button_pushed = !button_pushed;
	
	if (ds_list_size(list_hits) > 10)
	{
		ds_list_delete(list_hits, 0);
	}
}