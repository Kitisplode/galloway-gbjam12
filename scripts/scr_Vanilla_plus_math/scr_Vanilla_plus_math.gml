function scr_is_odd(_value)
{
	return _value % 2 == 1;
}

function scr_is_even(_value)
{
	return !scr_is_odd(_value);
}

	// @description Returns a smart flooring, so 1.9 rounds to 1 and -1.9 rounds to -1
function scr_smart_floor(_number)
{
	return floor(abs(_number)) * sign(_number);
}

	// @description Returns the fractional part of a smart floor so 1.9 returns 0.9 and -1.9 returns -0.9
function scr_smart_floor_remainder(_number)
{
	return _number - scr_smart_floor(_number);
}

function scr_constrain_value(_new_value, _min_value, _max_value)
{
	var _temp_value = _new_value;
	if (_temp_value < _min_value) _temp_value = _min_value;
	else if (_temp_value > _max_value) _temp_value = _max_value;
	return _temp_value;
}