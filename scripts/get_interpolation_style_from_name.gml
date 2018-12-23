/// int get_interpolation_style_from_name(name, default);

for (var i=0; i<array_length_1d(all_interpolation_style_names); i++){
    if (all_interpolation_style_names[i]==argument0){
        return i;
    }
}

return argument1;
