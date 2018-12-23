/// editor_apply_transformation([entity]);

if (argument_count==0){
    var obj=selected;
} else {
    var obj=argument[0];
}

var es=World.edit_snap;
if (es>0){
    with (obj){
        xstart=x;
        ystart=y;
        x=(x div es)*es;
        y=(y div es)*es;
        z=(z div es)*es;
    }
}

with (obj){
    CollisionObjectTransform(id);
}
