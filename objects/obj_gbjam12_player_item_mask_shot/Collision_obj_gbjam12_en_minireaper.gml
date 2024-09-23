/// @description Insert description here
// You can write your code in this editor
other.phase = 1;
var _temp_x = other.x - sprite_get_xoffset(other.sprite_index) + other.sprite_width / 2;
var _temp_y = other.y - sprite_get_yoffset(other.sprite_index) + other.sprite_height / 2;
scr_effect_create(lerp(x, _temp_x, 0.5),lerp(y, _temp_y, 0.5), spr_gb12_ef_pop, 0.25, OBJECT_DEPTHS.EFFECT);
instance_destroy();