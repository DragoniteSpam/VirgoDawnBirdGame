var l=ds_list_create();

with (Entity){
    if (object_index==Entity){
        if (checked){
            ds_list_add(l, id);
        }
    }
}

if (ds_list_size(l)==0){
    ds_list_destroy(l);
    return false;
}

var bcx=0;
var bcy=0;
var bcz=0;
for (var i=0; i<ds_list_size(l); i++){
    bcx=bcx+l[| i].x;
    bcy=bcy+l[| i].y;
    bcz=bcz+l[| i].z;
}
bcx=bcx/ds_list_size(l);
bcy=bcy/ds_list_size(l);
bcz=bcz/ds_list_size(l);

var model=d3d_model_create();
var collision=d3d_model_create();
d3d_model_primitive_begin(model, pr_trianglelist);
d3d_model_primitive_begin(collision, pr_trianglelist);
for (var i=0; i<ds_list_size(l); i++){
    editor_save_merge_add(model, l[| i], bcx, bcy, bcz);
    editor_save_merge_add_collision(collision, l[| i], bcx, bcy, bcz);
}
d3d_model_primitive_end(model);
d3d_model_primitive_end(collision);

var fn=get_save_filename("Game Maker models|*.d3d", "model.d3d");
if (fn!=""){
    d3d_model_save(model, fn);
}
var fn2=get_save_filename("Game Maker models|*.d3d", "collision.d3d");
if (fn!=""){
    d3d_model_save(collision, fn2);
}

print("("+string(bcx)+", "+string(bcy)+", "+string(bcz)+"). Write this down!");

d3d_model_destroy(model);
d3d_model_destroy(collision);
ds_list_destroy(l);
