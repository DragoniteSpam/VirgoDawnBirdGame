/// editor_hud_database_resource_model_vra_list(resource);

var catch=argument0;

for (var i=0; i<ds_list_size(World.all_vra_containers); i++){
    var vra=World.all_vra_containers[| i];
    if (string_length(edit_database_filter)==0||string_count(edit_database_filter, vra.name)>0){
        ds_list_add(edit_database_filter_list, vra);
    }
}
