/// int d3d_model_load_buffer_ouo(model, buffer);

// Returns the number of triangles loaded.
// 90% faster than the regular d3d_model_load, according to tests

var buffer=argument1;
var triangles=0;
var size=buffer_get_size(buffer);

d3d_model_primitive_begin(argument0, pr_trianglelist);

for (var i=0; i<size; i+=15){
    var xx=buffer_read(buffer, buffer_s16);
    var yy=buffer_read(buffer, buffer_s16);
    var zz=buffer_read(buffer, buffer_s16);
    var xtex=buffer_read(buffer, buffer_s16);
    var ytex=buffer_read(buffer, buffer_s16);
//
    var xx2=buffer_read(buffer, buffer_s16);
    var yy2=buffer_read(buffer, buffer_s16);
    var zz2=buffer_read(buffer, buffer_s16);
    var xtex2=buffer_read(buffer, buffer_s16);
    var ytex2=buffer_read(buffer, buffer_s16);
//
    var xx3=buffer_read(buffer, buffer_s16);
    var yy3=buffer_read(buffer, buffer_s16);
    var zz3=buffer_read(buffer, buffer_s16);
    var xtex3=buffer_read(buffer, buffer_s16);
    var ytex3=buffer_read(buffer, buffer_s16);
//
    if (0==xx2&&0==xx3&&0==yy2&&0==yy3&&0==zz2&&0==zz3){
        break;
    }
    d3d_model_vertex_normal_texture_colour(argument0, xx, yy, zz, 0, 0, 1, xtex/2048, ytex/2048, c_white, 1);
    d3d_model_vertex_normal_texture_colour(argument0, xx2, yy2, zz2, 0, 0, 1, xtex2/2048, ytex2/2048, c_white, 1);
    d3d_model_vertex_normal_texture_colour(argument0, xx3, yy3, zz3, 0, 0, 1, xtex3/2048, ytex3/2048, c_white, 1);
    triangles++;
}

d3d_model_primitive_end(argument0);

return triangles;
