var m=add_model_template('Library', Models.gen_library, 'A library.');

var component=instantiate(ModelTemplateComponent);
component.spawn_object=EntityDoor;
component.spawn_model[0]=Models.gen_house_door;
component.spawn_x[0]=60;
component.spawn_y[0]=128;
component.spawn_z[0]=4;
ds_list_add(m.list, component);

return m;
