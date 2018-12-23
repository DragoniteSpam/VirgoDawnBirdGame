var m=add_model_template('Cauldron Knockover', Models.gen_cauldron_knock, 'A cauldron. You can hit it with the Staff of Shoving and stuff might pop out of it!', EntityCauldronK);
m.list[| 0].spawn_name="Cauldron";
//m.list[| 0].spawn_cutscene_index[0]=Cutscenes.chest;

return m;
