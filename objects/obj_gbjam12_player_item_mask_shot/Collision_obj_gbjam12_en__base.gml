/// @description Insert description here
// You can write your code in this editor
if (other.can_possess)
{
	var _temp_id = instance_create_depth(other.x,other.y, 0, other.cap_index);
	_temp_id.z = other.z;
	_temp_id.position[2] = other.position[2];
	
	instance_destroy(other);
	if (instance_exists(creator_ID)) instance_destroy(creator_ID);
	instance_destroy();
	
	play_sound(snd_gbjam12_player_cap, 1, 0, 1, 1,0);
}