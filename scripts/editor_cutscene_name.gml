/// void editor_cutscene_name(Cutscene);

if (ds_map_exists(cutscene_map, argument0.name)){
    ds_map_delete(cutscene_map, argument0.name);
}

ds_map_add(cutscene_map, argument0.name, argument0);
