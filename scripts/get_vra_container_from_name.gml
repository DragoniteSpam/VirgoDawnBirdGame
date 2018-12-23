/// VRAContainer get_vra_container_from_name(name, default);

if (ds_map_exists(World.all_vra_containers_map, argument0)){
    return World.all_vra_containers_map[? argument0];
}

return argument1;
