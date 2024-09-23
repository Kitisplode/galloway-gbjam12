/// @description Setup
#macro TILE_SIZE 16

cam = view_camera[0];
camera_set_view_size(cam, 160, 144);
view_width_half = camera_get_view_width(cam) * 0.5;
view_height_half = camera_get_view_height(cam) * 0.5;
x_to = view_width_half;
y_to = view_height_half;

shake_remain = 0;
shake_length = 0;
shake_magnitude = 0;

follow = obj_base_player;

