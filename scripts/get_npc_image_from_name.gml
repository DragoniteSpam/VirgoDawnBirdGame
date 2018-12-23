/// Flag get_npc_image_from_name(name, default);

with (World){
    var n=string_minimal(argument0);
    for (var i=0; i<array_length_1d(all_npc_images); i++){
        if (string_minimal(background_get_name(all_npc_images[i]))==n){
            return i;
        }
    }
}

return argument1;
