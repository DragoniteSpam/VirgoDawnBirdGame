var m=add_model_template('House 02', Models.gen_house_02, 'A house, style 02.');

var component=instantiate(ModelTemplateComponent);
component.spawn_object=EntityDoor;
component.spawn_model[0]=Models.gen_house_door;
component.spawn_x[0]=4;
component.spawn_y[0]=64;
component.spawn_z[0]=4;
ds_list_add(m.list, component);

return m;
