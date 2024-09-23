/// @description Insert description here
// You can write your code in this editor
if (!paused)
{
	if (phase == 1)
	{
		phase = 99;
	}
	// This is the phase when the minireaper becomes the reaper.
	else if (phase == 99)
	{
		var _temp_id = instance_create_depth(position[0],position[1], depth - 1, obj_gbjam12_en_reaper);
		global.player_has_mask = false;
		instance_destroy();
	}
}
