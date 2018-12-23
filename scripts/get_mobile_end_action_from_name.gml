/// int get_mobile_end_action_from_name(name, default);

for (var i=0; i<array_length_1d(mobile_end_action_names); i++){
    if (mobile_end_action_names[i]==argument0){
        return i;
    }
}

return argument1;
