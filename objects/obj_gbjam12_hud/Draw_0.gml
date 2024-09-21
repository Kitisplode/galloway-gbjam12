/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
//event_inherited();

for (var _i = 0; _i < global.player_hp_max; _i++)
{
	var _frame = 0;
	if (_i >= global.player_hp) _frame = 1;
	draw_sprite(spr_gb12_hud_heart, _frame,
				camera_get_view_x(view_get_camera(0)) + 8 + 12 * _i,
				camera_get_view_y(view_get_camera(0)) + 8);
}