/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!paused)
{
	if (instance_exists(dom_id) && dom_id != id)
	{
		if (swinging)
		{
			var _swing_amount = dom_id.anim_speed * swing_range * swing_direction;// / (sprite_get_number(dom_id.sprite_index) - 1);
			swung_amount += _swing_amount;
			swing_angle += _swing_amount;
			dom_offset_x = cos(degtorad(swing_angle)) * range;
			dom_offset_y = sin(degtorad(swing_angle)) * -range;
			if (abs(swung_amount) >= swing_range)
			{
				swinging = false;
			}
		}
	}
}

scr_darkness_add_light(id, 0);