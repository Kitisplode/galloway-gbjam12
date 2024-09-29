/// @description depossess cap
// You can write your code in this editor
var _temp_id = instance_create_depth(x,y, depth, enemy_index);
_temp_id.z = z;
_temp_id.position[2] = position[2];
_temp_id.stunned = true;
		
var _temp_x = x;
var _temp_y = y;
_temp_id = instance_create_depth(_temp_x,_temp_y, depth, obj_gbjam12_player);
_temp_id.z = z + 0;
_temp_id.position[2] = position[2] + 0;
_temp_id.direction_aiming = direction_aiming;
_temp_id.direction_facing = direction_facing;
_temp_id.velocity[0] = cos(degtorad(direction_facing * 90)) * 100;
_temp_id.velocity[1] = sin(degtorad(direction_facing * 90)) * -100;
_temp_id.velocity[2] = 250;
		
scr_effect_create(_temp_x,_temp_y, spr_gb12_ef_pop, 0.25, OBJECT_DEPTHS.EFFECT);
play_sound(snd_gbjam12_player_uncap, 1, 0, 1, 1,0);
		
instance_destroy();