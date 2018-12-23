var m=add_model_template('Wrecking Ball Crane', Models.gen_wrecking_ball_body, 'A crane with a wrecking ball attached.', EntityWreckingBall);

var component=instantiate(ModelTemplateComponent);
component.spawn_model[0]=Models.gen_wrecking_ball_base;
ds_list_add(m.list, component);

return m;
