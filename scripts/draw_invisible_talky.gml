/// void Entity.draw_invisible_talky([texture]);

if (argument_count>0){
    var t=argument[0];
} else {
    var t=tex_default;
}

if (mode==GameModes.edit_object){
    draw_model(t, false, mod_package, model, 0);
}
