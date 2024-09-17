/// @description Draw the fade as a big rectangle
var _xport = 0;
var _yport = 0;
var _wport = window_get_width();
var _hport = window_get_height();

scr_draw_rectangle_color_alpha(_xport,_yport, _wport, _hport, fade_color, image_alpha);