/// editor_hud_database_resource_item_equip_effect_list(resource);

var catch=argument0;

for (var i=0; i<array_length_1d(all_weapon_effects); i++){
    if (string_length(edit_database_filter)==0||string_count(edit_database_filter, all_weapon_effects[i].name)>0){
        ds_list_add(edit_database_filter_list, i);
    }
}
