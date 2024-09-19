/// @description Insert description here
// You can write your code in this editor
if (other.can_possess)
{
	var _temp_id = instance_create_depth(other.x + other.up_vector[0],
										other.y + other.up_vector[1],
										0, other.cap_index);
	_temp_id.z = other.z;
	_temp_id.position[2] = other.position[2];
	r3_clone(other.up_vector, _temp_id.up_vector);
	
	instance_destroy(other);
	if (instance_exists(creator_ID)) 
	{
		for (var _i = 0; _i < 7; _i++)
		{
			var _direction = random(360);
			_temp_id = instance_create_depth(creator_ID.x,creator_ID.y, creator_ID.depth, obj_gbjam12_ef_cap_join);
			_temp_id.z = creator_ID.z;
			_temp_id.position[2] = _temp_id.z;
			_temp_id.velocity[0] = cos(degtorad(_direction)) * random(10) * 10;
			_temp_id.velocity[1] = sin(degtorad(_direction)) * random(10) * -10;
			
			var _temp_x = other.x - sprite_get_xoffset(other.sprite_index) + other.sprite_width / 2;
			var _temp_y = other.y - sprite_get_yoffset(other.sprite_index) + other.sprite_height / 2;
			scr_effect_create(creator_ID.x,creator_ID.y, spr_gb12_ef_pop, 0.25, OBJECT_DEPTHS.EFFECT);
			scr_effect_create(lerp(x, _temp_x, 0.5),lerp(y, _temp_y, 0.5), spr_gb12_ef_pop, 0.25, OBJECT_DEPTHS.EFFECT);
		}
		instance_destroy(creator_ID);
	}
	instance_destroy();
	
	play_sound(snd_gbjam12_player_cap, 1, 0, 1, 1,0);
}