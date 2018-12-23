mouse_over_menu=true;
display_cursor=false;
var go_back=get_release_b();

// The paper
var xx=WW/2-background_get_width(b_book_newsprint);
var yy=HH/2-background_get_height(b_book_newsprint);

draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0, 0, W, H, false);
draw_set_alpha(1.0);
draw_set_color(c_black);
draw_set_font(Font32);
draw_set_halign(fa_left);

draw_background_ext(b_book_newsprint, xx, yy, 2, 2, 0, c_white, 1);

if (array_length_1d(pages)==1){
    draw_set_halign(fa_center);
    draw_text_ext(W/2, H/2, "You have no bestiary pages. Go out into the world and collect some!", -1, background_get_width(b_book_ll)*1.5);
} else {
    if (page_number==0){
        draw_set_halign(fa_center);
        draw_text_ext(W/2, H/2, "Birds of New Jersey", -1, background_get_width(b_book_newsprint)*1.5);
    } else {
        draw_bestiary_page(pages[page_number-1].item_power);
    }
    draw_set_halign(fa_center);
    draw_set_halign(fa_middle);
    draw_set_font(Font12);
    draw_input(Controller.gp_bind_padr, Controller.mk_bind_padr, W-120, H-256, "Next");
    draw_input(Controller.gp_bind_padl, Controller.mk_bind_padl, W-120, H-160, "Previous");
    if (Controller.release_left||Controller.release_pleft){
        page_number=(page_number+array_length_1d(pages)-1)%array_length_1d(pages);
        if (page_number>0){
            audio_play_sound(all_birds[pages[page_number-1].item_power].cry, 1, false);
        }
    } else if (Controller.release_right||Controller.release_pright){
        page_number=(page_number+1)%array_length_1d(pages);
        if (page_number>0){
            audio_play_sound(all_birds[pages[page_number-1].item_power].cry, 1, false);
        }
    }
}

draw_input(Controller.gp_bind_b, Controller.mk_bind_b, W-120, H-64, "Back");

if (go_back){
    World.pause_is_hidden=false;
    instance_destroy();
}
