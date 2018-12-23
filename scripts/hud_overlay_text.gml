/// void hud_overlay_emote();

if (owner==noone){
    return false;
}

var array=WorldTo2D(owner.x, owner.y, owner.z+32, Camera.x, Camera.y, Camera.z);

var str=string_copy(scr_escape_sequence(text), 1, t);

var width=string_width(str);
var height=string_height(str);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_roundrect_colour(array[vec3.xx]-width/2-20, array[vec3.yy]-height-96, array[vec3.xx]+width/2+20, array[vec3.yy]-56, c_white, c_white, false); 
draw_roundrect_colour(array[vec3.xx]-width/2-20, array[vec3.yy]-height-96, array[vec3.xx]+width/2+20, array[vec3.yy]-56, c_black, c_black, true);
if (style==Misc.speech_bubble_speech){
    draw_triangle_colour(array[vec3.xx]-12, array[vec3.yy]-56, array[vec3.xx]+12, array[vec3.yy]-56, array[vec3.xx], array[vec3.yy]-32, c_white, c_white, c_white, false);
} else if (style==Misc.speech_bubble_thought){
    draw_circle_colour(array[vec3.xx]-12, array[vec3.yy]-56, 8, c_white, c_white, false);
    draw_circle_colour(array[vec3.xx]-12, array[vec3.yy]-56, 8, c_black, c_black, true);
    draw_circle_colour(array[vec3.xx], array[vec3.yy]-32, 4, c_white, c_white, false);
    draw_circle_colour(array[vec3.xx], array[vec3.yy]-32, 4, c_black, c_black, true);
}
draw_text(array[vec3.xx], array[vec3.yy]-height/2-76, str);

if (t>string_length(text)+duration){
    instance_destroy();
}

t++;

return true;
