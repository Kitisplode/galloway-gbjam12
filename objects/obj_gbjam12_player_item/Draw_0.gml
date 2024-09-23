/// @description Insert description here
// You can write your code in this editor

anim_speed = dom_id.anim_speed*2;
sprite_index = spr_gb12_player_item_sword_swing;

var _temp_y = dom_id.position[1] - dom_id.position[2];
draw_sprite_ext(sprite_index, anim_frame,
				dom_id.position[0] + dom_id.shake[0],
				_temp_y + dom_id.shake[1],
				abs(dom_id.image_xscale) + dom_id.pump[0],
				dom_id.image_yscale + dom_id.pump[1],
				dom_id.direction_facing * 90, dom_id.image_blend, dom_id.image_alpha);

// Inherit the parent event
//event_inherited();
