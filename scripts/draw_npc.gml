/// void Entity.draw_npc([texture]);

var mdl=get_model_object();
var tex=tex_default;
var show=false;
var ind=model_index;

switch (argument_count){
    case 1:
        tex=argument[0];
        break;
}

show=(Player.timer_revelation>0);  // this is the new way of doing things

// draw the npc/box
if (hidden&&!show){
} else if (draw_mode==Misc.block||draw_mode==Misc.model_and_wireframe){
    d3d_model_draw_selective(mdl.block, 0, 0, 0, -1, mod_package, model);
} else {
    var ca=camera_angle(id);
    var bw=background_get_width(all_npc_images[image]);
    var bh=background_get_height(all_npc_images[image]);
    var third_width=bw/3;
    var third_height=bh/3;
    var xscale=(bw/3)/third_width;
    var yscale=(bh/3)/third_height;
    var scale=1.35;
    var m1=matrix_build(-third_width/(2*scale), 0, z+bh/(3*scale), 90+xrot, 0, 0, 1, 1, 1);
    var m2=matrix_build(x, y, 0, 0, yrot, direction+90+90*ternary(ca==CameraAngles.side, 1, 0), 1, 1, 1);
    matrix_set(matrix_world, matrix_multiply(m1, m2));
    ///////////////
    if (hidden&&show){
        shader_set(shd_alpha_brightness);
        shader_set_uniform_f(World.shd_alpha_brightness_alpha, World.game_mode_is_debug[mode]+min(Player.timer_revelation/60, REVELATION_ALPHA));
        shader_set_uniform_f(World.shd_alpha_brightness_brightness, REVELATION_BRIGHTNESS);
    }
    d3d_primitive_begin_texture(pr_trianglelist, background_get_texture(all_npc_images[image]));
    var f=floor(frame mod 3);
    var startx=((f+1)/3)%1;
    var starty=ca/3;
    var endx=startx+1/3;
    var endy=starty+1/3;
    d3d_vertex_texture(0, 0, 0,                                 startx, starty);
    d3d_vertex_texture(third_width/scale, 0, 0,                 endx, starty);
    d3d_vertex_texture(0, third_height/scale, 0,                startx, endy);

    d3d_vertex_texture(third_width/scale, 0, 0,                 endx, starty);
    d3d_vertex_texture(third_width/scale, third_height/scale,   0,    endx, endy);
    d3d_vertex_texture(0, third_height/scale, 0,                startx, endy);
    d3d_primitive_end();
    ///////////////
    draw_reset_transform_stack();
    if (hidden&&show){
        shader_reset();
    }
    World.draw_calls++;
}

// draw the debug stuff
if (World.selected==id){
    if (argument_count==0){
        var t=World.placeholder_yellow;
    } else {
        var t=argument[0];
    }
    matrix(x, y, z, 0, 0, 0, collision_r/6, collision_r/6, collision_h/12);
    draw_model(t, true, BASE_ASSET, World.mdl_npc, 0, false);
    draw_reset_transform_stack();
    // this is the npc cage. stop trying to turn it into the npc block.
    if (movement_is_random){
        matrix(xstart, ystart, z, 0, 0, 0, movement_radius, movement_radius, 1);
        d3d_model_draw(World.m_npc_cage, 0, 0, 0, tex_default);
        draw_reset_transform_stack();
    }
    
    draw_hit_zone();
}

if (is_animating&&walking_animation){
    frame=frame+(ANIMATION_CYCLE_PER_SECOND*World.delta_time_seconds);
    frame=frame%3;
}
