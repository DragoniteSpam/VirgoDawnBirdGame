/// void draw_location_graphic(x, y, location);

draw_background(b_location, argument0, argument1);
draw_background(all_location_icons[argument2.icon], argument0+8, argument1+8)
draw_set_color(graphics_text_color);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(Font20);
draw_text(argument0+84, argument1+32, argument2.name);
draw_set_font(Font16);
draw_text(argument0+84, argument1+56, argument2.summary);
