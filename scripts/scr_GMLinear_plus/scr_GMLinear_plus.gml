// Additional methods added to the GMLinear extension r3 vectors.

///@func r3_constrain(v1, r, <vout>)
///@arg {r3} v1 The first 3D vector.
///@arg {Real} r The amount to constrain by.
///@arg {r3} <vout> (Optional) The output 3D vector to overwrite. If unspecified, return a new vector.
///@desc Return 3D vector constrained by r.
function r3_constrain(_v1, r, vout=[0, 0, 0])
{
	return r3_scale(r3_unit(_v1), r, vout);
}

function r3_get_fractional(_v1, vout=[0, 0, 0])
{
	vout[0] = scr_Get_Smart_Floor_Remainder(_v1[0]);
	vout[1] = scr_Get_Smart_Floor_Remainder(_v1[1]);
	vout[2] = scr_Get_Smart_Floor_Remainder(_v1[2]);
	return vout;
}

///@desc Returns the angle between v1 and v2 in radians.
function r3_get_angle_between(_v1, _v2)
{
	if (r3_norm(_v1) == 0 || r3_norm(_v2) == 0) return -1;
	return arccos(r3_dot(_v1,_v2) / (r3_norm(_v1) * r3_norm(_v2)))
}

function r3_get_angle_2d(_v1)
{
	return r3_get_angle_between(_v1, [1,0,0]);
}

function r3_equals(_v1, _v2)
{
	return _v1[0] == _v2[0] && _v1[1] == _v2[1] && _v1[2] == _v2[2];
}

function r3_parallel(_v1, _v2)
{
	return r3_norm(r3_cross(_v1, _v2)) == 0;
}

function r3_perpendicular(_v1, _v2)
{
	return r3_dot(_v1, _v2) == 0;
}

function r3_get_total(_v1)
{
	return abs(_v1[0]) + abs(_v1[1]) + abs(_v1[2]);
}

function tri_r3_translate(_tri, _v, _tri_out=[[0,0,0],[0,0,0],[0,0,0]])
{
	r3_add(_tri[0], _v, _tri_out[0]);
	r3_add(_tri[1], _v, _tri_out[1]);
	r3_add(_tri[2], _v, _tri_out[2]);
	return _tri_out;
}