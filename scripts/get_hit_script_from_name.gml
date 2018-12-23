/// int get_hit_script_from_name(name, default);

for (var i=0; i<array_length_1d(all_hit_scripts); i++){
    if (string_minimal(script_get_name(all_hit_scripts[i]))==string_minimal(argument0)){
        return i;
    }
}

return argument1;
