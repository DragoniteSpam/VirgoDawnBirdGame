/// Entity.draw_model_sign_connection();

if (argument_count==0){
    draw_model();
    if (point_distance(x, y, Player.x, Player.y)<R_SHORT*(render_distance/128)){
        d3d_set_culling(false);
        var ca=camera_angle(id);
        // @todo I'm not sure if this works?
        matrix(x, y, z+24, 90+xrot, yrot, direction, 0.25, 0.25, 0.25);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        var c=color_values[color];
        draw_text_ext_transformed_colour(0, 0, name, -1, 96, 1, 1, 0, c, c, c, c, 1);
        draw_reset_transform_stack();
        World.draw_calls++;
        d3d_set_culling(true);
    }
} else {
    draw_model(argument[0]);
}
