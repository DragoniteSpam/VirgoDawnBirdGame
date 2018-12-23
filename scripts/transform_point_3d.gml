/// array transform_point_3d(x, y, z, xrot, yrot, zrot);

var xa=argument0;
var ya=argument1;
var za=argument2;
var _xrot=argument3;
var _yrot=argument4;
var _zrot=argument5;

{   // X rotation
    var xasx=1;
    var yasx=0;
    var zasx=0;
    var xasy=0;
    var yasy=dcos(_xrot);
    var zasy=dsin(_xrot);
    var xasz=0;
    var yasz=-dsin(_xrot);
    var zasz=dcos(_xrot);
    var xx=xa;
    var yy=ya;
    var zz=za;
    xa=xasx*xx+yasx*yy+zasx*zz;
    ya=xasy*xx+yasy*yy+zasy*zz;
    za=xasz*xx+yasz*yy+zasz*zz;
}
{   // Y rotation
    var xasx=dcos(_yrot);
    var yasx=0;
    var zasx=-dsin(_yrot);
    var xasy=0;
    var yasy=1;
    var zasy=0;
    var xasz=dsin(_yrot);
    var yasz=0;
    var zasz=dcos(_yrot);
    var xx=xa;
    var yy=ya;
    var zz=za;
    xa=xasx*xx+yasx*yy+zasx*zz;
    ya=xasy*xx+yasy*yy+zasy*zz;
    za=xasz*xx+yasz*yy+zasz*zz;
}
{   // Z rotation
    var xasx=dcos(_zrot);
    var yasx=dsin(_zrot);
    var zasx=0;
    var xasy=-dsin(_zrot);
    var yasy=dcos(_zrot);
    var zasy=0;
    var xasz=0;
    var yasz=0;
    var zasz=1;
    var xx=xa;
    var yy=ya;
    var zz=za;
    xa=xasx*xx+yasx*yy+zasx*zz;
    ya=xasy*xx+yasy*yy+zasy*zz;
    za=xasz*xx+yasz*yy+zasz*zz;
}

var array=array_create(3);
array[vec3.xx]=xa;
array[vec3.yy]=ya;
array[vec3.zz]=za;

return array;
