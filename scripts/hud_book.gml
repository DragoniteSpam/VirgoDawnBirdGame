mouse_over_menu=true;
display_cursor=false;
var go_back=get_release_b();
var scale=2.5;
var yy=HH/2-background_get_height(cover_image)/2*scale;

draw_set_color(c_black);
if (current_page==0||current_page==total_pages-1){
    if (current_page==0){
        draw_background_ext(cover_image, W/2-background_get_width(cover_image)/2*scale, yy, scale, scale, 0, c_white, 1);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_font(Font32);
        draw_text_ext(W/2, yy+128, title, -1, 160*scale);
        draw_set_font(Font16);
        draw_text_ext(W/2, yy+256, "by "+author, -1, 160*scale);
    } else {
        draw_background_ext(cover_image, W/2+background_get_width(cover_image)/2*scale, yy, -scale, scale, 0, c_white, 1);
    }
} else {
    var xx=W/2-background_get_width(cover_image)*scale;
    draw_background_ext(page_image, W/2, yy, -scale, scale, 0, c_white, 1);
    draw_background_ext(page_image, W/2, yy, scale, scale, 0, c_white, 1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_center);
    draw_set_font(Font16);
    var text=page_text[| current_page];
    var colors=page_colors[| current_page];
    for (var i=0; i<ds_list_size(text); i++){
        if (draw_get_colour()!=colors[| i]){
            draw_set_colour(colors[| i]);
        }
        draw_text_ext(xx+32, yy+64+18*i, text[| i], -1, 1000);
    }
    var text=page_text[| current_page+1];
    var colors=page_colors[| current_page+1];
    for (var i=0; i<ds_list_size(text); i++){
        if (draw_get_colour()!=colors[| i]){
            draw_set_colour(colors[| i]);
        }
        draw_text_ext(W/2+80, yy+64+18*i, text[| i], -1, 1000);
    }
}

/*if (Controller.press_a){
    var text=page_text[| current_page+1];
    for (var i=0; i<ds_list_size(text); i++){
        print(text[| i])
    }
}*/

if (Controller.press_left){
    if (current_page==total_pages-1){
        current_page--;
    } else {
        current_page=max(0, current_page-2);
    }
} else if (Controller.press_right){
    if (current_page==0){
        current_page++;
    } else {
        current_page=min(current_page+2, total_pages-1);
    }
}

if (go_back){
    World.pause_is_hidden=false;
    instance_destroy();
}
