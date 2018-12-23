/// void editor_save_merge_add_collision(model, entity, barycenterx, barycentery, barycenterz);

var base=ds_map_find_value(all_mod_packages, argument1.mod_package).my_models[argument1.model];

var fn=".\"+string(argument1.model)+"_c.d3d";

if (!ds_map_exists(edit_generation_map, fn)){    
    var list=ds_list_create();
    ds_map_add(edit_generation_map, fn, list);
    // This is literally the best way of getting the vertex data. Shut up.
    d3d_model_save(base.block, fn);
    
    var f=file_text_open_read(fn);
    file_text_readln(f);
    file_text_readln(f);
    do {
        switch (file_text_read_real(f)){
            case 7:
                with (instance_create(0, 0, PointClass)){
                    x=file_text_read_real(f);
                    y=file_text_read_real(f);
                    z=file_text_read_real(f);
                    nx=file_text_read_real(f);
                    ny=file_text_read_real(f);
                    nz=file_text_read_real(f);
                    color=file_text_read_real(f);
                    alpha=file_text_read_real(f);
                    xtex=0;
                    ytex=0;
                }
                break;
            case 9:
                with (instance_create(0, 0, PointClass)){
                    x=file_text_read_real(f);
                    y=file_text_read_real(f);
                    z=file_text_read_real(f);
                    nx=file_text_read_real(f);
                    ny=file_text_read_real(f);
                    nz=file_text_read_real(f);
                    xtex=file_text_read_real(f);
                    ytex=file_text_read_real(f);
                    color=file_text_read_real(f);
                    alpha=file_text_read_real(f);
                }
                break;
            default:
                break;
        }
        if (instance_number(PointClass)==3){
            var pc1=instance_find(PointClass, 0);
            var pc2=instance_find(PointClass, 1);
            var pc3=instance_find(PointClass, 2);
            for (var i=0; i<3; i++){
                with (instance_find(PointClass, i)){
                    var point=ds_list_create();
                    ds_list_add(list, point);
                    ds_list_add(point, x, y, z, nx, ny, nz, xtex, ytex, color, alpha);
                }
            }
            with (PointClass){
                instance_destroy();
            }
        }
    } until(file_text_eof(f));
    
    file_text_close(f);
    with (PointClass){
        instance_destroy();
    }
}

var mdl=edit_generation_map[? fn];

for (var i=0; i<ds_list_size(mdl); i++){
    var point=mdl[| i];
    x=point[| 0];
    y=point[| 1];
    z=point[| 2];
    nx=point[| 3];
    ny=point[| 4];
    nz=point[| 5];
    {   // X rotation
        var xasx=1;
        var yasx=0;
        var zasx=0;
        var xasy=0;
        var yasy=dcos(argument1.xrot);
        var zasy=dsin(argument1.xrot);
        var xasz=0;
        var yasz=-dsin(argument1.xrot);
        var zasz=dcos(argument1.xrot);
        var xx=x;
        var yy=y;
        var zz=z;
        x=xasx*xx+yasx*yy+zasx*zz;
        y=xasy*xx+yasy*yy+zasy*zz;
        z=xasz*xx+yasz*yy+zasz*zz;
        var nxx=nx;
        var nyy=ny;
        var nzz=nz;
        nx=xasx*nxx+yasx*nyy+zasx*nzz;
        ny=xasy*nxx+yasy*nyy+zasy*nzz;
        nz=xasz*nxx+yasz*nyy+zasz*nzz;
    }
    {   // Y rotation
        var xasx=dcos(argument1.yrot);
        var yasx=0;
        var zasx=-dsin(argument1.yrot);
        var xasy=0;
        var yasy=1;
        var zasy=0;
        var xasz=dsin(argument1.yrot);
        var yasz=0;
        var zasz=dcos(argument1.yrot);
        var xx=x;
        var yy=y;
        var zz=z;
        x=xasx*xx+yasx*yy+zasx*zz;
        y=xasy*xx+yasy*yy+zasy*zz;
        z=xasz*xx+yasz*yy+zasz*zz;
        var nxx=nx;
        var nyy=ny;
        var nzz=nz;
        nx=xasx*nxx+yasx*nyy+zasx*nzz;
        ny=xasy*nxx+yasy*nyy+zasy*nzz;
        nz=xasz*nxx+yasz*nyy+zasz*nzz;
    }
    {   // Z rotation
        var xasx=dcos(argument1.direction);
        var yasx=dsin(argument1.direction);
        var zasx=0;
        var xasy=-dsin(argument1.direction);
        var yasy=dcos(argument1.direction);
        var zasy=0;
        var xasz=0;
        var yasz=0;
        var zasz=1;
        var xx=x;
        var yy=y;
        var zz=z;
        x=xasx*xx+yasx*yy+zasx*zz;
        y=xasy*xx+yasy*yy+zasy*zz;
        z=xasz*xx+yasz*yy+zasz*zz;
        var nxx=nx;
        var nyy=ny;
        var nzz=nz;
        nx=xasx*nxx+yasx*nyy+zasx*nzz;
        ny=xasy*nxx+yasy*nyy+zasy*nzz;
        nz=xasz*nxx+yasz*nyy+zasz*nzz;
    }
    // Translation
    x+=(argument1.x-argument2);
    y+=(argument1.y-argument3);
    z+=(argument1.z-argument4);

    d3d_model_vertex_normal_texture_colour(argument0, x, y, z, nx, ny, nz, point[| 6], point[| 7], point[| 8], point[| 9]);
}
