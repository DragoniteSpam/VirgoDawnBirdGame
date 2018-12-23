/// void d3d_model_draw_selective_item(base model package, base model);

var package=ds_map_find_value(all_mod_packages, argument0);
var base=package.my_models[package.my_items[argument1].model];

if (base.format==ModelFormats.d3d_model){
    d3d_model_draw(base.model_array[0], 0, 0, 0, tex_default);
} else {
    // can't switch because these conditions are not mutually exclusvie
    if (draw_mode==Misc.model||draw_mode==Misc.block||draw_mode==Misc.model_and_wireframe){
        vertex_submit(base.model_array[0], pr_trianglelist, tex_default);
    }
    if (draw_mode==Misc.wireframe||draw_mode==Misc.model_and_wireframe){
        vertex_submit(base.model_array[0], pr_linestrip, tex_default);
    }
}
