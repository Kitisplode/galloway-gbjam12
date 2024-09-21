event_inherited();

z = 0;
z_height = 16;

solid = true;
pushes_others = true;
position = r3(x,y,z);
normal_vector = r3(0,-1,0);

ds_list_add(global.list_solids, id);

//draw_2d_z = true;