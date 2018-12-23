/// Cutscene ID get_cutscene_from_name(name, default)

for (var i=0; i<ds_list_size(all_cutscenes); i++){
    if (string_minimal(all_cutscenes[| i].name)==string_minimal(argument0)){
        return all_cutscenes[| i].cutscene_id;
    }
}

return argument1;
