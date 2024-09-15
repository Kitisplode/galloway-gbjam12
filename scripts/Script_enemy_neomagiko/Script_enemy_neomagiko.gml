
function scr_force_on_screen(_force)
{
	var temp_direction = degtorad(direction_cardinal(x,y, room_width / 2,room_height / 2));
	velocity_x += cos(temp_direction) * _force;
	velocity_y -= sin(temp_direction) * _force;
}

// Call only from a draw call.
function scr_draw_marker(_distance_from_room_edge)
{
	var temp_distance = _distance_from_room_edge;
	// Draw a marker if the enemy is offscreen
	if (scr_check_off_screen_self(0))
	{
	    var tempX = temp_distance;
		var tempY = clamp(y, temp_distance, room_height - temp_distance);
	    var angle = 180;
	    if (bbox_right < 0)
	    {
	        // Left edge
	        if (bbox_bottom > 0 && bbox_top < room_height)
	        {
	            // nothing this is the default value
	        }
	        // Top left corner
	        else if (bbox_bottom < 0)
	        {
	            tempY = temp_distance;
	            angle = 135;
	        }
	        // Bottom left corner
	        else if (bbox_top > room_height)
	        {
	            tempY = room_height - temp_distance;
	            angle = 225;
	        }
	    }
	    else if (bbox_left > room_width)
	    {
	        // Right edge
	        if (bbox_bottom > 0 && bbox_top < room_height)
	        {
	            tempX = room_width - temp_distance;
	            angle = 0;
	        }
	        // Top right corner
	        else if (bbox_bottom < 0)
	        {
	            tempX = room_width - temp_distance;
	            tempY = temp_distance;
	            angle = 45;
	        }
	        // Bottom right corner
	        else if (bbox_top > room_height)
	        {
	            tempX = room_width - temp_distance;
	            tempY = room_height - temp_distance;
	            angle = 315;
	        }
	    }
	    else
	    {
	        // Top edge
	        if (bbox_bottom < 0)
	        {
	            tempX = clamp(x, temp_distance, room_width - temp_distance);
	            tempY = temp_distance;
	            angle = 90;
	        }
	        // Bottom edge
	        else if (bbox_top > room_height)
	        {
	            tempX = clamp(x, temp_distance, room_width - temp_distance);
	            tempY = room_height - temp_distance;
	            angle = 270;
	        }
	    }
	    draw_sprite_ext(spr_marker, 0, tempX,tempY, 1,1, angle, c_white, 1);
	}
}

// Call from an object / enemy
//function scr_bounce_off_screen_edges(bounceBounds) {
//	bounced = false;
//	if (velocity_x < 0 && bbox_left < 0 + bounceBounds || 
//		velocity_x > 0 && bbox_right > room_width - bounceBounds)
//	{
//	    wall_stopped_direction = global.AXIS_X;
//		event_user(1);
//	    bounced = true;
//	}

//	if (velocity_y < 0 && bbox_top < 0 + bounceBounds || 
//		velocity_y > 0 && bbox_bottom > room_height - bounceBounds)
//	{
//		wall_stopped_direction = global.AXIS_Y;
//		event_user(1);
//	    bounced = true;
//	}
//	return bounced;
//}

//function scr_bounce_off_screen_edges_nonbbox(bounce_bounds_x, bounce_bounds_y)
//{
//	bounced = false;
//	if (velocity_x < 0 && x - bounce_bounds_x < 0 ||
//		velocity_x > 0 && x + bounce_bounds_x > room_width)
//	{
//		wall_stopped_direction = global.AXIS_X;
//		event_user(1);
//		bounced = true;
//	}
//	if (velocity_y < 0 && y - bounce_bounds_y < 0 ||
//		velocity_y > 0 && y + bounce_bounds_y > room_height)
//	{
//		wall_stopped_direction = global.AXIS_Y;
//		event_user(1);
//		bounced = true;
//	}
//	return bounced;
//}

function scr_spawn_projectiles_random_spread(_projectile_count, _projectile_distance, _projectile_direction,
									_projectile_index, _projectile_spread_range, _depth = -5)
{
	for (var _i = 0; _i < _projectile_count; _i++)
	{
		var temp_angle = degtorad(_projectile_direction + random_range(-_projectile_spread_range, _projectile_spread_range));
		var temp_velx = cos(temp_angle);
		var temp_vely = -sin(temp_angle);
		var temp_ID = instance_create_depth(x + temp_velx * _projectile_distance,
											y + temp_vely * _projectile_distance,
											depth + _depth, _projectile_index);
		if (!instance_exists(temp_ID)) continue;
		temp_ID.velocity[0] = temp_velx * temp_ID.total_max_speed;
		temp_ID.velocity[1] = temp_vely * temp_ID.total_max_speed;
		temp_ID.damage_color = damage_color;
		temp_ID.creator_ID = id;
	}
}

// Spawns an evenly spaced fan of the specified object around the caller's position, each pointing outwards.
function scr_spawn_projectiles_fan(_projectile_count, _projectile_distance, _projectile_direction,
									_projectile_index, _projectile_fan_range, _depth = -5)
{
	var temp_projectile_count = _projectile_count;
	if (_projectile_fan_range < 360)
	{
		_projectile_direction -= _projectile_fan_range / 2;
		temp_projectile_count = _projectile_count - 1;
	}
	for (var i = 0; i < _projectile_count; i += 1)
	{
		var temp_angle = degtorad(_projectile_direction +
								  i * _projectile_fan_range / (temp_projectile_count));
		var temp_velx = cos(temp_angle);
		var temp_vely = -sin(temp_angle);
		var temp_ID = instance_create_depth(x + temp_velx * _projectile_distance,
											y + temp_vely * _projectile_distance,
											depth + _depth, _projectile_index);
		if (!instance_exists(temp_ID)) continue;
		temp_ID.velocity[0] = temp_velx * temp_ID.total_max_speed;
		temp_ID.velocity[1] = temp_vely * temp_ID.total_max_speed;
		temp_ID.damage_color = damage_color;
		temp_ID.creator_ID = id;
	}								
}

// Spawns an evenly spaced ring of the specified object around the caller's position, each pointing outwards.
function scr_spawn_projectiles_ring(_projectile_count, _projectile_distance, _projectile_direction,
									_projectile_index, _depth = -5)
{
	scr_spawn_projectiles_fan(_projectile_count, _projectile_distance, _projectile_direction,
							  _projectile_index, 360, _depth)
}

function scr_enemy_fade()
{
	image_alpha -= alpha_decrement * global.game_speed_scale;
    if (image_alpha <= alpha_cutoff)
    {
        damage = 0;
        image_alpha -= alpha_decrement * 75 * global.game_speed_scale;
        if (image_alpha <= 0)
            instance_destroy();
    }	
}