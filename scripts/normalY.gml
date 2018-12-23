#define normalY
/// double normalY(x1, y1, z1, x2, y2, z2, x3, y3, z3)

var v1x=argument3-argument0;
var v1y=argument4-argument1;
var v1z=argument5-argument2;
var v2x=argument6-argument0;
var v2y=argument7-argument1;
var v2z=argument8-argument2;

var cx=v1y*v2z-v1z*v2y;
var cy=-v1x*v2z+v1z*v2x;
var cz=v1x*v2y-v1y*v2x;

var cpl=sqrt(cx*cx+cy*cy+cz*cz);

if (cpl!=0)
    return cy/cpl;
return 0;

#define normalYPoint
/// double normalYPoint(p1, p2, p3);
// Can take any objects with an x, y and z value.

return normalY(argument0.x, argument0.y, argument0.z,
    argument1.x, argument1.y, argument1.z,
    argument2.x, argument2.y, argument2.z);