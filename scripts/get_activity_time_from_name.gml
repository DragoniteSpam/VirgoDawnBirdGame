/// Flag get_activity_time_from_name(name, default);

with (World){
    var n=string_minimal(argument0);
    for (var i=0; i<array_length_1d(day_time_name); i++){
        if (string_minimal(day_time_name[i])==n){
            return i;
        }
    }
}

return argument1;
