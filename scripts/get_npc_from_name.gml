/// int get_npc_from_name(package, name, default);

var arr=ds_map_find_value(all_mod_packages, argument0).my_npcs;
var c=string_minimal(argument1);

for (var i=0; i<array_length_1d(arr); i++){
    if (string_minimal(arr[i].internal_name)==c){
        return i;
    }
}

return argument2;
