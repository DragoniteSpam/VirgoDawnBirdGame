/// Map add_map(internal name, name, map file, is indoors?, draw water?, discovery flag, default render distance, can fly?, is main?, index);

with (instantiate(Map)){
    internal_name=argument0;
    name=argument1;
    map_file=argument2;
    is_indoors=argument3;
    draw_water=argument4;
    
    discovery=argument5;
    map_render_distance=argument6;
    can_fly=argument7;
    is_main=argument8;
    
    index=argument9;
    return id;
}
