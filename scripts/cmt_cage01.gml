var m=add_model_template("Cage (Model B)", Models.gen_cage_b, "A cage. Birds live in it.");
var component=instantiate(ModelTemplateComponent);
component.spawn_object=EntityDoor;
component.spawn_model[0]=Models.gen_cage_door;
component.spawn_x[0]=-32;
component.spawn_y[0]=64;
ds_list_add(m.list, component);

return add_model_template_claculate_triangles(m);
