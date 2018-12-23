/// void draw_explosion_64f();

// Meant to be drawn all in series.

var dir=point_direction(x, y, Camera.x, Camera.y);

var dx1=x+scale*dcos(dir-90);
var dy1=y-scale*dsin(dir-90);
var dz1=z-scale;
var dx2=x+scale*dcos(dir+90);
var dy2=y-scale*dsin(dir+90);
var dz2=z+scale;

var xframe=t mod 8;
var yframe=t div 8;

var x1=xframe/8;
var y1=yframe/8;
var x2=(xframe+1)/8;
var y2=(yframe+1)/8;

d3d_primitive_begin_texture(pr_trianglelist, background_get_texture(image));

d3d_vertex_texture(dx1, dy1, dz1, x1, y2);
d3d_vertex_texture(dx1, dy1, dz2, x1, y1);
d3d_vertex_texture(dx2, dy2, dz2, x2, y1);
d3d_vertex_texture(dx2, dy2, dz2, x2, y1);
d3d_vertex_texture(dx2, dy2, dz1, x2, y2);
d3d_vertex_texture(dx1, dy1, dz1, x1, y2);

d3d_primitive_end();

if (t++==64){
    instance_destroy();
}
