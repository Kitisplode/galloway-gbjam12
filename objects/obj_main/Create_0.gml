// ============================================================================
// This object represents the top level main game controller.
// Anything that must span between rooms and gamemodes and should be available
// at basically any time the game is running is handled by this.
// ============================================================================

// We never want to have more than one main controller.
if (instance_number(obj_main) > 1)
{
    instance_destroy(id, false);
    exit;
}

// ------------------------------------
// Debug settings.
global.debug_global = true;
global.debug_can_restart_level = true;
global.debug_can_pause = true;
global.debug_player_invincible = false;
global.debug_show_level_controllers = false;

global.controls_debug_kill_enemies = ord("K");
global.controls_debug_restart = ord("R");
global.controls_debug_exit = vk_escape;
global.controls_debug_fullscreen = vk_f4;
global.controls_debug_pause = ord("P");//vk_space;

global.enemy_kill_signal = false;


// ------------------------------------
// Other main controllers.
global.main_audio = instance_create_depth(x,y,depth, obj_main_audio);
global.main_graphics = instance_create_depth(x,y,depth, obj_main_graphics);
global.main_camera = instance_create_depth(x,y,depth,obj_camera);

// ------------------------------------
// Global gameplay constants & variables.
global.GAMEPLAY_FRAMERATE = 60;
//global.GAMEPLAY_ENABLE_MANUAL_FRACTIONAL_MOVEMENT = true;

// Used to track transition states.
enum TRANSITION_STATE
{
	START,
	SWITCH,
	WAIT,
	END
};

// Used to determine what parts of the game should pause while a transition is active.
enum TRANSITION_PAUSE
{
	NONE,
	GAME,
	ANIMATIONS,
	BOTH
};

// Standard object depths.
enum OBJECT_DEPTHS
{
	TRANSITION = -99999,
	HUD = -9000,
	EFFECT = -8000,
	PLAYER = -500,
	ENEMY = -100
};

enum INPUT_STATE
{
	PRESSED,
	HELD,
	RELEASED
};


global.list_solids = ds_list_create();
global.list_pushables = ds_list_create();

global.list_enemies = ds_list_create();

global.map_switches = ds_map_create();

global.paused = false;
global.difficulty = 0;
global.gameplay_speed_scale = 1.0;

global.player_hp_max = 16;
global.player_hp = global.player_hp_max;
global.player_spawn_x = NaN;
global.player_spawn_y = NaN;
global.player_spawn_z = NaN;
global.player_spawn_direction = 270;
global.player_spawn_index = obj_gbjam12_player;
global.player_has_mask = true;
global.player_vanquished_reaper = false;

global.start_room = room;
global.active_room = -1;

global.font_01 = font_add_sprite_ext(spr_font_01_outline, "!" + chr(34) + "#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~ _[]\\", 0,1);
global.font_02 = font_add_sprite_ext(spr_font, "!" + chr(34) + "#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~ _[]\\", 0,1);

randomize();