/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	// If the reaper comes in sight, shoot it!
	var _camx = camera_get_view_x(view_get_camera(0));
	var _camy = camera_get_view_y(view_get_camera(0));
	if (position[0] > _camx && position[0] < _camx + 160 &&
		position[1] > _camy && position[1] < _camy + 144)
	{
		if (instance_exists(obj_gbjam12_en_reaper))
		{
			var _reaper = obj_gbjam12_en_reaper;
			if (_reaper.position[0] > _camx && _reaper.position[0] < _camx + 160 &&
				_reaper.position[1] > _camy && _reaper.position[1] < _camy + 144)
			{
				var _temp_id = instance_create_depth(x,y, depth - 1, obj_shot_player);
				_temp_id.sprite_index = spr_gb12_level_magic_circle;
				var _dir = point_direction(position[0],position[1], _reaper.position[0], _reaper.position[1]);
				_temp_id.velocity[0] = cos(degtorad(_dir)) * 100;
				_temp_id.velocity[0] = -sin(degtorad(_dir)) * 100;
				
			}
		}
	}
}