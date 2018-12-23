var container=get_vra_container_from_name(argument0.archive, World.active_vra_container);

argument0.path[edit_database_model_visible_index]=edit_database_filter_list[| argument1];
argument0.model_array[edit_database_model_visible_index]=const_model_get(argument0.path[edit_database_model_visible_index], container);
