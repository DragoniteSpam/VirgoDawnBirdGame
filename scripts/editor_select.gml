/// reflexive editor_select(entity);

with (World){
    if (instanceof(argument0, Selectable)){
        if (selected==argument0){
            selected=noone;
        } else {
            selected=argument0;
        }
        
        if (selected!=noone){
            if (mode!=argument0.editor_page){
                edit_menu_start=0;
            }
            mode=argument0.editor_page;
            var d=object_distance_3d(Camera, selected);
            if (d!=noone){
                edit_distance=d;
            }
        }
        edit_is_moving=false;
        return argument0;
    }
}

return noone;
