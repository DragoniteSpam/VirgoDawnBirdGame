mouse_over_menu=true;
display_cursor=false;

// Inputs and other stuff

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

// The bio

draw_bestiary_page(index);

if (go_back){
    World.pause_is_hidden=false;
    instance_destroy();
}
