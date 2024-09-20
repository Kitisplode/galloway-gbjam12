/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!is_on_ground) exit;

// First, pick a tile.
var _tile = r3_zero();
var _direction = scr_snap_dir_to_compass(direction_aiming);
if (_direction == 0) r3_add(_tile, [1,0,0], _tile);
else if (_direction == 45) r3_add(_tile, [1,-1,0], _tile);
else if (_direction == 90) r3_add(_tile, [0,-1,0], _tile);
else if (_direction == 135) r3_add(_tile, [-1,-1,0], _tile);
else if (_direction == 180) r3_add(_tile, [-1,0,0], _tile);
else if (_direction == 225) r3_add(_tile, [-1,1,0], _tile);
else if (_direction == 270) r3_add(_tile, [0,1,0], _tile);
else if (_direction == 315) r3_add(_tile, [1,1,0], _tile);
r3_scale(_tile, 16, _tile);


r3_add(_tile, position, _tile);
// Set the target position
// TODO

// Find the distance to the tile.
var _xyangle = point_direction(x,y, _tile[0],_tile[1]);
var _dist = point_distance(x,y, _tile[0],_tile[1]);
var _temp = _dist * force_gravity;
_temp = sqrt(_temp);

velocity[0] = cos(degtorad(_xyangle)) * cos(degtorad(45));
velocity[1] = -sin(degtorad(_xyangle)) * cos(degtorad(45));
velocity[2] = 1;
var _scale = 10;
if (_direction == 45 || _direction == 135 || _direction == 225 || _direction == 315) _scale = 9;
r3_scale(velocity, _temp * _scale, velocity);

play_sound(snd_gbjam12_statue_jump, 2, 0, 1,4,0.25);