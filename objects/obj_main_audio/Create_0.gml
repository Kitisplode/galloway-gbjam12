// ============================================================================
// This object represents the top level audio controller.
// It's responsible for playing music and keeping track of the global audio
// variables.
// ============================================================================
if (instance_number(obj_main_audio) > 1)
{
    instance_destroy(id, false);
    exit;
}

global.volume_main = 1;
global.volume_music = 1;
global.volume_sounds = 1;

music_looped_times = 0;
global.music_current_instance = -1;
global.music_current_id = -1;
global.music_target_id = -1;

global.music_fade_enabled = false;
global.music_fade_time = 2;
global.music_fade_cutoff = 0.05;

global.music_priority = 30;

global.player_sound_priority = 10;

list_music_intros = ds_list_create();
list_music_loops = ds_list_create();

//scr_audio_add_song(mus_neomagiko_title_intro, mus_neomagiko_title_loop);