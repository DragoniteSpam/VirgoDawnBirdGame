var m=add_model_template('Rock B', Models.gen_rockb, 'The B-model rock. Created with a random orientation so it looks different.', Entity);
//m.list[| 0].spawn_cutscene_index=Cutscenes.no;
m.list[| 0].spawn_name='';

m.list[| 0].spawn_xrot[35]=0;
m.list[| 0].spawn_yrot[35]=0;
m.list[| 0].spawn_zrot[35]=0;

for (var i=0; i<36; i++){
    m.list[| 0].spawn_xrot[i]=i*10;
    m.list[| 0].spawn_yrot[i]=i*10;
    m.list[| 0].spawn_zrot[i]=i*10;
}

return m;
