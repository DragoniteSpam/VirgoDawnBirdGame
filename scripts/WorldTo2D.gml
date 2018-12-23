/// array WorldTo2D(targetx, targety, targetz, xfrom, yfrom, zfrom)

var xfrom=argument3;
var yfrom=argument4;
var zfrom=argument5;
var xto=argument0;
var yto=argument1;
var zto=argument2;

var dX = Camera.xto-Camera.x;
var dY = Camera.yto-Camera.y;
var dZ = Camera.zto-Camera.z;
var mm = sqrt(dX*dX + dY*dY + dZ*dZ);
dX /= mm;
dY /= mm;
dZ /= mm;
var uX = Camera.xup;
var uY = Camera.yup;
var uZ = Camera.zup;
mm = uX*dX + uY*dY + uZ*dZ;
uX -= mm*dX;
uY -= mm*dY;
uZ -= mm*dZ;
mm = sqrt(uX*uX + uY*uY + uZ*uZ);
uX /= mm;
uY /= mm;
uZ /= mm;
var tFOV = tan(fov*pi/360);
uX *= tFOV;
uY *= tFOV;
uZ *= tFOV;
var vX = uY*dZ - dY*uZ;
var vY = uZ*dX - dZ*uX;
var vZ = uX*dY - dX*uY;
vX *= W/H;
vY *= W/H;
vZ *= W/H;

pX = argument0 - argument3;
pY = argument1 - argument4;
pZ = argument2 - argument5;
mm = pX*dX + pY*dY + pZ*dZ;

if (mm > 0){
    pX /= mm;
    pY /= mm;
    pZ /= mm;
} else {
    return array_add(2, 0);
}

mm = (pX*vX + pY*vY + pZ*vZ) / sqr((W/H)*tan(pi/8));
array[vec3.xx] = (mm+1)/2*W;
mm = (pX*uX + pY*uY + pZ*uZ) / sqr(tan(pi/8));
array[vec3.yy] = (1-mm)/2*H;

return array;
