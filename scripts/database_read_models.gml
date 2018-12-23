#define database_read_models
/// database_read_models(ModPackage, map);

database_read_generic(argument0, argument1, 'model',
    database_get_models, database_set_models,
    database_read_models_thanks, get_model_from_name, database_set_required_models);

#define database_read_models_thanks
/// Model database_read_models_thanks(base string, map);

with (instantiate(Model)){
    internal_name=argument1[? argument0+"internal_name"];
    name=argument1[? argument0+"name"];
    flag=argument1[? argument0+"flag"];
    summary=argument1[? argument0+"summary"];
    archive=argument1[? argument0+"archive"];
    format=argument1[? argument0+"format"];
    if (string_length(archive)>0){
        var container=get_vra_container_from_name(archive, noone);
        if (container==noone){
            show_message(get_text(Text.warningVRANotFound, argument0.name, archive));
            game_end();
            exit;
        }
        var path_n=argument1[? argument0+"path_n"];
        for (var j=0; j<path_n; j++){
            path[j]=argument1[? argument0+"path_"+string(j)];
            if (string_length(archive)>0){
                print(container.name)
                model_array[j]=const_model_get(path[j], container);
            }
        }
        cpath=argument1[? argument0+"cpath"];
        block=const_block_get(cpath, container);
        shape=const_model_get(cpath, container);
    }
    model_render_distance=argument1[? argument0+"model_render_distance"];
    color=argument1[? argument0+"color"];
    selectable=argument1[? argument0+"selectable"];
    on_hit=argument1[? argument0+"on_hit"];
    textured=argument1[? argument0+"textured"];
    
    return id;
}