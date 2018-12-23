var m=add_model_template('Pressure Plate', Models.gen_pressureplate, 'A pressure plate. You can drop an Entity onto it and have something happen.', EntityPressurePlate);
m.list[| 0].spawn_name="Pressure Plate";
//m.list[| 0].spawn_cutscene_index[0]=Cutscenes.no;
m.list[| 0].spawn_model_index[0]=0;

return m;
