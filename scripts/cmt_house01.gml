var m=add_model_template('House 01', Models.gen_house_01, 'A house, style 01.');

var component=instantiate(ModelTemplateComponent);
component.spawn_object=EntityDoor;
component.spawn_model[0]=Models.gen_house_door;
component.spawn_x[0]=4;
component.spawn_y[0]=64;
component.spawn_z[0]=4;
ds_list_add(m.list, component);

return m;
