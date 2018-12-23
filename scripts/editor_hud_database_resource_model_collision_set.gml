var container=get_vra_container_from_name(argument0.archive, World.active_vra_container);

argument0.cpath=edit_database_filter_list[| argument1];
argument0.shape=const_model_get(argument0.cpath, container);
argument0.block=const_block_get(argument0.cpath, container);

show_message("Heads up - if there are any entities that use this base model anywhere in the map, the changes "+
    "won't take effect until the map is reloaded. So you may still be colliding with instances of the old mesh.");
