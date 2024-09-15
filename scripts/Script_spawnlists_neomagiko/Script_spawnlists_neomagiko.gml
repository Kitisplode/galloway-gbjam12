

function scr_setup_spawnlists()
{
	global.enemy_current_type = 9999;
	//global.enemy_current_type = 999;
	
	// Splits (Rocks)
	var _i = 1;
	global.enemy_types[_i,0] = obj_nm_en_split_a_01;
	global.enemy_types[_i,1] = obj_nm_en_split_b_01;
	global.enemy_types[_i,2] = obj_nm_en_split_c_01;
	global.enemy_types[_i,3] = obj_nm_en_split_c_01;
	global.enemy_boss[_i] = obj_nm_en_split__boss_01;
	global.enemy_waves[_i,0] = 10;
	global.enemy_waves[_i,1] = 13;
	global.enemy_music[_i,0] = mus_neomagiko_play_intro;
	global.enemy_music[_i,1] = mus_neomagiko_boss_intro;
	global.enemy_done[_i] = false;
	global.enemy_color[_i] = c_gray;
	global.weapon_equipped[_i] = false;
	
	// Armors (Bugs)
	_i = 2;
	global.enemy_types[_i,0] = obj_nm_en_armor_a_01;
	global.enemy_types[_i,1] = obj_nm_en_armor_b_01;
	global.enemy_types[_i,2] = obj_nm_en_armor_c_01;
	global.enemy_types[_i,3] = obj_nm_en_armor_a_01;
	global.enemy_boss[_i] = obj_nm_en_armor__boss_01;
	global.enemy_waves[_i,0] = 10;
	global.enemy_waves[_i,1] = 13;
	global.enemy_music[_i,0] = mus_neomagiko_play_intro;
	global.enemy_music[_i,1] = mus_neomagiko_boss_intro;
	global.enemy_done[_i] = false;
	global.enemy_color[_i] = c_gray;
	global.weapon_equipped[_i] = false;
	
	_i = 3;
	global.enemy_done[_i] = true;
	
	_i = 4;
	global.enemy_done[_i] = true;
	
	_i = 5;
	global.enemy_done[_i] = true;
	
	_i = 6;
	global.enemy_done[_i] = true;
	
	_i = 7;
	global.enemy_done[_i] = true;
	
	_i = 8;
	global.enemy_done[_i] = true;
	
	// Extra enemy types:
	var _i = 9999;
	global.enemy_types[_i,0] = obj_nm_en_cirno_01;
	global.enemy_types[_i,1] = obj_nm_en_cirno_01;
	global.enemy_types[_i,2] = obj_nm_en_cirno_01;
	global.enemy_types[_i,3] = obj_nm_en_cirno_01;
	global.enemy_boss[_i] = obj_nm_en_cirno_01;
	global.enemy_waves[_i,0] = 0;
	global.enemy_waves[_i,1] = 0;
	global.enemy_music[_i,0] = mus_neomagiko_cirno_intro;
	global.enemy_music[_i,1] = mus_neomagiko_cirno_intro;
	global.enemy_done[_i] = false;
	global.enemy_color[_i] = c_gray;
	global.weapon_equipped[_i] = false;
	
	// Tester enemy type
	global.enemy_types[999,0] = obj_nm_en_split_a_01;
	global.enemy_types[999,1] = obj_nm_en_split_a_01;
	global.enemy_types[999,2] = obj_nm_en_split_a_01;
	global.enemy_types[999,3] = obj_nm_en_split_a_01;
	global.enemy_boss[999] = obj_nm_en_split_a_01;
	global.enemy_waves[999,0] = 10;
	global.enemy_waves[999,1] = 12;
	global.enemy_music[999,0] = mus_neomagiko_play_intro;
	global.enemy_music[999,1] = mus_neomagiko_boss_intro;
	global.enemy_done[999] = false;
	global.enemy_color[999] = c_grey;
}

function scr_setup_difficulties()
{
	global.difficulty_max_cost[0] = 3;
	global.difficulty_cost_increment[0] = 0.35;
	
	global.difficulty_max_cost[1] = 4;
	global.difficulty_cost_increment[1] = 0.35;
}