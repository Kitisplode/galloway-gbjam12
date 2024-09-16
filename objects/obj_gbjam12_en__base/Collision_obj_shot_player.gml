/// @description Insert description here
// You can write your code in this editor

var _temp_hp = hp;

// Inherit the parent event
event_inherited();

if (_temp_hp > hp)
{
	hurt_timer = hurt_time;
	if (knockedback_by_hits)
	{
		velocity[0] = shake[0] * 200;
		velocity[1] = shake[1] * 200;
	}
}