// General methods called regarding input handling

// Must be called from obj_input
// Attempts to add the given verb/button name to the input list
// Returns true if successfully added, false if the verb/button name was already present.
function scr_Input_Add_Verb(_verb_name)
{
	return ds_map_add(input_map, _verb_name, r3_zero());
}

// Must be called from in obj_input
function scr_Input_Process()
{
	var _temp_current_key = ds_map_find_first(input_map);
	while (!is_undefined(_temp_current_key))
	{
		var _temp_current_value = ds_map_find_value(input_map, _temp_current_key);
		_temp_current_value[0] = input_check_pressed(_temp_current_key);
		_temp_current_value[1] = input_check(_temp_current_key);
		_temp_current_value[2] = input_check_released(_temp_current_key);
		ds_map_set(input_map, _temp_current_key, _temp_current_value);
		_temp_current_key = ds_map_find_next(input_map, _temp_current_key);
	}
}

// Called from outside object with given obj_input
function scr_Input_Read(_input_object, _verb_name, _state)
{
	return ds_map_find_value(_input_object.input_map, _verb_name)[_state];
}

function scr_Input_Outer_Add_Verb(_input_object, _verb_name)
{
	with (_input_object)
	{
		scr_Input_Add_Verb(_verb_name);
	}
}