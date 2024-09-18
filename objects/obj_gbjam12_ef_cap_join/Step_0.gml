/// @description Insert description here
// You can write your code in this editor

if (!paused)
{
	if (instance_exists(obj_base_player))
	{
		var _temp_x = obj_base_player.x - sprite_get_xoffset(obj_base_player.sprite_index) + sprite_get_width(obj_base_player.sprite_index) / 2;
		var _temp_y = obj_base_player.y - sprite_get_yoffset(obj_base_player.sprite_index) + sprite_get_height(obj_base_player.sprite_index) / 2;
		var _dist = point_distance(x,y, _temp_x,_temp_y);
		if (_dist < 1) _dist = 1;
		var _direction = point_direction(x,y, _temp_x,_temp_y);
		velocity[0] += cos(degtorad(_direction)) * 40000 / sqr(_dist);
		velocity[1] -= sin(degtorad(_direction)) * 40000 / sqr(_dist);
		
		if (_dist < 8)
		{
			instance_destroy();
		}
		else if (_dist < 24)
		{
			var _temp_speed = r3_norm(velocity);
			velocity[0] = cos(degtorad(_direction)) * _temp_speed;
			velocity[1] = -sin(degtorad(_direction)) * _temp_speed;
		}
	}
	
	
	scr_darkness_add_light(id, 0);
}

// Inherit the parent event
event_inherited();