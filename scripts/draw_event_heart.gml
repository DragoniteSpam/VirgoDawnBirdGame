/// void Event.draw_event_heart([texture, show hidden items?]);

switch (argument_count){
    case 2:
        var catch=argument[1];
    case 1:
        var catch=argument[0];
        break;
}

if (lifespan>room_speed*2||World.frames%10>5){
    var d=direction;
    direction=floor(World.frames+x+y+z);
    model=Models.extra_heart;
    matrix(x, y, z+dcos(floor(World.frames+x+y+z)), xrot, yrot, direction, 1, 1, 1);
    
    // This is hard-coded
    if (heal_full){
        model_index=1;
    } else {
        model_index=0;
    }
    
    d3d_model_draw(get_model(), 0, 0, 0, -1);
    draw_reset_transform_stack();
    direction=d;
}
