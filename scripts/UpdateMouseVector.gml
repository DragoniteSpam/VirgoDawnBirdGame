/// void UpdateMouseVector(xfrom, yfrom, zfrom, xto, yto, zto, xup, yup, zup);
with (World){
    var mm,dX,dY,dZ,uX,uY,uZ,vX,vY,vZ,mX,mY,mZ, width, height, tFOV, asp;
    width = WW;
    height = HH;
    asp=width/height;
    
    // normalize TO vector
    dX = argument3-argument0;
    dY = argument4-argument1;
    dZ = argument5-argument2;
    mm = sqrt(dX*dX+dY*dY+dZ*dZ);
    dX /= mm;
    dY /= mm;
    dZ /= mm;
    
    // fix UP vector and normalize it
    uX = argument6;
    uY = argument7;
    uZ = argument8;
    mm = uX*dX+uY*dY+uZ*dZ;
    uX -= mm*dX;
    uY -= mm*dY;
    uZ -= mm*dZ
    mm = sqrt(uX*uX+uY*uY+uZ*uZ);
    uX /= mm;
    uY /= mm;
    uZ /= mm;
    
    
    // make x vector using TO and UP
    vX = uY*dZ-dY*uZ;
    vY = uZ*dX-dZ*uX;
    vZ = uX*dY-dX*uY;
    
    // convert angle to screen width and height
    tFOV = tan(fov*pi/360);
    uX *= tFOV;
    uY *= tFOV;
    uZ *= tFOV;
    vX *= tFOV*asp;
    vY *= tFOV*asp;
    vZ *= tFOV*asp;
    
    // add UP*MOUSE_Y and X*MOUSE_X vector to TO vector
    mX = dX+uX*(1-2*MOUSE_Y/height)+vX*(2*MOUSE_X/width-1);
    mY = dY+uY*(1-2*MOUSE_Y/height)+vY*(2*MOUSE_X/width-1);
    mZ = dZ+uZ*(1-2*MOUSE_Y/height)+vZ*(2*MOUSE_X/width-1);
    mm = sqrt(mX*mX+mY*mY+mZ*mZ);
    
    // normalize mouse direction vector
    mouse_dx=mX/mm;
    mouse_dy=mY/mm;
    mouse_dz=mZ/mm;
    
    xx=Camera.x+mouse_dx*edit_distance;
    yy=Camera.y+mouse_dy*edit_distance;
    zz=Camera.z+mouse_dz*edit_distance;
}
