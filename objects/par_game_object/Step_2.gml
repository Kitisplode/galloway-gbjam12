/// @description Insert description here
// You can write your code in this editor

if (dom_id != id)
{
	if (instance_exists(dom_id))
	{
		image_angle = dom_id.image_angle;
		var _temp_angle = degtorad(dom_id.image_angle);
		x = dom_id.position[0] + cos(_temp_angle) * dom_offset_x + sin(_temp_angle) * dom_offset_y;
		y = dom_id.position[1] + cos(_temp_angle) * dom_offset_y - sin(_temp_angle) * dom_offset_x;
		z = dom_id.position[2];
		position[0] = x;
		position[1] = y;
		position[2] = z;
		shake[0] += dom_id.shake[0];
		shake[1] += dom_id.shake[1];
	}
	else
		instance_destroy();
}

if (!paused)
{
	if (sparkle_index > -1)
	{
		sparkle_timer -= scr_get_tick_length();
		if (sparkle_timer <= 0)
		{
			sparkle_timer = sparkle_time;
			scr_effect_create(random_range(bbox_left, bbox_right),random_range(bbox_top, bbox_bottom),
							  sparkle_index, sparkle_anim_speed, depth - 5);
			if (sparkle_sound > -1)
			{
				play_sound(sparkle_sound, 2, 0, 0.5, 1, 0.25);
			}
		}
	}
	if (fade_time > -1)
	{
		image_alpha -= scr_get_tick_as_percent(fade_time);
		if (image_alpha <= fade_point) image_alpha -= scr_get_tick_as_percent(fade_time) * 3;
		if (image_alpha <= 0)
		{
			instance_destroy();
			exit;
		}
	}
}