/// model d3d_model_create_manually(file);

var f=file_text_open_read(argument0);
var m=d3d_model_create();
d3d_model_primitive_begin(m, pr_trianglelist);

file_text_readln(f);
file_text_readln(f);

while (!file_text_eof(f)){
    var line=split(file_text_read_string(f));
    var type=rdeq(line);
    file_text_readln(f);
    var xx=0;
    var yy=0;
    var zz=0;
    var nx=0;
    var ny=0;
    var nz=0;
    var xtex=0;
    var ytex=0;
    var color=c_white;
    var alpha=1;
    switch (type){
        case 2: // vertex
            xx=rdeq(line);
            yy=rdeq(line);
            zz=rdeq(line);
            break;
        case 3: // vertex color
            xx=rdeq(line);
            yy=rdeq(line);
            zz=rdeq(line);
            color=rdeq(line);
            alpha=rdeq(line);
            break;
        case 4: // vertex texture
            xx=rdeq(line);
            yy=rdeq(line);
            zz=rdeq(line);
            xtex=rdeq(line);
            ytex=rdeq(line);
            break;
        case 5: // vertex texture color
            xx=rdeq(line);
            yy=rdeq(line);
            zz=rdeq(line);
            xtex=rdeq(line);
            ytex=rdeq(line);
            color=rdeq(line);
            alpha=rdeq(line);
            break;
        case 6: // vertex normal
            xx=rdeq(line);
            yy=rdeq(line);
            zz=rdeq(line);
            nx=rdeq(line);
            ny=rdeq(line);
            nz=rdeq(line);
            break;
        case 7: // vertex color
            xx=rdeq(line);
            yy=rdeq(line);
            zz=rdeq(line);
            nx=rdeq(line);
            ny=rdeq(line);
            nz=rdeq(line);
            color=rdeq(line);
            alpha=rdeq(line);
            break;
        case 8: // vertex texture
            xx=rdeq(line);
            yy=rdeq(line);
            zz=rdeq(line);
            nx=rdeq(line);
            ny=rdeq(line);
            nz=rdeq(line);
            xtex=rdeq(line);
            ytex=rdeq(line);
            break;
        case 9: // vertex normal texture color
            xx=rdeq(line);
            yy=rdeq(line);
            zz=rdeq(line);
            nx=rdeq(line);
            ny=rdeq(line);
            nz=rdeq(line);
            xtex=rdeq(line);
            ytex=rdeq(line);
            color=rdeq(line);
            alpha=rdeq(line);
            break;
        default:
            // all else is ignored
            break;
    }
    d3d_model_vertex_normal_texture_colour(m, xx, yy, zz, nx, ny, nz, xtex, ytex, color, alpha);
    ds_queue_destroy(line);
}

d3d_model_primitive_end(m);
file_text_close(f);

return m;
