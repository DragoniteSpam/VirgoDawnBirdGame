/// Flag get_compass_point_from_name(name, default);

with (World){
    var n=string_minimal(argument0);
    for (var i=0; i<array_length_1d(compass_point_names); i++){
        if (string_minimal(compass_point_names[i])==n){
            return i;
        }
    }
}

return argument1;
