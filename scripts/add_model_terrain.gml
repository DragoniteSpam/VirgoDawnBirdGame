#define add_model_terrain
/// Model add_model_terrain(buffer, xx, yy);

return 0;

#define add_model_water
/// model add_model_water();

var model=d3d_model_create();
d3d_model_primitive_begin(model, pr_trianglelist);
var list=ds_list_create();

var f=file_text_open_read(DEFAULT_WATER_PATH);
file_text_readln(f);
file_text_readln(f);
do {
    var line=split(file_text_read_string(f), ' ');
    file_text_readln(f);
    switch (rdeq(line)){
        case 9:
            with (instance_create(0, 0, PointClass)){
                x=rdeq(line);
                y=rdeq(line);
                z=rdeq(line);
                rdeq(line);
                rdeq(line);
                rdeq(line);
                xtex=rdeq(line);
                ytex=rdeq(line);
                color=rdeq(line);
                alpha=rdeq(line);
                ds_list_add(list, id);
            }
            break;
        default:
            break;
    }
    ds_queue_destroy(line);
} until(file_text_eof(f));
file_text_close(f);

// for each cell in the constraints
var ws2=WORLD_SIZE/2;
for (var i=-ws2; i<ws2; i++){
    for (var j=-ws2; j<ws2; j++){
        // go through the list
        for (var index=0; index<ds_list_size(list); index++){
            var point=list[| index];
            d3d_model_vertex_normal_texture_colour(model, 512+1024*i+point.x, 512+1024*j+point.y, point.z,
                1, 1, 1, point.xtex, point.ytex, point.color, point.alpha);
            if (index>0&&index%3==0){
                model_water_triangles++;
            }
        }
    }
}

ds_list_destroy(list);
d3d_model_primitive_end(model);
with (PointClass){
    instance_destroy();
}

return model;

#define add_model_water_top
/// model add_model_water_top();

var model=d3d_model_create();
d3d_model_primitive_begin(model, pr_trianglelist);
var list=ds_list_create();

// i know default-w.d3d.top.d3d is a weird name but please stop deleting it
// from the resource tree becauses i need it?
var f=file_text_open_read(DEFAULT_WATER_PATH+'.top.d3d');
file_text_readln(f);
file_text_readln(f);
do {
    var line=split(file_text_read_string(f), ' ');
    file_text_readln(f);
    switch (rdeq(line)){
        case 9:
            with (instance_create(0, 0, PointClass)){
                x=rdeq(line);
                y=rdeq(line);
                z=rdeq(line);
                nx=rdeq(line);
                ny=rdeq(line);
                nz=rdeq(line);
                xtex=rdeq(line);
                ytex=rdeq(line);
                color=rdeq(line);
                alpha=rdeq(line);
                ds_list_add(list, id);
            }
            break;
        default:
            break;
    }
    ds_queue_destroy(line);
} until(file_text_eof(f));
file_text_close(f);

// for each cell in the constraints
var ws2=WORLD_SIZE/2;
for (var i=-ws2; i<ws2; i++){
    for (var j=-ws2; j<ws2; j++){
        // go through the list
        for (var index=0; index<ds_list_size(list); index++){
            var point=list[| index];
            d3d_model_vertex_normal_texture_colour(model, 512+1024*i+point.x, 512+1024*j+point.y, point.z,
                point.nx, point.ny, point.nz, point.xtex, point.ytex, point.color, point.alpha);
            if (index>0&&index%3==0){
                model_water_triangles++;
            }
        }
    }
}

ds_list_destroy(list);
d3d_model_primitive_end(model);
with (PointClass){
    instance_destroy();
}

return model;

#define add_model_collision_skip
///add_model_collision_skip(buffer)

var size=buffer_get_size(argument0);

for (var i=0; i<size; i+=9){
    xx=buffer_read(argument0, buffer_s16);
    yy=buffer_read(argument0, buffer_s16);
    zz=buffer_read(argument0, buffer_s16);
    xx2=buffer_read(argument0, buffer_s16);
    yy2=buffer_read(argument0, buffer_s16);
    zz2=buffer_read(argument0, buffer_s16);
    xx3=buffer_read(argument0, buffer_s16);
    yy3=buffer_read(argument0, buffer_s16);
    zz3=buffer_read(argument0, buffer_s16);
    if (0==xx2&&0==xx3&&0==yy2&&0==yy3&&0==zz2&&0==zz3){
        break;
    }
}