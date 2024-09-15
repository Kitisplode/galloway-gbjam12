if (!invulnerable)
{
	if (damage_timer <= 0)
	{
		hp -= other.damage;
		damage_timer = damage_time;
		if (audio_exists(sound_damage)) play_sound(sound_damage, 1, false, 1,  sound_pitch,0.2 * sound_pitch);
		var _temp_direction = point_direction(other.x,other.y, x,y);
		shake[0] = cos(degtorad(_temp_direction));
		shake[1] = -sin(degtorad(_temp_direction));
	}
}
else
{
	play_sound(snd_enemy_hit_armor, 1, false, 1, sound_pitch,0.2 * sound_pitch);
}

if (block_shots && other.damage < hp_max && !other.piercing)
{
	other.hp = 0;
}