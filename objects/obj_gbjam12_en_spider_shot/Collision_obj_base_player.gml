/// @description Insert description here
// You can write your code in this editor

if (other.id != creator_id)
{
	scr_effect_create(x,y, spr_gb12_ef_pop, 0.25, OBJECT_DEPTHS.EFFECT);

	instance_destroy();
}