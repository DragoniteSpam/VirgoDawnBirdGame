/// Entity.draw_model_sign_route();

if (argument_count==0){
    draw_model();
    if (point_distance(x, y, Player.x, Player.y)<R_SHORT*(render_distance/128)){
        d3d_set_culling(false);
        var ca=camera_angle(id);
        // @todo I'm not sure if this works, either
        matrix(0, 0, 0, 90+xrot, 0, 0, 1, 1, 1);
        matrix(0, 2, 0, 0, 0, 0, 1, 1, 1);
        matrix(x, y, z+64, 0, 0, direction, 1, 1, 1);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        var c=color_values[color];
        draw_text_colour(0, 0, name, c, c, c, c, 1);
        draw_reset_transform_stack();
        World.draw_calls++;
        d3d_set_culling(true);
    }
} else {
    draw_model(argument[0]);
}
