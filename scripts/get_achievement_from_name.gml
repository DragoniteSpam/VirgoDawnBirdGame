/// int get_achievement_from_name(name, default);

for (var i=0; i<array_height_2d(ach_names); i++){
    if (ach_names[i, 0]==argument0){
        return i;
    }
}

return argument1;
