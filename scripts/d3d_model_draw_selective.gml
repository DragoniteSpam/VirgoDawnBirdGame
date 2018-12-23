/// void d3d_model_draw_selective(model, x, y, z, texture, asset package, base model);

var base=ds_map_find_value(all_mod_packages, argument5).my_models[argument6];

if (base.format==ModelFormats.d3d_model){
    d3d_model_draw(argument0, argument1, argument2, argument3, argument4);
} else {
    // can't switch because these conditions are not mutually exclusvie
    if (draw_mode==Misc.model||draw_mode==Misc.block||draw_mode==Misc.model_and_wireframe){
        vertex_submit(argument0, pr_trianglelist, argument4);
    }
    if (draw_mode==Misc.wireframe||draw_mode==Misc.model_and_wireframe){
        vertex_submit(argument0, pr_linestrip, argument4);
    }
}
