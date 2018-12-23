/// int get_gender_from_name(name, default);

for (var i=0; i<array_length_1d(all_cutscene_script_player_genders); i++){
    if (all_cutscene_script_player_genders[i]==argument0){
        return i;
    }
}

return argument1;
