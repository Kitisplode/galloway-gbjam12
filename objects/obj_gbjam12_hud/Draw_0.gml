/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
//event_inherited();

for (var _i = 0; _i < global.player_hp_max; _i++)
{
	//var _frame = 0;
	//if (_i >= global.player_hp) _frame = 1;
	//draw_sprite(spr_gb12_hud_heart, _frame,
	//			camera_get_view_x(view_get_camera(0)) + 8 + 12 * _i,
	//			camera_get_view_y(view_get_camera(0)) + 8);
	var _temp_hp_max = global.player_hp_max;
	var _temp_hp = global.player_hp_max;
	draw_sprite(spr_gb12_hud_heart_02, _temp_hp mod 4, -16,0);
	for (var _i = 1; _i < _temp_hp_max / 4; _i += 1)
	{
		var _frame = 0;
		if (_i*4 >= _temp_hp) _frame = 4;
		draw_sprite(spr_gb12_hud_heart_02, _frame, -15, 6 + _i * 8);
	}
}

//draw_rectangle_color(-16,0,   0,144,   c_black,c_black,c_black,c_black, 0);
//draw_rectangle_color(1,1, 142,142, c_white,c_white,c_white,c_white, 1);

//if (instance_exists(obj_base_player))
//{
//	var _temp_hp_max = obj_base_player.hp_max;
//	var _temp_hp = obj_base_player.hp;
//	//for (var _i = 0; _i < _temp_hp_max && _i < 8; _i += 1)
//	//{
//	//	var _frame = 0;
//	//	if (_i >= _temp_hp) _frame = 1;
//	//	var _sprite = spr_hud_heart;
//	//	if (_i == 0) _sprite = spr_hud_heart_big;
//	//	draw_sprite(_sprite, _frame, 0, _i * 8);
//	//}
	draw_sprite(spr_hud_heart_multipart_small, _temp_hp mod 4, -16,0);
	for (var _i = 1; _i < _temp_hp_max / 4; _i += 1)
	{
		var _frame = 0;
		if (_i*4 >= _temp_hp) _frame = 1;
		draw_sprite(spr_hud_heart_big, _frame, -15, 6 + _i * 8);
	}
//}

//event_inherited();