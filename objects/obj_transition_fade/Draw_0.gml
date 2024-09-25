/// @description Draw the fade as a big rectangle
var _xport = 0;
var _yport = 0;
var _wport = window_get_width();
var _hport = window_get_height();

scr_draw_rectangle_color_alpha(camera_get_view_x(view_get_camera(0)),camera_get_view_y(view_get_camera(0)), 320, 288, fade_color, image_alpha);