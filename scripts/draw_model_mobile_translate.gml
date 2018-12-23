/// void Entity.draw_model_mobile_translate([texture], [show hidden items?], [model], [model index], [auto transform?]);

switch (argument_count){
    case 6:
        draw_model(argument[0], argument[1], argument[2], argument[3], argument[4], argument[5]);
        break;
    case 5:
        draw_model(argument[0], argument[1], argument[2], argument[3], argument[4]);
        break;
    case 4:
        draw_model(argument[0], argument[1], argument[2], argument[3]);
        break;
    case 3:
        draw_model(argument[0], argument[1], argument[2]);
        break;
    case 2:
        draw_model(argument[0], argument[1]);
        break;
    case 1:
        draw_model(argument[0]);
        break;
    case 0:
        draw_model();
        break;
}

if (World.selected==id){
    shader_set(shd_alpha);
    shader_set_alpha(0.5);
    var n=ds_list_size(stages);
    
    var vbuff=vertex_create_buffer();
    vertex_begin(vbuff, World.vertex_format_basic);
    
    for (var i=0; i<n; i++){
        var xx=stages[| i].x;
        var yy=stages[| i].y;
        var zz=stages[| i].z;
        if (!absolute){
            xx=xx+x;
            yy=yy+y;
            zz=zz+z;
        }
        matrix_set(matrix_world, matrix_build(xx, yy, zz, xrot, yrot, direction, scale, scale, scale));
        d3d_model_draw_selective(get_model_object().model_array[model_index], 0, 0, 0, World.placeholder_red, mod_package, model);
        vertex_position_3d(vbuff, xx, yy, zz);
        vertex_colour(vbuff, c_red, 0.75);
    }
    
    draw_reset_transform_stack();
    
    vertex_end(vbuff);
    if (n>1){
        vertex_submit(vbuff, pr_linestrip, -1);
    }
    
    vertex_delete_buffer(vbuff);
    shader_reset();
}
