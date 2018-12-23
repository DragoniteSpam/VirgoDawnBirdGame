if (World.show_hud){
    
    var xx=96;
    var yy=H-96;
    var s=32;
    var c=c_green;
    
    var steps=Player.starting_flight_flaps;
    var pieces=Player.flight_flaps;
    
    if (pieces/steps>=0.5){
        c=c_green;
    } else if (pieces/steps>=0.25){
        c=c_yellow;
    } else if (pieces/steps>=0.125){
        c=c_orange;
    }
    
    draw_primitive_begin(pr_trianglefan);
    draw_vertex_colour(xx, yy, c_white, 1);
    for (var i=0; i<=pieces; i++){
        draw_vertex_colour(xx+s*dcos(i*360/steps), yy-s*dsin(i*360/steps), c, 1);
    }
    draw_primitive_end();
    
    draw_primitive_begin(pr_linelist);
    for (var i=0; i<=steps; i++){
        draw_vertex_colour(xx, yy, c_black, 1);
        draw_vertex_colour(xx+s*dcos(i*360/steps), yy-s*dsin(i*360/steps), c_black, 1);
    }
    draw_primitive_end();
    draw_sprite(spr_flight_meter_ring, 0, xx, yy);
}
