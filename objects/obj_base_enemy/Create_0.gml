/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

creator_ID = -1;

is_boss = false;
hp_max = 1;
hp = hp_max;

damage = 1;

damage_color = c_red;
damage_time = 0.1;
damage_timer = 0;

death_effect_index = -1;
death_effect_size = 1;
delayed_death_effect = false;

death_next_enemy_index = -1;
death_next_enemy_sprite = -2;
death_next_phase = -1;

block_shots = true;
invulnerable = false;

sound_damage = -1;
sound_dead = -1;
sound_pitch = 1;

if (depth == 0) depth = OBJECT_DEPTHS.ENEMY;

ds_list_add(global.list_enemies, id);

debug_killed = false;