// Vanilla plus drawing methods
function scr_draw_rectangle_color_alpha(_pos_x, _pos_y, _width, _height, _color, _alpha)
{
	var temp_color = draw_get_color();
	var temp_alpha = draw_get_alpha();
	draw_set_color(_color);
	draw_set_alpha(_alpha);
	draw_rectangle(_pos_x - _width, _pos_y - _height,
				   _pos_x + _width, _pos_y + _height,
				   0);
	draw_set_color(temp_color);
	draw_set_alpha(temp_alpha);	
}

function scr_darken_color(_original_color, _percentage)
{
	var temp_hue = color_get_hue(_original_color);
	var temp_sat = color_get_saturation(_original_color);
	var temp_val = color_get_value(_original_color);
	temp_val *= _percentage;
	return make_color_hsv(temp_hue,temp_sat,temp_val);
}