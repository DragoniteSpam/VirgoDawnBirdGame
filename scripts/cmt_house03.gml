var m=add_model_template('House 03', Models.gen_house_03, 'A house, style 03.');

var component=instantiate(ModelTemplateComponent);
component.spawn_object=EntityDoor;
component.spawn_model[0]=Models.gen_house_door;
component.spawn_x[0]=4;
component.spawn_y[0]=64;
component.spawn_z[0]=4;
ds_list_add(m.list, component);

var component=instantiate(ModelTemplateComponent);
component.spawn_object=EntityDoor;
component.spawn_model[0]=Models.gen_house_door;
component.spawn_x[0]=-68;
component.spawn_y[0]=64;
component.spawn_z[0]=4;
component.spawn_zrot[0]=180;
ds_list_add(m.list, component);

var component=instantiate(ModelTemplateComponent);
component.spawn_object=EntityDoor;
component.spawn_model[0]=Models.gen_house_door;
component.spawn_x[0]=-68;
component.spawn_y[0]=-64;
component.spawn_z[0]=4;
component.spawn_zrot[0]=180;
ds_list_add(m.list, component);

var component=instantiate(ModelTemplateComponent);
component.spawn_model[0]=Models.gen_table;
component.spawn_model[1]=Models.gen_table_chairs;
component.spawn_x[0]=96;
component.spawn_y[0]=0;
component.spawn_z[0]=4;
component.spawn_chance=75;
ds_list_add(m.list, component);

return m;
