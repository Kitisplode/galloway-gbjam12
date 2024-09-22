/// @description Insert description here
// You can write your code in this editor

position[0] += camera_get_view_x(view_get_camera(0));
position[1] += camera_get_view_y(view_get_camera(0));

// Inherit the parent event
event_inherited();

position[0] -= camera_get_view_x(view_get_camera(0));
position[1] -= camera_get_view_y(view_get_camera(0));