/// @description Insert description here
// You can write your code in this editor

if (direction_facing <= 2) direction_facing = 3;

var _temp_id = instance_create_depth(x,y, depth, enemy_index);
_temp_id.z = z;
_temp_id.position[2] = position[2];
_temp_id.stunned = true;
		
var _temp_x = x - sprite_get_xoffset(sprite_index) + sprite_width / 2 * image_xscale;
var _temp_y = y - sprite_get_yoffset(sprite_index) + sprite_height / 2 + 16;
_temp_id = instance_create_depth(_temp_x,_temp_y, depth, obj_gbjam12_player);
_temp_id.z = z + 2;
_temp_id.position[2] = position[2] + 2;
_temp_id.direction_aiming = direction_aiming;
_temp_id.direction_facing = direction_facing;
_temp_id.velocity[0] = cos(degtorad(direction_facing * 90)) * 100;
_temp_id.velocity[1] = sin(degtorad(direction_facing * 90)) * -100;
_temp_id.velocity[2] = 250;
		
scr_effect_create(_temp_x,_temp_y, spr_gb12_ef_pop, 0.25, OBJECT_DEPTHS.EFFECT);
play_sound(snd_gbjam12_player_uncap, 1, 0, 1, 1,0);

instance_destroy();