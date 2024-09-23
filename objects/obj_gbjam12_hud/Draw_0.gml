/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
//event_inherited();

draw_sprite(spr_gb12_hud_base, 0,
			camera_get_view_x(view_get_camera(0)),
			camera_get_view_y(view_get_camera(0)));
var _hp = global.player_hp;
var _hpm = global.player_hp_max;
for (var _i = 0; _i < global.player_hp_max / 4; _i++)
{
	var _frame = 0;
	if (_i * 4 >= _hp) _frame = 4;
	else if ((_i + 1) * 4 >= _hp) _frame = global.player_hp mod 4;
	draw_sprite(spr_gb12_hud_heart_02, _frame,
					camera_get_view_x(view_get_camera(0)) + 7,
					camera_get_view_y(view_get_camera(0)) + 10 + 12 * _i);
}