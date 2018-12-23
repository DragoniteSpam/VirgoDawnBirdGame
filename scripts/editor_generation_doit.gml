var xbegin=min(edit_generation_x1, edit_generation_x2);
var ybegin=min(edit_generation_y1, edit_generation_y2);
var xend=max(edit_generation_x1, edit_generation_x2);
var yend=max(edit_generation_y1, edit_generation_y2);
var package=ds_map_find_value(all_mod_packages, edit_generation_package);
var m=package.my_models[edit_generation_index];

var area=(xend-xbegin)*(yend-ybegin);

if (edit_map_active_location==noone){
    show_message("You haven't set an Active Location yet! Go do that in Map Settings before doing this, will you?");
    return false;
}

repeat (power(edit_generation_quantity, 2)*area){
    var genx=random_range(xbegin, xend);
    var geny=random_range(ybegin, yend);
    if (c_raycast_world(genx, geny, 4096, genx, geny, 0, COLLISION_PRIMARY)){
        if (instanceof(CollisionGetObject(), Entity)&&package.my_models[CollisionGetObject().model].flag&ModelFlags.is_terrain){
            var ent=add_entity(edit_generation_index, irandom(array_length_1d(m.model_array)-1), genx, geny, 4096);
            if (edit_generation_randomize_xrot){
                ent.xrot=irandom(359);
            }
            if (edit_generation_randomize_yrot){
                ent.yrot=irandom(359);
            }
            if (edit_generation_randomize_zrot){
                ent.direction=irandom(359);
            }
            editor_floor_object(ent);
            
            ent.z=ent.z+random_range(edit_geneartion_z_min, edit_geneartion_z_max);
            editor_apply_transformation(ent);
            ent.checked=true;
        }
    }
}
