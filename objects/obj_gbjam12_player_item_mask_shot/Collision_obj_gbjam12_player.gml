/// @description Insert description here
// You can write your code in this editor
if (other.id == creator_ID && phase > 0 && point_distance(x,y, other.x,other.y) < 8)
{
	instance_destroy();
}