var m=add_model_template("Bowl", Models.gen_bowl_empty_l, "A bowl for food or water. You can fill it, or empty it.", EntityBowl);
m.list[| 0].spawn_name="Food Bowl";
m.list[| 0].spawn_cutscene_index[0]=Cutscenes.fill_bowl;

return add_model_template_claculate_triangles(m);
