/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!scr_check_off_screen_self(0))
{
	scr_effect_create(x,y, spr_gb12_ef_pop, 0.25, OBJECT_DEPTHS.EFFECT);
	for (var _i = 0; _i < instance_number(obj_gbjam12_level_spider_web); _i++)
	{
		var _temp_id = instance_find(obj_gbjam12_level_spider_web, _i);
		if (instance_exists(_temp_id) && _temp_id.creator_id = creator_id)
		{
			_temp_id.fade_time = 0.5;
		}
	}
	play_sound(snd_gbjam12_spider_spit, 2, 0, 0.75, 1,0);
	var _temp_id = instance_create_depth(floor(x / 16) * 16,floor(y / 16) * 16, -5, obj_gbjam12_level_spider_web);
	_temp_id.z = z-1;
	_temp_id.position[2] = position[2]-1;
	//_temp_id.fade_time = 5;
	_temp_id.creator_id = creator_id;
}