/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var _temp_id = instance_create_depth(x + up_vector[0] * 4,y + up_vector[1] * 4, depth + 1, obj_gbjam12_en_spider_shot);
var _temp_direction = point_direction(0,0, up_vector[0],up_vector[1]);
_temp_id.velocity[0] = cos(degtorad(_temp_direction)) * shot_speed;
_temp_id.velocity[1] = -sin(degtorad(_temp_direction)) * shot_speed;
_temp_id.creator_id = id;