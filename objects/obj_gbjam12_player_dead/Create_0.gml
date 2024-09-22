/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

scr_audio_play_song_fade(-1, 1);
depth = OBJECT_DEPTHS.TRANSITION - 1;

phase = 0;
timer = 0;
wait_time_1 = 1;
wait_time_2 = 1;
wait_time_3 = 3;
wait_time_4 = 5;

sound_index = snd_gbjam12_player_hurt_02;
sounds_total = 5;
sound = sounds_total;
sound_time = 0.2;
sound_timer = 0;
sound_pitch = 1;

id_input = instance_create_depth(0,0, depth - 1, obj_input);
input_continue = "start";
input_continue_2 = "a";
input_continue_3 = "b";
with(id_input)
{
	scr_Input_Add_Verb("start");
	scr_Input_Add_Verb("a");
	scr_Input_Add_Verb("b");
}
id_input.persistent = true;

position[0] -= camera_get_view_x(view_get_camera(0));
position[1] -= camera_get_view_y(view_get_camera(0));
x = position[0];
y = position[1];

global.start_room = room;