/// void Entity.draw_waypoint_npc([texture]);

if (mode==GameModes.edit_object){
    var base=model;
    var mdl=get_model_object();
    var tex=World.tex_snow;
    var show=false;
    var ind=model_index;
    switch (argument_count){
        case 1:
            tex=argument[0];
        case 0:
            mdl=ds_map_find_value(all_mod_packages, BASE_ASSET).my_models[World.mdl_npc];
            break;
    }

    matrix(x, y, z, xrot, yrot, direction, 0.5, 0.5, 0.5);
    d3d_model_draw_selective(mdl.model_array[ind], 0, 0, 0, tex, mod_package, base);
    draw_reset_transform_stack();
}
