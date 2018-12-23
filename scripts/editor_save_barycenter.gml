var bcx=0;
var bcy=0;
var bcz=0;
var n=0;

with (Entity){
    if (object_index==Entity){
        if (checked){
            bcx=bcx+l[| n].x;
            bcy=bcy+l[| n].y;
            bcz=bcz+l[| n].z;
            n++;
        }
    }
}

bcx=bcx/n;
bcy=bcy/n;
bcz=bcz/n;

print(string(bcx)+', '+string(bcy)+', '+string(bcz))
