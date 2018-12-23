var m=add_model_template('Shed with Trapdoor', Models.gen_underpass, 'A passage to the tunnels beneath the earth.', Entity);
//m.list[| 0].spawn_cutscene_index=Cutscenes.no;

var component=instantiate(ModelTemplateComponent);
component.spawn_object=EntityTeleport;
component.spawn_model[0]=Models.gen_trapdoor;
//component.spawn_cutscene_index[0]=Cutscenes.teleport_general;
ds_list_add(m.list, component);

return m;
