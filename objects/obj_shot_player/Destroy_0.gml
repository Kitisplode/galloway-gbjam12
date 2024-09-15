/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (death_effect > -1)
{
	var _eff_id = scr_effect_create(x, y, death_effect, 0.5, depth - 1);
	_eff_id.image_xscale = image_xscale / 2;
	_eff_id.image_yscale = image_xscale / 2;
}