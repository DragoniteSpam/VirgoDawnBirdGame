/// void EventCard.draw_fire([texture]);

if (argument_count>0){
    var tex=argument[0];
} else {
    var tex=tex_default;
}

draw_model(tex);
draw_fire(tex_default, x, y, z+10);
