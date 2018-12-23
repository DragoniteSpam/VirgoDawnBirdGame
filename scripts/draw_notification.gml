/// draw_notification();

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(Font20);

if (y>(H/2-64-32*index)){
    y=y-2;
}

draw_text_outline_dn_ext(x, y, text, c_white, c_black, 2, 1, -1, W);
