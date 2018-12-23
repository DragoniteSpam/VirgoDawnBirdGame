/// shape CollisionShapeAdd(file);
var s=c_shape_create();
c_shape_begin_trimesh();
c_shape_load_trimesh(working_directory+'\models\'+argument0+'.d3d');
c_shape_end_trimesh(s);

return s;
