/// int get_map_marker_from_name(name, default);

for (var i=0; i<ds_grid_width(teleport_spots); i++){
    if (teleport_spots[# i, 0]==argument0){
        return i;
    }
}

return argument1;
