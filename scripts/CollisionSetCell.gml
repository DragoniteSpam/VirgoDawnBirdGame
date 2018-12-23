var ts=get_timer();

var removed=0;
var added=0;
with (Entity) if (object!=noone&&deleteable){
    if (collision_loaded){
        c_world_remove_object(object);
        collision_loaded=false;
        removed++;
    }
    var lxcell=get_x_cell(id);
    var lycell=get_y_cell(id);
    if (abs(lxcell-Player.xcell)<2&&abs(lycell-Player.ycell)<2){
        c_world_add_object(object);
        collision_loaded=true;
        added++;
    }
}

World.us_cell_swap_time+=(get_timer()-ts);
++World.us_cell_swap_times;
