var m=add_model_template('Heart', Models.extra_heart, 'A heart. You can walk into it to gain health.', EventRestoreHP);
m.spawn_cutscene_index[0]=get_cutscene_from_name("Restore HP", 0);

return m;
