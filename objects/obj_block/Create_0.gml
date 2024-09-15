event_inherited();

z = depth;
z_height = 15;

solid = true;
pushes_others = true;
position = r3(x,y,z);
normal_vector = r3(0,-1,0);

ds_list_add(global.list_solids, id);

draw_2d_z = true;