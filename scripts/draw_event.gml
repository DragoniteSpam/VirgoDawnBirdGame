/// void Event.draw_event([texture]);

if (argument_count==0||mode==GameModes.play){
    return false;
    var tex=tex_default;
} else {
    var tex=argument[0];
}

draw_model(tex);
