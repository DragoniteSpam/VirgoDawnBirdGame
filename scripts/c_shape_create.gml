#define c_shape_create
///c_shape_create([path])
/*
Creates an empty shape and returns the id.
A shape can be used by any number of objects and can contain any number of sub-shapes.
*/

if (argument_count==1){
    var s=c_shape_create();
    c_shape_begin_trimesh();
    c_shape_load_trimesh(argument[0]);
    c_shape_end_trimesh(s);
    return s;
}
return external_call(global._c_shape_create);

#define c_shape_create_buffer
///c_shape_create_buffer(shape, buffer)

var triangles=0;
var buffer=argument1;
var size=buffer_get_size(buffer);

c_shape_begin_trimesh();

for (var i=0; i<size; i+=9){
    xx=buffer_read(buffer, buffer_s16);
    yy=buffer_read(buffer, buffer_s16);
    zz=buffer_read(buffer, buffer_s16);
    xx2=buffer_read(buffer, buffer_s16);
    yy2=buffer_read(buffer, buffer_s16);
    zz2=buffer_read(buffer, buffer_s16);
    xx3=buffer_read(buffer, buffer_s16);
    yy3=buffer_read(buffer, buffer_s16);
    zz3=buffer_read(buffer, buffer_s16);
    if (0==xx2&&0==xx3&&0==yy2&&0==yy3&&0==zz2&&0==zz3){
        break;
    }
    c_shape_add_triangle(xx, yy, zz, xx2, yy2, zz2, xx3, yy3, zz3);
    triangles++;
}

c_shape_end_trimesh(argument0);

return triangles;