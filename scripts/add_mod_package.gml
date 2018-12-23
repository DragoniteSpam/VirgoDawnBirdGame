/// ModPackage add_mod_package(name, path, [set initial values?]);

with (instantiate(ModPackage, argument[0])){
    // urgh
    var added=false;
    for (var i=0; i<array_length_1d(all_mod_packages_array); i++){
        if (all_mod_packages_array[i]==noone){
            all_mod_packages_array[i]=id;
            var added=true;
            break;
       }
    }
    // this will end up extending the array but that's okay because it's only done once (ideally)
    if (!added){
        all_mod_packages_array[array_length_1d(all_mod_packages_array)]=id;
    }
    ds_map_add(all_mod_packages, argument[0], id);
    
    // this needs to be the path relative to . and not just a filename
    // also it requires the file extension(s)
    path=argument[1];
    
    switch (argument_count){
        // etc.
        case 3:
            if (argument[2]){
                my_bgm[0]=add_bgm("Silence", "Silence", true, bgm_silence, '', '');
                my_bgm[0].mod_package=argument[0];
                
                my_audio_groups[0]=add_audio('DefaultAudioGroup'+argument[0], 'Default Audio Group '+argument[0]);
                my_audio_groups[0].mod_package=argument[0];
            
                my_items[0]=add_item("DefaultItem"+argument[0], "Default Item "+argument[0], "Default Items "+argument[0], IPockets.GENERAL, 500, 0, 255, 0, 0, 0);
                my_items[0].mod_package=argument[0];
                
                my_models[0]=add_model("DefaultModel"+argument[0], "Default Model "+argument[0], '', '', '');
                my_models[0].mod_package=argument[0];
                
                my_npcs[0]=add_npc('DefaultNPC'+argument[0], "Default NPC "+argument[0], false);
                my_npcs[0].mod_package=argument[0];
                
                my_recipes[0]=add_cooking_recipe('DefaultRecipe'+argument[0], "Default Recipe "+argument[0], BASE_ASSET, 0, BASE_ASSET, 0, BASE_ASSET, 1);
                my_recipes[0].mod_package=argument[0];
                
                my_item_effects[0]=add_item_effect('DefaultItemEffect'+argument[0], null);
                my_item_effects[0].mod_package=argument[0];
                
                my_maps[0]=add_map('DefaultMap'+argument[0], "Default Map "+argument[0], '', false, true, BooleanFlags.unlocked, RD_NEAR, true, false, 0);
                my_maps[0].mod_package=argument[0];
                
                my_pressure_plate_actions[0]=add_pressure_plate_action('DefaultPressurePlateACtion'+argument[0], "Default Pressure Plate Action "+argument[0], null, null);
                my_pressure_plate_actions[0].mod_package=argument[0];
            }
            break;
    }
    
    return id;
}
