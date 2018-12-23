/// void class_button_pause(number of event overlaps);

if (movement_free()){
    for (var i=0; i<argument0; i++){
        var obj=c_object_get_userid(c_hit_object(i));
        if (obj.alive){
            with (obj){
                interact_character();
            }
        }
    }
}
