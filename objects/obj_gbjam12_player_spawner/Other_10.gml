// @description spawn a gbjam player object
var _temp_x = x;
var _temp_y = y;
var _temp_z = z;
if (!is_nan(global.player_spawn_x) &&
	!is_nan(global.player_spawn_y) &&
	!is_nan(global.player_spawn_z))
{
	_temp_x = global.player_spawn_x;
	_temp_y = global.player_spawn_y;
	_temp_z = global.player_spawn_z;
}
_temp_z = 0;
var _temp_index = player_object_index;
if (global.player_spawn_index > 0)
	_temp_index = global.player_spawn_index;
var _temp_id = instance_create_depth(_temp_x, _temp_y, OBJECT_DEPTHS.PLAYER, _temp_index);
_temp_id.position[2] = _temp_z;
_temp_id.z = _temp_z;
_temp_id.direction_facing = global.player_spawn_direction / 90;
_temp_id.direction_aiming = global.player_spawn_direction;

// If the player doesn't have the mask any more, spawn the reaper behind them!
if (!global.player_has_mask && !global.player_vanquished_reaper)
{
	var _dir = degtorad((global.player_spawn_direction + 180) mod 360);
	var _temp_index = instance_create_depth(_temp_x + cos(_dir) * 80, _temp_y - sin(_dir) * 80, OBJECT_DEPTHS.ENEMY, obj_gbjam12_en_reaper);
}