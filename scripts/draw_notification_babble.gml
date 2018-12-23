/// draw_notification();

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(Font20);

var r=16;
var str=string_copy(text, 1, t++);
var x1=x-r-string_width(str);
var y1=y-r-string_height(str);
var x2=x+r+string_width(str);
var y2=y+r+string_height(str);

draw_rectangle_texture_auto(x1, y1, x2, y2, true);

draw_text(x, y, str);
