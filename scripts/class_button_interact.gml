/// void class_button_interact();

// When implementing these scripts you MUST check for the button input
// IN THIS SCRIPT. It is NOT DONE AUTOMATICALLY.

if (World.ray_object!=noone&&!World.cursor_is_free&&instanceof(World.ray_object, Entity)){
    if (get_release_a()){
        with (World.ray_object){
            script_execute(interact_script);
        }
    }
}
