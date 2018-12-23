/// Flag get_flag_boolean_from_name(name, default);

with (World){
    var n=string_minimal(argument0);
    for (var i=0; i<array_length_1d(boolean_flags); i++){
        if (string_minimal(boolean_flags[i, 1])==n){
            return i;
        }
    }
}

return argument1;
