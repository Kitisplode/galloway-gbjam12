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
		ds_map_replace(global.map_switches, "reaper_time", true);
		scr_audio_play_song_no_fade(mus_gbjam12_escape_intro);
		instance_destroy();
	}
}
event_inherited();