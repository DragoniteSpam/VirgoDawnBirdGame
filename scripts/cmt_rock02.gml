var m=add_model_template('Rock C', Models.gen_rockc, 'The C-model rock. Created with a random orientation so it looks different.', Entity);
//m.list[| 0].spawn_cutscene_index=Cutscenes.no;
m.list[| 0].spawn_name='';

m.list[| 0].spawn_zrot[35]=0;

for (var i=0; i<36; i++){
    m.list[| 0].spawn_zrot[i]=i*10;
}

return m;
