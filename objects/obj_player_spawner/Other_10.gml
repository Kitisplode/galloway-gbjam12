/// @description spawn a player object
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
var _temp_id = instance_create_depth(_temp_x, _temp_y, OBJECT_DEPTHS.PLAYER, player_object_index);
_temp_id.position[2] = _temp_z;
_temp_id.z = _temp_z;
_temp_id.direction = global.player_spawn_direction;
