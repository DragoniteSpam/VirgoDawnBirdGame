/// land_translate(who);

c_object_set_mask(argument0.object, 0, 0);

if (c_overlap_world_position(argument0.object, argument0.x+delta_x, argument0.y+delta_y, argument0.z+delta_z)==0){
    argument0.x=argument0.x+delta_x;
    argument0.y=argument0.y+delta_y;
    argument0.z=argument0.z+delta_z;
}

c_object_set_mask(argument0.object, argument0.mask, argument0.mask);
