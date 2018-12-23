/// int get_movement_script_from_name(name, default);

for (var i=0; i<array_length_1d(all_cutscene_script_movement_scripts); i++){
    if (all_cutscene_script_movement_scripts[i]==argument0){
        return i;
    }
}

return argument1;
